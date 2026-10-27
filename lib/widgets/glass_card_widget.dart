/*
 * Filename: glass_card_widget.dart
 * Purpose: Adaptive surface cards — iOS glass, Android Material 3, web bordered panels
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: dart:ui, flutter/material.dart, platform_util.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';

// MARK: - Adaptive Surface Card
/// iOS: liquid glass. Android: tonal Material 3 card. Web: bordered panel with hover.
class GlassCardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double blurIntensity;
  final double opacity;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;

  const GlassCardWidget({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.blurIntensity = 20.0,
    this.opacity = 0.15,
    this.border,
    this.boxShadow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius =
        borderRadius ??
        BorderRadius.circular(PlatformUtil.isAndroid ? 28 : 20);
    final EdgeInsetsGeometry resolvedPadding =
        padding ?? const EdgeInsets.all(16);

    Widget content = SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: resolvedPadding,
        child: child,
      ),
    );

    if (PlatformUtil.isIOS) {
      content = _creatorNetworkIosGlassSurface(
        context: context,
        radius: radius,
        child: content,
      );
    } else if (PlatformUtil.isAndroid) {
      content = _creatorNetworkAndroidSurface(
        context: context,
        radius: radius,
        child: content,
      );
    } else {
      content = _creatorNetworkWebSurface(
        context: context,
        radius: radius,
        child: content,
      );
    }

    if (margin != null) {
      content = Padding(padding: margin!, child: content);
    }

    if (onTap != null) {
      return Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          hoverColor: Theme.of(context)
              .colorScheme
              .primary
              .withValues(alpha: 0.06),
          child: content,
        ),
      );
    }

    return content;
  }

  // MARK: - iOS Glass
  Widget _creatorNetworkIosGlassSurface({
    required BuildContext context,
    required BorderRadius radius,
    required Widget child,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurIntensity,
          sigmaY: blurIntensity,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: border ??
                Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.18)
                      : Colors.white.withValues(alpha: 0.85),
                ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      Colors.white.withValues(alpha: opacity * 0.12),
                      Colors.white.withValues(alpha: opacity * 0.05),
                    ]
                  : [
                      Colors.white.withValues(alpha: 0.82),
                      Colors.white.withValues(alpha: 0.62),
                    ],
            ),
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
          ),
          child: child,
        ),
      ),
    );
  }

  // MARK: - Android Material 3
  Widget _creatorNetworkAndroidSurface({
    required BuildContext context,
    required BorderRadius radius,
    required Widget child,
  }) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Material(
      color: backgroundColor ?? scheme.surfaceContainerLow,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: scheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: child,
    );
  }

  // MARK: - Web Panel
  Widget _creatorNetworkWebSurface({
    required BuildContext context,
    required BorderRadius radius,
    required Widget child,
  }) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDark ? const Color(0xFF1B1B26) : Colors.white),
        borderRadius: radius,
        border: border ??
            Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : const Color(0xFFE6E4F0),
            ),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.06),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
      ),
      child: child,
    );
  }
}

// MARK: - Adaptive Container (nav chrome, custom layouts)
class GlassContainerWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double blurIntensity;
  final double opacity;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const GlassContainerWidget({
    super.key,
    required this.child,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.blurIntensity = 20.0,
    this.opacity = 0.15,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      margin: margin,
      width: width,
      height: height,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      blurIntensity: blurIntensity,
      opacity: opacity,
      border: border,
      boxShadow: boxShadow,
      padding: EdgeInsets.zero,
      child: child,
    );
  }
}

// Suggestions For Features and Additions Later:
// - Animate web hover elevation with a Stateful hover flag
// - iOS 26 real UIVisualEffectView via a platform view if Apple exposes it to Flutter
