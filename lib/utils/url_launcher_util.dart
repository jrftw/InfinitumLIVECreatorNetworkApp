/*
 * Filename: url_launcher_util.dart
 * Purpose: Utility functions for launching URLs and external links
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: url_launcher package, logger.dart, webview_screen.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/screens/webview_screen.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

// MARK: - URL Launcher Utility
class UrlLauncherUtil {
  // MARK: - Launch URL
  /// Opens a URL in an in-app webview on mobile platforms, or in the default browser on web
  static Future<bool> launchUrl(
    String url, {
    BuildContext? context,
    String? title,
    url_launcher.LaunchMode? mode,
  }) async {
    try {
      // Clean and validate URL
      final cleanedUrl = url.trim();
      
      // Check if URL looks like an array representation (starts with [)
      if (cleanedUrl.startsWith('[') && cleanedUrl.endsWith(']')) {
        // Try to extract first URL from array-like string
        final match = RegExp(r'https?://[^\s,\]]+').firstMatch(cleanedUrl);
        if (match != null) {
          final extractedUrl = match.group(0);
          if (extractedUrl != null) {
            Logger.logInfo('Extracted URL from array: $extractedUrl', tag: 'UrlLauncherUtil');
            return await launchUrl(extractedUrl, context: context, title: title, mode: mode);
          }
        }
        Logger.logError('Invalid URL format (array): $url', tag: 'UrlLauncherUtil');
        return false;
      }
      
      // Validate URL format
      if (!cleanedUrl.startsWith('http://') && !cleanedUrl.startsWith('https://')) {
        Logger.logError('Invalid URL scheme: $url', tag: 'UrlLauncherUtil');
        return false;
      }
      
      final uri = Uri.parse(cleanedUrl);
      final bool openExternally =
          mode == url_launcher.LaunchMode.externalApplication ||
              urlLauncherUtilRequiresExternalBrowser(cleanedUrl);

      // On web, or for store/Discord links, use the system browser/app.
      if (kIsWeb || openExternally) {
        final launchMode = mode ?? url_launcher.LaunchMode.externalApplication;
        if (await url_launcher.canLaunchUrl(uri)) {
          final launched = await url_launcher.launchUrl(uri, mode: launchMode);
          if (launched) {
            Logger.logInfo(
              'Successfully launched URL externally: $url',
              tag: 'UrlLauncherUtil',
            );
          }
          return launched;
        } else {
          Logger.logError('Cannot launch URL: $url', tag: 'UrlLauncherUtil');
          return false;
        }
      }
      
      // On mobile platforms (iOS/Android), open trusted sites in-app.
      if (context != null) {
        Logger.logInfo('Opening URL in in-app webview: $url', tag: 'UrlLauncherUtil');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              url: url,
              title: title,
            ),
          ),
        );
        return true;
      } else {
        Logger.logError('Context is required for in-app webview on mobile platforms', tag: 'UrlLauncherUtil');
        return false;
      }
    } catch (e) {
      Logger.logError('Error launching URL: $url', error: e, tag: 'UrlLauncherUtil');
      return false;
    }
  }
  
  // MARK: - Launch Email
  static Future<bool> launchEmail(String email, {String? subject, String? body}) async {
    try {
      final uri = Uri(
        scheme: 'mailto',
        path: email,
        query: _encodeQueryParameters({
          if (subject != null) 'subject': subject,
          if (body != null) 'body': body,
        }),
      );
      
      if (await url_launcher.canLaunchUrl(uri)) {
        final launched = await url_launcher.launchUrl(uri);
        if (launched) {
          Logger.logInfo('Successfully launched email: $email', tag: 'UrlLauncherUtil');
        }
        return launched;
      } else {
        Logger.logError('Cannot launch email: $email', tag: 'UrlLauncherUtil');
        return false;
      }
    } catch (e) {
      Logger.logError('Error launching email: $email', error: e, tag: 'UrlLauncherUtil');
      return false;
    }
  }
  
  // MARK: - Launch Phone
  static Future<bool> launchPhone(String phoneNumber) async {
    try {
      final uri = Uri(scheme: 'tel', path: phoneNumber);
      
      if (await url_launcher.canLaunchUrl(uri)) {
        final launched = await url_launcher.launchUrl(uri);
        if (launched) {
          Logger.logInfo('Successfully launched phone: $phoneNumber', tag: 'UrlLauncherUtil');
        }
        return launched;
      } else {
        Logger.logError('Cannot launch phone: $phoneNumber', tag: 'UrlLauncherUtil');
        return false;
      }
    } catch (e) {
      Logger.logError('Error launching phone: $phoneNumber', error: e, tag: 'UrlLauncherUtil');
      return false;
    }
  }
  
  // MARK: - Helper Methods
  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}

// MARK: - External Browser Detection
bool urlLauncherUtilRequiresExternalBrowser(String url) {
  final Uri? uri = Uri.tryParse(url.trim());
  if (uri == null || uri.host.isEmpty) {
    return false;
  }
  final String host = uri.host.toLowerCase();
  return host.contains('apps.apple.com') ||
      host.contains('itunes.apple.com') ||
      host.contains('play.google.com') ||
      host.contains('market.android.com') ||
      host == 'discord.gg' ||
      host.endsWith('.discord.gg') ||
      host == 'discord.com' ||
      host.endsWith('.discord.com') ||
      host == 'discordapp.com' ||
      host.endsWith('.discordapp.com');
}

// Suggestions For Features and Additions Later:
// - Add support for SMS links
// - Implement deep linking handlers
// - Create custom URL scheme handlers
// - Add analytics tracking for link clicks
// - Implement link preview functionality

