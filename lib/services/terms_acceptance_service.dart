/*
 * Filename: terms_acceptance_service.dart
 * Purpose: Manages terms of service and privacy policy acceptance status
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: shared_preferences
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - Terms Acceptance Service
class TermsAcceptanceService {
  static const String _termsAcceptedKey = 'terms_accepted';
  static const String _termsAcceptedVersionKey = 'terms_accepted_version';
  static bool? _cachedTermsAccepted;
  static bool _initialized = false;

  // Current version of terms - increment this if terms change
  static const String currentTermsVersion = '1.0.0';

  // MARK: - Initialization
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      _cachedTermsAccepted = prefs.getBool(_termsAcceptedKey) ?? false;
      final acceptedVersion = prefs.getString(_termsAcceptedVersionKey);

      // If terms were accepted but version changed, require re-acceptance
      if (_cachedTermsAccepted == true && acceptedVersion != currentTermsVersion) {
        _cachedTermsAccepted = false;
        Logger.logInfo(
          'Terms version changed, requiring re-acceptance',
          tag: 'TermsAcceptanceService',
        );
      }

      Logger.logInfo(
        'Terms acceptance status loaded: $_cachedTermsAccepted',
        tag: 'TermsAcceptanceService',
      );

      _initialized = true;
    } catch (e) {
      Logger.logError(
        'Failed to initialize terms acceptance service',
        error: e,
        tag: 'TermsAcceptanceService',
      );
      // Default to not accepted if there's an error
      _cachedTermsAccepted = false;
      _initialized = true;
    }
  }

  // MARK: - Terms Acceptance Getters
  static bool get termsAccepted {
    if (!_initialized) {
      Logger.logWarning(
        'Terms acceptance service not initialized, returning false',
        tag: 'TermsAcceptanceService',
      );
      return false;
    }
    return _cachedTermsAccepted ?? false;
  }

  // MARK: - Terms Acceptance Setters
  static Future<void> acceptTerms() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_termsAcceptedKey, true);
      await prefs.setString(_termsAcceptedVersionKey, currentTermsVersion);
      _cachedTermsAccepted = true;

      Logger.logInfo(
        'Terms accepted (version: $currentTermsVersion)',
        tag: 'TermsAcceptanceService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to save terms acceptance',
        error: e,
        tag: 'TermsAcceptanceService',
      );
    }
  }

  // MARK: - Reset Terms Acceptance
  static Future<void> resetTermsAcceptance() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_termsAcceptedKey);
      await prefs.remove(_termsAcceptedVersionKey);
      _cachedTermsAccepted = false;

      Logger.logInfo(
        'Terms acceptance reset',
        tag: 'TermsAcceptanceService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to reset terms acceptance',
        error: e,
        tag: 'TermsAcceptanceService',
      );
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add terms version history tracking
// - Implement terms change notifications
// - Add ability to view accepted terms version
// - Create terms update flow for existing users
// - Add analytics tracking for terms acceptance
// - Implement terms acceptance timestamp tracking

