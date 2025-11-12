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
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/core/version_manager.dart';
import 'package:infinitum_live_creator_network/screens/splash_screen.dart';
import 'package:infinitum_live_creator_network/services/preload_service.dart';
import 'package:infinitum_live_creator_network/services/theme_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/language_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/terms_acceptance_service.dart';
import 'package:infinitum_live_creator_network/services/tracking_preferences_service.dart';
import 'package:infinitum_live_creator_network/theme/app_theme.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
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
      // Initialize AdMob (only on iOS and Android, not web)
      if (PlatformUtil.isMobile) {
        await _initializeAdMob();
      }
      
      await VersionManager.initialize();
      await ThemePreferencesService.initialize();
      await LanguagePreferencesService.initialize();
      await TermsAcceptanceService.initialize();
      await TrackingPreferencesService.initialize();
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
    await MobileAds.instance.initialize();
    
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

