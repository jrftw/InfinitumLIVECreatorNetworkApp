/*
 * Filename: stat_card_widget.dart
 * Purpose: Reusable widget for displaying statistics cards
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';

// MARK: - Statistics Card Widget
class StatCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;
  
  const StatCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = color ?? theme.colorScheme.primary;
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: cardColor,
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: theme.textTheme.displaySmall?.copyWith(
                color: cardColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add animation for value changes
// - Implement trend indicators (up/down arrows)
// - Add percentage change display
// - Create different card styles (compact, detailed)
// - Add tap actions for detailed views
// - Implement loading states with shimmer effect
// - Add support for custom icons and images

