/*
 * Filename: theme_preferences_service.dart
 * Purpose: Manages theme mode preferences (light/dark/auto) with persistent storage
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: shared_preferences, flutter/material.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - Theme Preferences Service
class ThemePreferencesService {
  static const String _themeModeKey = 'theme_mode';
  static ThemeMode _cachedThemeMode = ThemeMode.system;
  static bool _initialized = false;

  // MARK: - Initialization
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeString = prefs.getString(_themeModeKey);

      if (themeModeString != null) {
        _cachedThemeMode = _parseThemeMode(themeModeString);
        Logger.logInfo(
          'Theme preferences loaded: ${_cachedThemeMode.toString()}',
          tag: 'ThemePreferencesService',
        );
      } else {
        // Default to system theme
        _cachedThemeMode = ThemeMode.system;
        Logger.logInfo(
          'Theme preferences initialized with system default',
          tag: 'ThemePreferencesService',
        );
      }

      _initialized = true;
    } catch (e) {
      Logger.logError(
        'Failed to initialize theme preferences',
        error: e,
        tag: 'ThemePreferencesService',
      );
      // Fallback to system theme
      _cachedThemeMode = ThemeMode.system;
      _initialized = true;
    }
  }

  // MARK: - Theme Mode Getters
  static ThemeMode get themeMode {
    if (!_initialized) {
      Logger.logWarning(
        'Theme preferences not initialized, returning system default',
        tag: 'ThemePreferencesService',
      );
      return ThemeMode.system;
    }
    return _cachedThemeMode;
  }

  // MARK: - Theme Mode Setters
  static Future<void> setThemeMode(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeModeKey, _themeModeToString(mode));
      _cachedThemeMode = mode;

      Logger.logInfo(
        'Theme mode updated to: ${mode.toString()}',
        tag: 'ThemePreferencesService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to save theme mode preference',
        error: e,
        tag: 'ThemePreferencesService',
      );
    }
  }

  // MARK: - Theme Mode Conversion Helpers
  static ThemeMode _parseThemeMode(String value) {
    switch (value.toLowerCase()) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  static String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  // MARK: - Theme Mode Labels
  static String getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'Auto';
    }
  }

  // MARK: - Reset to Default
  static Future<void> resetToDefault() async {
    await setThemeMode(ThemeMode.system);
  }
}

// Suggestions For Features and Additions Later:
// - Add custom theme color preferences
// - Implement theme scheduling (auto dark mode at night)
// - Add theme transition animations
// - Create theme presets (high contrast, reduced motion)
// - Add per-screen theme overrides
// - Implement theme sync across devices

