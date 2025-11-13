/*
 * Filename: app_info_dialog.dart
 * Purpose: Dialog widget displaying app information after ATT permission
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, app_logo_widget.dart, app_info_dialog_service.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';
import 'package:infinitum_live_creator_network/services/app_info_dialog_service.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - App Info Dialog
class AppInfoDialog extends StatelessWidget {
  const AppInfoDialog({super.key});

  // MARK: - Show Dialog Method
  /// Shows the app info dialog if it hasn't been shown before
  /// Returns true if dialog was shown, false if it was already shown
  static Future<bool> showIfNeeded(BuildContext context) async {
    try {
      // Ensure service is initialized
      if (!AppInfoDialogService.isInitialized) {
        await AppInfoDialogService.initialize();
      }

      // Check if dialog has already been shown
      if (AppInfoDialogService.dialogShown) {
        Logger.logInfo(
          'App info dialog already shown, skipping',
          tag: 'AppInfoDialog',
        );
        return false;
      }

      // Show the dialog
      await showDialog(
        context: context,
        barrierDismissible: false, // Prevent dismissing by tapping outside
        builder: (context) => const AppInfoDialog(),
      );

      return true;
    } catch (e) {
      Logger.logError(
        'Failed to show app info dialog',
        error: e,
        tag: 'AppInfoDialog',
      );
      return false;
    }
  }

  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: isDark
          ? const Color(0xFF1E293B)
          : Colors.white,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
          minWidth: 300,
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App Icon
            const AppLogoWidget(
              size: 100,
              showShadow: true,
            ),
            const SizedBox(height: 24),
            
            // App Name
            Text(
              AppConfig.appName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            
            // Info Message
            Text(
              'This app "${AppConfig.appName}" is a central hub for Creator tools. Directly on this app there is no data collection, sign ups or account creations.',
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: isDark
                    ? Colors.white.withOpacity(0.9)
                    : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            // Okay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Mark dialog as shown
                  await AppInfoDialogService.markDialogAsShown();
                  
                  // Close dialog
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                  
                  Logger.logInfo(
                    'App info dialog dismissed',
                    tag: 'AppInfoDialog',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add animation for dialog appearance
// - Implement different dialog styles/themes
// - Add support for rich text formatting in message
// - Create dialog with multiple pages/steps
// - Add analytics tracking for dialog interactions
// - Implement dialog with custom actions
// - Add support for localized dialog content

