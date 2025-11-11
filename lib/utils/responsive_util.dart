/*
 * Filename: responsive_util.dart
 * Purpose: Utility functions for responsive design and cross-platform compatibility
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// MARK: - Responsive Utility
class ResponsiveUtil {
  // MARK: - Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // MARK: - Screen Size Detection
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  // MARK: - Responsive Values
  static T responsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }

  // MARK: - Responsive Padding
  static EdgeInsets responsivePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: responsiveValue<double>(
        context: context,
        mobile: 16,
        tablet: 24,
        desktop: 32,
      ),
      vertical: responsiveValue<double>(
        context: context,
        mobile: 8,
        tablet: 12,
        desktop: 16,
      ),
    );
  }

  // MARK: - Responsive Font Size
  static double responsiveFontSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return responsiveValue<double>(
      context: context,
      mobile: mobile,
      tablet: tablet ?? mobile * 1.2,
      desktop: desktop ?? mobile * 1.4,
    );
  }

  // MARK: - Platform Detection
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isWeb => kIsWeb;
  static bool get isMobilePlatform => isIOS || isAndroid;

  // MARK: - Safe Area Padding
  static EdgeInsets safeAreaPadding(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return EdgeInsets.only(
      top: mediaQuery.padding.top,
      bottom: mediaQuery.padding.bottom,
      left: mediaQuery.padding.left,
      right: mediaQuery.padding.right,
    );
  }

  // MARK: - Orientation Detection
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // MARK: - Screen Dimensions
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // MARK: - Device Type
  static DeviceType getDeviceType(BuildContext context) {
    final width = screenWidth(context);
    if (width < mobileBreakpoint) {
      return DeviceType.mobile;
    } else if (width < tabletBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }
}

// MARK: - Device Type Enum
enum DeviceType {
  mobile,
  tablet,
  desktop,
}

// Suggestions For Features and Additions Later:
// - Add support for foldable devices
// - Implement adaptive layouts for different screen ratios
// - Add support for dynamic type scaling
// - Create responsive grid system
// - Add support for multi-window mode
// - Implement landscape-specific layouts

