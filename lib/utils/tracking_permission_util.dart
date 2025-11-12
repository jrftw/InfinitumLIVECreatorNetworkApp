/*
 * Filename: tracking_permission_util.dart
 * Purpose: Utility for requesting ad tracking permission on iOS via method channel
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/services.dart, platform_util.dart, logger.dart
 * Platform Compatibility: iOS only
 */

import 'package:flutter/services.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';

// MARK: - Tracking Permission Utility
class TrackingPermissionUtil {
  static const MethodChannel _channel = MethodChannel(
    'com.infinitumimageryllc.infinitumlive/tracking',
  );

  // MARK: - Request Tracking Permission
  /// Requests tracking permission on iOS
  /// Returns the authorization status:
  /// 0 = notDetermined
  /// 1 = restricted
  /// 2 = denied
  /// 3 = authorized
  static Future<int?> requestTrackingPermission() async {
    // Only works on iOS
    if (!PlatformUtil.isIOS) {
      Logger.logInfo(
        'Tracking permission request skipped - not on iOS',
        tag: 'TrackingPermissionUtil',
      );
      return null;
    }

    try {
      final result = await _channel.invokeMethod<int>('requestTrackingPermission');
      Logger.logInfo(
        'Tracking permission request completed with status: $result',
        tag: 'TrackingPermissionUtil',
      );
      return result;
    } on PlatformException catch (e) {
      Logger.logError(
        'Failed to request tracking permission',
        error: e,
        tag: 'TrackingPermissionUtil',
      );
      return null;
    } catch (e) {
      Logger.logError(
        'Unexpected error requesting tracking permission',
        error: e,
        tag: 'TrackingPermissionUtil',
      );
      return null;
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add method to check current tracking permission status
// - Implement permission status change listeners
// - Add support for Android tracking permissions
// - Create permission status enum for better type safety
// - Add analytics tracking for permission request outcomes

