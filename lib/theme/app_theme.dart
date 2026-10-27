/*
 * Filename: app_theme.dart
 * Purpose: Platform-native themes — Cupertino-like iOS, Material 3 Android, web mix
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, platform_util.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';

// MARK: - Theme Configuration
class AppTheme {
  // MARK: - Infinitum Brand
  static const Color primaryColor = Color(0xFF5B4BC4);
  static const Color secondaryColor = Color(0xFF007C78);
  static const Color accentColor = Color(0xFF8A5A00);
  static const Color successColor = Color(0xFF34C759);
  static const Color errorColor = Color(0xFFFF3B30);

  static const Color iosLightBackground = Color(0xFFF2F2F7);
  static const Color iosDarkBackground = Color(0xFF000000);
  static const Color iosDarkSurface = Color(0xFF1C1C1E);

  // MARK: - Resolve Theme For Current Platform
  static ThemeData lightTheme = themeFor(brightness: Brightness.light);
  static ThemeData darkTheme = themeFor(brightness: Brightness.dark);

  static ThemeData themeFor({required Brightness brightness}) {
    if (PlatformUtil.isIOS) {
      return _iosTheme(brightness);
    }
    if (PlatformUtil.isAndroid) {
      return _androidTheme(brightness);
    }
    return _webTheme(brightness);
  }

  // MARK: - iOS (Cupertino-adjacent Material host)
  static ThemeData _iosTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final ColorScheme scheme = ColorScheme(
      brightness: brightness,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      tertiary: accentColor,
      onTertiary: Colors.white,
      error: errorColor,
      onError: Colors.white,
      surface: isDark ? iosDarkSurface : Colors.white,
      onSurface: isDark ? Colors.white : Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      platform: TargetPlatform.iOS,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isDark ? iosDarkBackground : iosLightBackground,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: (isDark ? iosDarkBackground : iosLightBackground)
            .withValues(alpha: 0.92),
        foregroundColor: isDark ? Colors.white : Colors.black,
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      elevatedButtonTheme: _filledButtonTheme(14),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        indicatorColor: primaryColor.withValues(alpha: 0.14),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      textTheme: _sfLikeTextTheme(isDark),
    );
  }

  // MARK: - Android (Material 3 Expressive)
  static ThemeData _androidTheme(Brightness brightness) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: brightness,
      secondary: secondaryColor,
      dynamicSchemeVariant: DynamicSchemeVariant.expressive,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      platform: TargetPlatform.android,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 3,
        centerTitle: false,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: scheme.primary,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      elevatedButtonTheme: _filledButtonTheme(28),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 3,
        height: 80,
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.primaryContainer,
        indicatorShape: const StadiumBorder(),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            fontSize: 12,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
          );
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: scheme.surfaceContainerLowest,
        indicatorColor: scheme.primaryContainer,
        selectedIconTheme: IconThemeData(color: scheme.onPrimaryContainer),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  // MARK: - Web (desktop-native mix)
  static ThemeData _webTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: brightness,
      secondary: secondaryColor,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      platform: TargetPlatform.windows,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF0E0E14) : const Color(0xFFF6F5FB),
      visualDensity: VisualDensity.standard,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor:
            isDark ? const Color(0xFF16161F) : Colors.white,
        foregroundColor: scheme.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
          color: scheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: isDark ? const Color(0xFF1B1B26) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : const Color(0xFFE6E4F0),
          ),
        ),
      ),
      elevatedButtonTheme: _filledButtonTheme(12),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor:
            isDark ? const Color(0xFF12121A) : const Color(0xFFFFFFFF),
        indicatorColor: primaryColor.withValues(alpha: 0.16),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        unselectedIconTheme: IconThemeData(
          color: scheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      textTheme: _webTextTheme(isDark),
    );
  }

  // MARK: - Shared Button
  static ElevatedButtonThemeData _filledButtonTheme(double radius) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  // MARK: - iOS Typography
  static TextTheme _sfLikeTextTheme(bool isDark) {
    final Color body = isDark ? Colors.white : Colors.black;
    final Color secondary =
        isDark ? const Color(0xFFEBEBF5) : const Color(0xFF3C3C43);
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: body,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: body,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        color: body,
      ),
      headlineSmall: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: body,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
        color: body,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: secondary,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: secondary,
      ),
    );
  }

  // MARK: - Web Typography
  static TextTheme _webTextTheme(bool isDark) {
    const String family = 'Segoe UI';
    final Color body = isDark ? Colors.white : const Color(0xFF14141C);
    return TextTheme(
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        fontFamily: family,
        color: body,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: family,
        color: body,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: family,
        color: body,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.5,
        height: 1.45,
        fontFamily: family,
        color: isDark ? const Color(0xFFC9C7D6) : const Color(0xFF4A4860),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Wire Material You dynamic color on Android 12+ once a device matrix is available
// - Add a high-contrast theme for accessibility listings
