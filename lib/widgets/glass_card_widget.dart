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
    this.blurIntensity = 20.0,
    this.opacity = 0.15,
    this.border,
    this.boxShadow,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // iOS 26 liquid glass colors - enhanced for modern feel
    final defaultBackgroundColor = isDark
        ? Colors.white.withOpacity(opacity * 0.15)
        : Colors.white.withOpacity(0.7);
    
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(24);
    
    // Enhanced border for liquid glass effect
    final defaultBorder = border ?? Border.all(
      color: isDark
          ? Colors.white.withOpacity(0.18)
          : Colors.white.withOpacity(0.8),
      width: 1.5,
    );
    
    // Enhanced shadow for depth and floating effect
    final defaultShadow = boxShadow ?? [
      BoxShadow(
        color: isDark
            ? Colors.black.withOpacity(0.4)
            : Colors.black.withOpacity(0.08),
        blurRadius: 30,
        offset: const Offset(0, 8),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.white.withOpacity(0.9),
        blurRadius: 1,
        offset: const Offset(0, -1),
        spreadRadius: 0,
      ),
    ];
    
    Widget card = ClipRRect(
      borderRadius: defaultBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: defaultBorderRadius,
          boxShadow: defaultShadow,
        ),
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
              // Add subtle gradient for liquid glass effect
              gradient: isDark
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(opacity * 0.1),
                        Colors.white.withOpacity(opacity * 0.05),
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(0.6),
                      ],
                    ),
            ),
            child: child,
          ),
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
    this.blurIntensity = 20.0,
    this.opacity = 0.15,
    this.border,
    this.boxShadow,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // iOS 26 liquid glass colors - enhanced for modern feel
    final defaultBackgroundColor = isDark
        ? Colors.white.withOpacity(opacity * 0.15)
        : Colors.white.withOpacity(0.7);
    
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(24);
    
    // Enhanced border for liquid glass effect
    final defaultBorder = border ?? Border.all(
      color: isDark
          ? Colors.white.withOpacity(0.18)
          : Colors.white.withOpacity(0.8),
      width: 1.5,
    );
    
    // Enhanced shadow for depth and floating effect
    final defaultShadow = boxShadow ?? [
      BoxShadow(
        color: isDark
            ? Colors.black.withOpacity(0.4)
            : Colors.black.withOpacity(0.08),
        blurRadius: 30,
        offset: const Offset(0, 8),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.white.withOpacity(0.9),
        blurRadius: 1,
        offset: const Offset(0, -1),
        spreadRadius: 0,
      ),
    ];
    
    return ClipRRect(
      borderRadius: defaultBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: defaultBorderRadius,
          boxShadow: defaultShadow,
        ),
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
              // Add subtle gradient for liquid glass effect
              gradient: isDark
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(opacity * 0.1),
                        Colors.white.withOpacity(opacity * 0.05),
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(0.6),
                      ],
                    ),
            ),
            child: child,
          ),
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

