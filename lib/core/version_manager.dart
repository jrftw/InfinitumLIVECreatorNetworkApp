/*
 * Filename: version_manager.dart
 * Purpose: Manages app version information and environment detection (Dev/Beta/Production)
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: package_info_plus, flutter/foundation.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - App Environment Enum
enum AppEnvironment {
  development,
  beta,
  production,
}

// MARK: - Version Manager
class VersionManager {
  static PackageInfo? _packageInfo;
  static AppEnvironment? _cachedEnvironment;

  // MARK: - Initialization
  static Future<void> initialize() async {
    try {
      _packageInfo = await PackageInfo.fromPlatform();
      Logger.logInfo(
        'Version Manager initialized: ${_packageInfo!.version} (${_packageInfo!.buildNumber})',
        tag: 'VersionManager',
      );
    } catch (e) {
      Logger.logError(
        'Failed to initialize Version Manager',
        error: e,
        tag: 'VersionManager',
      );
    }
  }

  // MARK: - Version Information
  static String get version {
    // Safe to call before initialization
    return _packageInfo?.version ?? '1.0.0';
  }

  static String get buildNumber {
    // Safe to call before initialization
    return _packageInfo?.buildNumber ?? '1';
  }

  static String get appName {
    return _packageInfo?.appName ?? 'Infinitum LIVE Creator Network';
  }

  static String get packageName {
    return _packageInfo?.packageName ?? '';
  }

  // MARK: - Environment Detection
  static AppEnvironment get environment {
    if (_cachedEnvironment != null) {
      return _cachedEnvironment!;
    }

    // Development: Debug mode or specific build flags
    if (kDebugMode) {
      _cachedEnvironment = AppEnvironment.development;
      return _cachedEnvironment!;
    }

    // Beta: Check for beta indicators
    // - TestFlight (iOS): Check if running in TestFlight
    // - Beta web hosting: Check URL or build configuration
    // - Internal testing (Android): Check if from internal testing track
    if (_isBetaEnvironment()) {
      _cachedEnvironment = AppEnvironment.beta;
      return _cachedEnvironment!;
    }

    // Production: Release builds without beta indicators
    _cachedEnvironment = AppEnvironment.production;
    return _cachedEnvironment!;
  }

  // MARK: - Environment Detection Helpers
  static bool _isBetaEnvironment() {
    // Check for TestFlight on iOS
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      // TestFlight builds typically have specific bundle identifiers or can be detected
      // This is a simplified check - in production, you might want more sophisticated detection
      final packageName = _packageInfo?.packageName ?? '';
      if (packageName.contains('beta') || packageName.contains('testflight')) {
        return true;
      }
    }

    // Check for beta web hosting
    if (kIsWeb) {
      final uri = Uri.base;
      final host = uri.host.toLowerCase();
      // Common beta hosting patterns
      if (host.contains('beta') ||
          host.contains('staging') ||
          host.contains('test') ||
          host.contains('preview')) {
        return true;
      }
    }

    // Check for Android beta/internal testing
    if (defaultTargetPlatform == TargetPlatform.android) {
      final packageName = _packageInfo?.packageName ?? '';
      if (packageName.contains('beta') || packageName.contains('debug')) {
        return true;
      }
    }

    return false;
  }

  // MARK: - Version Display
  static String getDisplayVersion() {
    final env = environment;
    final versionString = version;
    final buildString = buildNumber;

    switch (env) {
      case AppEnvironment.development:
        return '$versionString ($buildString) Dev';
      case AppEnvironment.beta:
        return '$versionString ($buildString) Beta';
      case AppEnvironment.production:
        return '$versionString ($buildString)';
    }
  }

  static String getEnvironmentLabel() {
    switch (environment) {
      case AppEnvironment.development:
        return 'Dev';
      case AppEnvironment.beta:
        return 'Beta';
      case AppEnvironment.production:
        return '';
    }
  }

  // MARK: - Version Comparison
  static bool isNewerVersion(String otherVersion) {
    try {
      final currentParts = version.split('.').map(int.parse).toList();
      final otherParts = otherVersion.split('.').map(int.parse).toList();

      // Pad shorter version with zeros
      while (currentParts.length < otherParts.length) {
        currentParts.add(0);
      }
      while (otherParts.length < currentParts.length) {
        otherParts.add(0);
      }

      for (int i = 0; i < currentParts.length; i++) {
        if (currentParts[i] > otherParts[i]) {
          return true;
        } else if (currentParts[i] < otherParts[i]) {
          return false;
        }
      }

      return false; // Versions are equal
    } catch (e) {
      Logger.logError(
        'Error comparing versions: $version vs $otherVersion',
        error: e,
        tag: 'VersionManager',
      );
      return false;
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add version update checking and notifications
// - Implement force update mechanism for critical versions
// - Add version history tracking
// - Create version comparison utilities
// - Add support for semantic versioning validation
// - Implement version-based feature flags

