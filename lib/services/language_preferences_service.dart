/*
 * Filename: language_preferences_service.dart
 * Purpose: Manages language/locale preferences with persistent storage
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: shared_preferences, flutter/material.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - Language Preferences Service
class LanguagePreferencesService {
  static const String _localeKey = 'selected_locale';
  static Locale? _cachedLocale;
  static bool _initialized = false;

  // MARK: - Common Languages List
  // List of most commonly used languages with their display names
  static const List<LanguageOption> commonLanguages = [
    LanguageOption(Locale('en'), 'English', 'English'),
    LanguageOption(Locale('es'), 'Español', 'Spanish'),
    LanguageOption(Locale('zh'), '中文', 'Chinese'),
    LanguageOption(Locale('zh', 'CN'), '简体中文', 'Simplified Chinese'),
    LanguageOption(Locale('fr'), 'Français', 'French'),
    LanguageOption(Locale('de'), 'Deutsch', 'German'),
    LanguageOption(Locale('ja'), '日本語', 'Japanese'),
    LanguageOption(Locale('pt'), 'Português', 'Portuguese'),
    LanguageOption(Locale('ru'), 'Русский', 'Russian'),
    LanguageOption(Locale('ar'), 'العربية', 'Arabic'),
    LanguageOption(Locale('hi'), 'हिन्दी', 'Hindi'),
    LanguageOption(Locale('ko'), '한국어', 'Korean'),
    LanguageOption(Locale('it'), 'Italiano', 'Italian'),
    LanguageOption(Locale('tr'), 'Türkçe', 'Turkish'),
    LanguageOption(Locale('pl'), 'Polski', 'Polish'),
    LanguageOption(Locale('nl'), 'Nederlands', 'Dutch'),
    LanguageOption(Locale('sv'), 'Svenska', 'Swedish'),
    LanguageOption(Locale('vi'), 'Tiếng Việt', 'Vietnamese'),
    LanguageOption(Locale('th'), 'ไทย', 'Thai'),
    LanguageOption(Locale('id'), 'Bahasa Indonesia', 'Indonesian'),
    LanguageOption(Locale('cs'), 'Čeština', 'Czech'),
    LanguageOption(Locale('ro'), 'Română', 'Romanian'),
    LanguageOption(Locale('hu'), 'Magyar', 'Hungarian'),
    LanguageOption(Locale('fi'), 'Suomi', 'Finnish'),
    LanguageOption(Locale('da'), 'Dansk', 'Danish'),
    LanguageOption(Locale('no'), 'Norsk', 'Norwegian'),
    LanguageOption(Locale('el'), 'Ελληνικά', 'Greek'),
    LanguageOption(Locale('he'), 'עברית', 'Hebrew'),
    LanguageOption(Locale('uk'), 'Українська', 'Ukrainian'),
    LanguageOption(Locale('bg'), 'Български', 'Bulgarian'),
  ];

  // MARK: - Initialization
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      final localeString = prefs.getString(_localeKey);

      if (localeString != null) {
        _cachedLocale = _parseLocale(localeString);
        Logger.logInfo(
          'Language preferences loaded: ${_cachedLocale.toString()}',
          tag: 'LanguagePreferencesService',
        );
      } else {
        // Default to system locale (null means use system default)
        _cachedLocale = null;
        Logger.logInfo(
          'Language preferences initialized with system default',
          tag: 'LanguagePreferencesService',
        );
      }

      _initialized = true;
    } catch (e) {
      Logger.logError(
        'Failed to initialize language preferences',
        error: e,
        tag: 'LanguagePreferencesService',
      );
      // Fallback to system locale
      _cachedLocale = null;
      _initialized = true;
    }
  }

  // MARK: - Locale Getters
  static Locale? get locale {
    if (!_initialized) {
      Logger.logWarning(
        'Language preferences not initialized, returning system default',
        tag: 'LanguagePreferencesService',
      );
      return null;
    }
    return _cachedLocale;
  }

  // MARK: - Locale Setters
  static Future<void> setLocale(Locale? locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (locale == null) {
        await prefs.remove(_localeKey);
        _cachedLocale = null;
        Logger.logInfo(
          'Language reset to system default',
          tag: 'LanguagePreferencesService',
        );
      } else {
        final localeString = _localeToString(locale);
        await prefs.setString(_localeKey, localeString);
        _cachedLocale = locale;
        Logger.logInfo(
          'Language updated to: ${locale.toString()}',
          tag: 'LanguagePreferencesService',
        );
      }
    } catch (e) {
      Logger.logError(
        'Failed to save language preference',
        error: e,
        tag: 'LanguagePreferencesService',
      );
    }
  }

  // MARK: - Locale Conversion Helpers
  static Locale _parseLocale(String value) {
    final parts = value.split('_');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    } else if (parts.length == 1) {
      return Locale(parts[0]);
    }
    return const Locale('en');
  }

  static String _localeToString(Locale locale) {
    if (locale.countryCode != null) {
      return '${locale.languageCode}_${locale.countryCode}';
    }
    return locale.languageCode;
  }

  // MARK: - Language Option Helpers
  static LanguageOption? getLanguageOptionForLocale(Locale? locale) {
    if (locale == null) return null;
    
    for (final option in commonLanguages) {
      if (option.locale.languageCode == locale.languageCode) {
        if (locale.countryCode != null) {
          if (option.locale.countryCode == locale.countryCode) {
            return option;
          }
        } else {
          return option;
        }
      }
    }
    return null;
  }

  // MARK: - Reset to Default
  static Future<void> resetToDefault() async {
    await setLocale(null);
  }
}

// MARK: - Language Option Model
class LanguageOption {
  final Locale locale;
  final String nativeName;
  final String englishName;

  const LanguageOption(this.locale, this.nativeName, this.englishName);

  String get displayName => '$nativeName ($englishName)';
}

// Suggestions For Features and Additions Later:
// - Add language search/filter functionality
// - Implement language detection from device settings
// - Add support for regional variants (e.g., en_US, en_GB)
// - Create language learning mode (show both native and English names)
// - Add recently used languages list
// - Implement language-specific font preferences
// - Add RTL (right-to-left) language support indicators

