/*
 * Filename: tracking_preferences_service.dart
 * Purpose: Manages ad tracking permission preferences with persistent storage
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: shared_preferences
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - Tracking Preferences Service
class TrackingPreferencesService {
  static const String _trackingEnabledKey = 'ad_tracking_enabled';
  static bool? _cachedTrackingEnabled;
  static bool _initialized = false;

  // MARK: - Initialization
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      // Default to null (not set) - will request permission on first launch
      _cachedTrackingEnabled = prefs.getBool(_trackingEnabledKey);

      Logger.logInfo(
        'Tracking preferences loaded: ${_cachedTrackingEnabled ?? "not set"}',
        tag: 'TrackingPreferencesService',
      );

      _initialized = true;
    } catch (e) {
      Logger.logError(
        'Failed to initialize tracking preferences',
        error: e,
        tag: 'TrackingPreferencesService',
      );
      // Fallback to null (not set)
      _cachedTrackingEnabled = null;
      _initialized = true;
    }
  }

  // MARK: - Tracking Enabled Getters
  /// Returns true if tracking is enabled, false if disabled, null if not set
  static bool? get trackingEnabled {
    if (!_initialized) {
      Logger.logWarning(
        'Tracking preferences not initialized, returning null',
        tag: 'TrackingPreferencesService',
      );
      return null;
    }
    return _cachedTrackingEnabled;
  }

  /// Returns true if user has explicitly set a preference (enabled or disabled)
  static bool get hasUserPreference {
    return _cachedTrackingEnabled != null;
  }

  // MARK: - Tracking Enabled Setters
  static Future<void> setTrackingEnabled(bool enabled) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_trackingEnabledKey, enabled);
      _cachedTrackingEnabled = enabled;

      Logger.logInfo(
        'Tracking preference updated to: $enabled',
        tag: 'TrackingPreferencesService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to save tracking preference',
        error: e,
        tag: 'TrackingPreferencesService',
      );
    }
  }

  // MARK: - Reset to Default
  static Future<void> resetToDefault() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_trackingEnabledKey);
      _cachedTrackingEnabled = null;

      Logger.logInfo(
        'Tracking preference reset to default',
        tag: 'TrackingPreferencesService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to reset tracking preference',
        error: e,
        tag: 'TrackingPreferencesService',
      );
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add analytics tracking for preference changes
// - Implement per-ad-type tracking preferences
// - Add tracking preference sync across devices
// - Create detailed tracking preference explanations
// - Add support for granular tracking controls
// - Implement tracking preference expiration/reset

