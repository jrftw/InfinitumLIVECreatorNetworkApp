/*
 * Filename: app_logo_widget.dart
 * Purpose: Reusable widget for displaying the app logo
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';

// MARK: - App Logo Widget
class AppLogoWidget extends StatelessWidget {
  final double size;
  final bool showShadow;
  final BorderRadius? borderRadius;
  
  const AppLogoWidget({
    super.key,
    this.size = 120,
    this.showShadow = true,
    this.borderRadius,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBorderRadius = BorderRadius.circular(size * 0.2);
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? defaultBorderRadius,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.3),
                  blurRadius: size * 0.25,
                  spreadRadius: size * 0.05,
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? defaultBorderRadius,
        child: Image.asset(
          'assets/images/app_logo.png',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.live_tv,
              size: size * 0.6,
              color: theme.colorScheme.primary,
            );
          },
        ),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add animation support for logo appearance
// - Implement different logo variants (monochrome, outlined)
// - Add tap handler for logo interactions
// - Create logo with text combination variant
// - Add support for custom logo paths
// - Implement logo caching for better performance
// - Add loading state for logo image

