/*
 * Filename: platform_util.dart
 * Purpose: Platform detection utility that works safely on all platforms including web
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/foundation.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;

// MARK: - Platform Utility
/// Utility class for safe platform detection that works on all platforms including web
class PlatformUtil {
  // MARK: - Platform Detection
  /// Returns true if running on iOS (mobile only, not web)
  static bool get isIOS {
    if (kIsWeb) return false;
    try {
      return defaultTargetPlatform == TargetPlatform.iOS;
    } catch (e) {
      return false;
    }
  }
  
  /// Returns true if running on Android (mobile only, not web)
  static bool get isAndroid {
    if (kIsWeb) return false;
    try {
      return defaultTargetPlatform == TargetPlatform.android;
    } catch (e) {
      return false;
    }
  }
  
  /// Returns true if running on web
  static bool get isWeb => kIsWeb;
  
  /// Returns true if running on mobile (iOS or Android, not web)
  static bool get isMobile {
    if (kIsWeb) return false;
    return isIOS || isAndroid;
  }
}

// Suggestions For Features and Additions Later:
// - Add support for detecting specific device types
// - Implement screen size detection utilities
// - Add platform-specific feature detection
// - Create platform-specific styling helpers

