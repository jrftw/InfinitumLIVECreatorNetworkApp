/*
 * Filename: glass_card_widget.dart
 * Purpose: Reusable glassmorphism card widget for iOS 26 liquid glass design
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, dart:ui
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:ui';
import 'package:flutter/material.dart';

// MARK: - Glass Card Widget
/// A reusable glassmorphism card widget with backdrop blur and semi-transparent surface
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
    this.blurIntensity = 10.0,
    this.opacity = 0.1,
    this.border,
    this.boxShadow,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // iOS 26 liquid glass colors
    final defaultBackgroundColor = isDark
        ? Colors.white.withOpacity(opacity)
        : Colors.black.withOpacity(opacity * 0.5);
    
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(20);
    
    final defaultBorder = border ?? Border.all(
      color: isDark
          ? Colors.white.withOpacity(0.2)
          : Colors.black.withOpacity(0.1),
      width: 1.0,
    );
    
    final defaultShadow = boxShadow ?? [
      BoxShadow(
        color: isDark
            ? Colors.black.withOpacity(0.3)
            : Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ];
    
    Widget card = ClipRRect(
      borderRadius: defaultBorderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurIntensity,
          sigmaY: blurIntensity,
        ),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.all(16),
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor ?? defaultBackgroundColor,
            borderRadius: defaultBorderRadius,
            border: defaultBorder,
            boxShadow: defaultShadow,
          ),
          child: child,
        ),
      ),
    );
    
    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: defaultBorderRadius,
        child: card,
      );
    }
    
    return card;
  }
}

// MARK: - Glass Container Widget
/// A simpler glass container without padding, for custom layouts
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
    this.blurIntensity = 10.0,
    this.opacity = 0.1,
    this.border,
    this.boxShadow,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final defaultBackgroundColor = isDark
        ? Colors.white.withOpacity(opacity)
        : Colors.black.withOpacity(opacity * 0.5);
    
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(20);
    
    final defaultBorder = border ?? Border.all(
      color: isDark
          ? Colors.white.withOpacity(0.2)
          : Colors.black.withOpacity(0.1),
      width: 1.0,
    );
    
    final defaultShadow = boxShadow ?? [
      BoxShadow(
        color: isDark
            ? Colors.black.withOpacity(0.3)
            : Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ];
    
    return ClipRRect(
      borderRadius: defaultBorderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurIntensity,
          sigmaY: blurIntensity,
        ),
        child: Container(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor ?? defaultBackgroundColor,
            borderRadius: defaultBorderRadius,
            border: defaultBorder,
            boxShadow: defaultShadow,
          ),
          child: child,
        ),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add animated glass effects on interaction
// - Implement gradient glass overlays
// - Add support for custom blur filters
// - Create glass button variants
// - Add glass navigation bar component
// - Implement glass modal dialogs
// - Add glass list tile component

