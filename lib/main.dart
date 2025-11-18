/*
 * Filename: main.dart
 * Purpose: Main entry point for Infinitum LIVE Creator Network app
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, google_mobile_ads.dart, app_config.dart, screens/home_screen.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:async';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb, PlatformDispatcher;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';

// Conditional import: use real package on mobile, stub on web
import 'package:google_mobile_ads/google_mobile_ads.dart' as google_mobile_ads
    if (dart.library.html) 'package:infinitum_live_creator_network/main_stub.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/core/version_manager.dart';
import 'package:infinitum_live_creator_network/screens/splash_screen.dart';
import 'package:infinitum_live_creator_network/services/preload_service.dart';
import 'package:infinitum_live_creator_network/services/theme_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/language_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/terms_acceptance_service.dart';
import 'package:infinitum_live_creator_network/services/tracking_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/app_info_dialog_service.dart';
import 'package:infinitum_live_creator_network/theme/app_theme.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
import 'package:infinitum_live_creator_network/utils/tracking_permission_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_info_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:infinitum_live_creator_network/l10n/app_localizations.dart';

// MARK: - Main Application Entry Point
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set up error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint('Flutter Error: ${details.exception}');
    if (kDebugMode) {
      FlutterError.presentError(details);
    }
  };
  
  // Handle platform errors
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Platform Error: $error');
    return true;
  };
  
  // Initialize services in background (non-blocking)
  _initializeServices();
  
  // Pre-load data immediately in background
  _preloadData();
  
  // Run app immediately
  runApp(const InfinitumLiveApp());
}

// MARK: - Service Initialization
void _initializeServices() {
  // Run async initialization without blocking
  Future.microtask(() async {
    try {
      // Initialize non-tracking services first
      await VersionManager.initialize();
      await ThemePreferencesService.initialize();
      await LanguagePreferencesService.initialize();
      await TermsAcceptanceService.initialize();
      await TrackingPreferencesService.initialize();
      await AppInfoDialogService.initialize();
      
      // On iOS, wait for ATT permission to be determined before initializing AdMob
      // This ensures compliance with Apple's requirement that ATT appears BEFORE tracking
      if (PlatformUtil.isMobile) {
        if (PlatformUtil.isIOS) {
          // Wait for ATT status to be determined (either granted or denied)
          // The ATT prompt is triggered in AppDelegate.swift on app launch
          await _waitForATTStatusAndInitializeAdMob();
        } else {
          // Android doesn't require ATT, initialize AdMob immediately
          await _initializeAdMob();
          // Show app info dialog on Android after a short delay
          await Future.delayed(const Duration(milliseconds: 1000));
          _showAppInfoDialogIfNeeded();
        }
      }
      
      await PreloadService().initialize();
      Logger.logInfo('All services initialized successfully', tag: 'Main');
    } catch (e, stackTrace) {
      Logger.logError(
        'Failed to initialize services',
        error: e,
        stackTrace: stackTrace,
        tag: 'Main',
      );
      // Don't rethrow - app should continue even if services fail
    }
  });
}

// MARK: - ATT Status Waiting and AdMob Initialization
/// Waits for ATT permission status to be determined, then initializes AdMob
/// This ensures ATT prompt appears BEFORE any tracking/ad SDK initialization
/// The ATT prompt is triggered automatically in AppDelegate.swift on app launch
Future<void> _waitForATTStatusAndInitializeAdMob() async {
  try {
    // Check current ATT status via method channel
    // The ATT prompt is triggered in AppDelegate.swift, so we wait for it to complete
    const methodChannel = MethodChannel('com.infinitumimageryllc.infinitumlive/tracking');
    
    int? currentStatus;
    try {
      currentStatus = await methodChannel.invokeMethod<int>('getTrackingStatus');
    } catch (e) {
      Logger.logInfo('Method channel not ready yet, will wait for ATT status...', tag: 'Main');
    }
    
    // If status is null or 0 (notDetermined), wait for user to respond to ATT prompt
    if (currentStatus == null || currentStatus == 0) {
      Logger.logInfo('ATT status not determined yet, waiting for user response...', tag: 'Main');
      
      // Wait up to 10 seconds for ATT status to be determined
      // User typically responds within 1-2 seconds
      for (int i = 0; i < 20; i++) {
        await Future.delayed(const Duration(milliseconds: 500));
        
        // Check status again via method channel
        try {
          final status = await methodChannel.invokeMethod<int>('getTrackingStatus');
          
          if (status != null && status != 0) {
            // Status determined (authorized=3, denied=2, or restricted=1)
            Logger.logInfo('ATT status determined: $status', tag: 'Main');
            break;
          }
        } catch (e) {
          // Method channel might not be ready yet, continue waiting
        }
      }
    } else {
      Logger.logInfo('ATT status already determined: $currentStatus', tag: 'Main');
    }
    
    // Now initialize AdMob (regardless of ATT status - AdMob handles denied status gracefully)
    await _initializeAdMob();
    
    // Show app info dialog after ATT is handled (iOS only)
    // Small delay to ensure UI is ready
    await Future.delayed(const Duration(milliseconds: 500));
    _showAppInfoDialogIfNeeded();
  } catch (e, stackTrace) {
    Logger.logError(
      'Error waiting for ATT status',
      error: e,
      stackTrace: stackTrace,
      tag: 'Main',
    );
    // Still try to initialize AdMob even if ATT check fails
    await _initializeAdMob();
    // Still try to show dialog even if ATT check fails
    await Future.delayed(const Duration(milliseconds: 500));
    _showAppInfoDialogIfNeeded();
  }
}

// MARK: - AdMob Initialization
Future<void> _initializeAdMob() async {
  try {
    // Skip if on web
    if (kIsWeb) {
      return;
    }
    
    // Get the appropriate app ID based on platform
    final appId = PlatformUtil.isIOS 
        ? AppConfig.iosAdMobAppId 
        : PlatformUtil.isAndroid 
            ? AppConfig.androidAdMobAppId 
            : null;
    
    if (appId == null) {
      Logger.logInfo('Unknown platform, skipping AdMob initialization', tag: 'Main');
      return;
    }
    
    // Initialize Mobile Ads SDK
    // Note: On iOS, this should only be called AFTER ATT permission is requested
    // AdMob will respect the user's ATT choice automatically
    await google_mobile_ads.MobileAds.instance.initialize();
    
    Logger.logInfo('AdMob initialized successfully with app ID: $appId', tag: 'Main');
  } catch (e, stackTrace) {
    Logger.logError(
      'Failed to initialize AdMob',
      error: e,
      stackTrace: stackTrace,
      tag: 'Main',
    );
    // Don't rethrow - app should continue even if AdMob fails
  }
}

// MARK: - Data Preloading
void _preloadData() {
  // Pre-load all data in background immediately
  Future.microtask(() async {
    try {
      await PreloadService().preloadAll();
    } catch (e) {
      Logger.logError('Failed to preload data', error: e, tag: 'Main');
      // Don't block app startup if preload fails
    }
  });
}

// MARK: - Global Navigator Key
/// Global navigator key to access navigator from anywhere in the app
/// Used to show dialogs after ATT is handled
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// MARK: - Show App Info Dialog Helper
/// Shows the app info dialog if it hasn't been shown before
void _showAppInfoDialogIfNeeded() {
  try {
    final navigator = navigatorKey.currentState;
    if (navigator != null && navigator.mounted) {
      final context = navigator.context;
      if (context != null) {
        AppInfoDialog.showIfNeeded(context);
      }
    } else {
      // Navigator not ready yet, try again after a delay
      Future.delayed(const Duration(milliseconds: 1000), () {
        _showAppInfoDialogIfNeeded();
      });
    }
  } catch (e) {
    Logger.logError(
      'Failed to show app info dialog',
      error: e,
      tag: 'Main',
    );
  }
}

// MARK: - Main App Widget
class InfinitumLiveApp extends StatefulWidget {
  const InfinitumLiveApp({super.key});

  @override
  State<InfinitumLiveApp> createState() => _InfinitumLiveAppState();
}

class _InfinitumLiveAppState extends State<InfinitumLiveApp> {
  ThemeMode _themeMode = ThemeMode.system;
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    // Load preferences in background
    Future.microtask(() {
      try {
        final themeMode = ThemePreferencesService.themeMode;
        final locale = LanguagePreferencesService.locale;
        if (mounted) {
          setState(() {
            _themeMode = themeMode;
            _locale = locale;
          });
        }
      } catch (e) {
        debugPrint('Preferences load error: $e');
      }
    });
  }

  void _updateThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
    ThemePreferencesService.setThemeMode(mode);
  }

  void _updateLocale(Locale? locale) {
    setState(() {
      _locale = locale;
    });
    LanguagePreferencesService.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      // Localization support
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('af'), // Afrikaans
        Locale('ain'), // Ainu
        Locale('ak'), // Akan
        Locale('sq'), // Albanian
        Locale('am'), // Amharic
        Locale('ar'), // Arabic
        Locale('arc'), // Aramaic
        Locale('hy'), // Armenian
        Locale('as'), // Assamese
        Locale('tay'), // Atayal
        Locale('ay'), // Aymara
        Locale('az'), // Azerbaijani
        Locale('ban'), // Balinese
        Locale('bm'), // Bambara
        Locale('bn'), // Bengali
        Locale('bho'), // Bhojpuri
        Locale('bcl'), // Bikol
        Locale('bi'), // Bislama
        Locale('bs'), // Bosnian
        Locale('brh'), // Brahui
        Locale('bg'), // Bulgarian
        Locale('my'), // Burmese
        Locale('yue'), // Cantonese
        Locale('ca'), // Catalan
        Locale('ceb'), // Cebuano
        Locale('ch'), // Chamorro
        Locale('chy'), // Cheyenne
        Locale('ny'), // Chichewa
        Locale('zh'), // Chinese
        Locale('zh', 'CN'), // Mandarin Chinese (zh_CN)
        Locale('cho'), // Choctaw
        Locale('chk'), // Chuukese
        Locale('cr'), // Cree
        Locale('hr'), // Croatian
        Locale('cs'), // Czech
        Locale('da'), // Danish
        Locale('prs'), // Dari
        Locale('nl'), // Dutch
        Locale('dz'), // Dzongkha
        Locale('et'), // Estonian
        Locale('fj'), // Fijian
        Locale('fil'), // Filipino
        Locale('fi'), // Finnish
        Locale('fr'), // French
        Locale('ff'), // Fula
        Locale('gd'), // Gaelic
        Locale('gl'), // Galician
        Locale('ka'), // Georgian
        Locale('de'), // German
        Locale('el'), // Greek
        Locale('gu'), // Gujarati
        Locale('ht'), // Haitian Creole
        Locale('hak'), // Hakka Chinese
        Locale('haw'), // Hawaiian
        Locale('he'), // Hebrew
        Locale('hi'), // Hindi
        Locale('ho'), // Hiri Motu
        Locale('hmn'), // Hmong
        Locale('nan'), // Hokkien
        Locale('hu'), // Hungarian
        Locale('iba'), // Iban
        Locale('is'), // Icelandic
        Locale('ig'), // Igbo
        Locale('ilo'), // Ilocano
        Locale('id'), // Indonesian
        Locale('iu'), // Inuktitut
        Locale('ga'), // Irish Gaelic
        Locale('it'), // Italian
        Locale('ja'), // Japanese
        Locale('jv'), // Javanese
        Locale('kn'), // Kannada
        Locale('pam'), // Kapampangan/Pampangan
        Locale('kar'), // Karen
        Locale('ks'), // Kashmiri
        Locale('kk'), // Kazakh
        Locale('km'), // Khmer
        Locale('rw'), // Kinyarwanda
        Locale('rn'), // Kirundi
        Locale('ko'), // Korean
        Locale('ku'), // Kurdish
        Locale('lo'), // Lao
        Locale('la'), // Latin
        Locale('lv'), // Latvian
        Locale('lt'), // Lithuanian
        Locale('lg'), // Luganda
        Locale('luo'), // Luo
        Locale('lb'), // Luxembourgish
        Locale('mk'), // Macedonian
        Locale('ms'), // Malay
        Locale('ml'), // Malayalam
        Locale('mt'), // Maltese
        Locale('mi'), // Maori
        Locale('mrw'), // Maranao
        Locale('mr'), // Marathi
        Locale('mh'), // Marshallese
        Locale('myn'), // Mayan Languages
        Locale('ium'), // Mien
        Locale('mn'), // Mongolian
        Locale('nah'), // Nahuatl
        Locale('na'), // Nauruan
        Locale('nv'), // Navajo
        Locale('ne'), // Nepali
        Locale('niu'), // Niuean
        Locale('no'), // Norwegian
        Locale('oj'), // Ojibwe
        Locale('pag'), // Pangasinan
        Locale('pap'), // Papiamento
        Locale('fa'), // Persian
        Locale('pl'), // Polish
        Locale('pt'), // Portuguese
        Locale('pa'), // Punjabi
        Locale('qu'), // Quechua
        Locale('rap'), // Rapa Nui
        Locale('ro'), // Romanian
        Locale('ru'), // Russian
        Locale('sm'), // Samoan
        Locale('sa'), // Sanskrit
        Locale('sr'), // Serbian
        Locale('sn'), // Shona
        Locale('sd'), // Sindhi
        Locale('si'), // Sinhala
        Locale('sk'), // Slovak
        Locale('sl'), // Slovenian
        Locale('so'), // Somali
        Locale('es'), // Spanish
        Locale('sw'), // Swahili
        Locale('sv'), // Swedish
        Locale('tl'), // Tagalog
        Locale('ty'), // Tahitian
        Locale('ta'), // Tamil
        Locale('tsg'), // Tausug
        Locale('te'), // Telugu
        Locale('tet'), // Tetum
        Locale('th'), // Thai
        Locale('bo'), // Tibetan
        Locale('ti'), // Tigrinya
        Locale('tpi'), // Tok Pisin
        Locale('tkl'), // Tokelauan
        Locale('to'), // Tongan
        Locale('tn'), // Tswana
        Locale('tr'), // Turkish
        Locale('tk'), // Turkmen
        Locale('ug'), // Uighur
        Locale('uk'), // Ukrainian
        Locale('ur'), // Urdu
        Locale('uz'), // Uzbek
        Locale('vi'), // Vietnamese
        Locale('war'), // Waray
        Locale('cy'), // Welsh
        Locale('wuu'), // Wu Chinese
        Locale('xh'), // Xhosa
        Locale('yap'), // Yapese
        Locale('yi'), // Yiddish
        Locale('yo'), // Yoruba
        Locale('zap'), // Zapotec
        Locale('zu'), // Zulu
      ],
      // Performance optimizations
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            // Enable smooth scrolling
            textScaler: MediaQuery.of(context).textScaler.clamp(
              minScaleFactor: 0.8,
              maxScaleFactor: 1.2,
            ),
          ),
          child: child!,
        );
      },
      home: SplashScreen(
        onThemeModeChanged: _updateThemeMode,
        onLocaleChanged: _updateLocale,
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add push notifications for new announcements
// - Implement offline caching for announcements and statistics
// - Add share functionality for announcements
// - Create detailed creator profile pages
// - Add search functionality for announcements
// - Implement pull-to-refresh on all data screens
// - Add analytics tracking for user engagement
// - Create admin panel for content management
// - Add support for multiple languages/localization
// - Implement app update checker

