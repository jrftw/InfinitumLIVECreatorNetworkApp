/*
 * Filename: platform_util.dart
 * Purpose: Platform and layout detection so iOS, Android, and web each get native chrome
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/foundation.dart, flutter/widgets.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter/widgets.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - Platform Utility
/// Safe platform detection. Web is never treated as iOS/Android even in Safari.
class PlatformUtil {
  // MARK: - Platform Detection
  /// True on native iOS only (not web).
  static bool get isIOS {
    if (kIsWeb) {
      return false;
    }
    try {
      return defaultTargetPlatform == TargetPlatform.iOS;
    } catch (e) {
      Logger.logError('iOS platform check failed', error: e, tag: 'PlatformUtil');
      return false;
    }
  }

  /// True on native Android only (not web).
  static bool get isAndroid {
    if (kIsWeb) {
      return false;
    }
    try {
      return defaultTargetPlatform == TargetPlatform.android;
    } catch (e) {
      Logger.logError(
        'Android platform check failed',
        error: e,
        tag: 'PlatformUtil',
      );
      return false;
    }
  }

  /// True in a browser.
  static bool get isWeb => kIsWeb;

  /// True on native iOS or Android.
  static bool get isMobile {
    if (kIsWeb) {
      return false;
    }
    return isIOS || isAndroid;
  }

  /// Cupertino chrome (tab bar, grouped surfaces) is native iOS only.
  static bool get usesCupertinoChrome => isIOS;

  /// Material 3 expressive chrome is native Android only.
  static bool get usesMaterial3Chrome => isAndroid;

  /// Web-native mix: rail/top nav, hover, no mobile-only glass.
  static bool get usesWebChrome => isWeb;

  /// Wide web layout (desktop/tablet browser).
  static bool creatorNetworkIsWideWebLayout(BuildContext context) {
    if (!kIsWeb) {
      return false;
    }
    return MediaQuery.sizeOf(context).width >= 960;
  }

  /// Native-feeling scroll physics per platform.
  static ScrollPhysics creatorNetworkScrollPhysics() {
    if (isIOS) {
      return const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      );
    }
    return const ClampingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Foldable hinge-aware layout once a foldable device is in the test matrix
// - Detect iPad vs iPhone for expanded Cupertino split view
