/*
 * Filename: app_info_dialog_service.dart
 * Purpose: Manages app info dialog display status (shown once after ATT)
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: shared_preferences
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - App Info Dialog Service
class AppInfoDialogService {
  static const String _dialogShownKey = 'app_info_dialog_shown';
  static bool? _cachedDialogShown;
  static bool _initialized = false;
  
  // Public getter to check if service is initialized
  static bool get isInitialized => _initialized;

  // MARK: - Initialization
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      _cachedDialogShown = prefs.getBool(_dialogShownKey) ?? false;

      Logger.logInfo(
        'App info dialog status loaded: $_cachedDialogShown',
        tag: 'AppInfoDialogService',
      );

      _initialized = true;
    } catch (e) {
      Logger.logError(
        'Failed to initialize app info dialog service',
        error: e,
        tag: 'AppInfoDialogService',
      );
      // Default to not shown if there's an error
      _cachedDialogShown = false;
      _initialized = true;
    }
  }

  // MARK: - Dialog Status Getters
  static bool get dialogShown {
    if (!_initialized) {
      Logger.logWarning(
        'App info dialog service not initialized, returning false',
        tag: 'AppInfoDialogService',
      );
      return false;
    }
    return _cachedDialogShown ?? false;
  }

  // MARK: - Dialog Status Setters
  static Future<void> markDialogAsShown() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_dialogShownKey, true);
      _cachedDialogShown = true;

      Logger.logInfo(
        'App info dialog marked as shown',
        tag: 'AppInfoDialogService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to mark app info dialog as shown',
        error: e,
        tag: 'AppInfoDialogService',
      );
    }
  }

  // MARK: - Reset Dialog Status
  static Future<void> resetDialogStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_dialogShownKey);
      _cachedDialogShown = false;

      Logger.logInfo(
        'App info dialog status reset',
        tag: 'AppInfoDialogService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to reset app info dialog status',
        error: e,
        tag: 'AppInfoDialogService',
      );
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add dialog version tracking for future updates
// - Implement dialog shown timestamp tracking
// - Add analytics tracking for dialog dismissal
// - Create ability to show dialog again from settings
// - Add support for multiple info dialogs
// - Implement dialog content versioning

