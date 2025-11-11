/*
 * Filename: main.dart
 * Purpose: Main entry point for Infinitum LIVE Creator Network app
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, app_config.dart, screens/home_screen.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/core/version_manager.dart';
import 'package:infinitum_live_creator_network/screens/splash_screen.dart';
import 'package:infinitum_live_creator_network/services/theme_preferences_service.dart';
import 'package:infinitum_live_creator_network/theme/app_theme.dart';

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
  
  // Run app immediately
  runApp(const InfinitumLiveApp());
}

// MARK: - Service Initialization
void _initializeServices() {
  // Run async initialization without blocking
  Future.microtask(() async {
    try {
      await VersionManager.initialize();
      await ThemePreferencesService.initialize();
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

// MARK: - Main App Widget
class InfinitumLiveApp extends StatefulWidget {
  const InfinitumLiveApp({super.key});

  @override
  State<InfinitumLiveApp> createState() => _InfinitumLiveAppState();
}

class _InfinitumLiveAppState extends State<InfinitumLiveApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    // Load theme in background
    Future.microtask(() {
      try {
        final themeMode = ThemePreferencesService.themeMode;
        if (mounted) {
          setState(() {
            _themeMode = themeMode;
          });
        }
      } catch (e) {
        debugPrint('Theme load error: $e');
      }
    });
  }

  void _updateThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
    ThemePreferencesService.setThemeMode(mode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
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

