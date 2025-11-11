/*
 * Filename: logger.dart
 * Purpose: Centralized logging system for debugging and monitoring
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: app_config.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:flutter/foundation.dart';

// MARK: - Global Logging System
class Logger {
  // MARK: - Logging Methods
  
  /// Log informational messages
  static void logInfo(String message, {String? tag}) {
    if (AppConfig.enableDebugLogging || kDebugMode) {
      final timestamp = DateTime.now().toIso8601String();
      final logTag = tag ?? 'INFO';
      debugPrint('[$timestamp] [$logTag] $message');
    }
  }
  
  /// Log error messages
  static void logError(String message, {Object? error, StackTrace? stackTrace, String? tag}) {
    final timestamp = DateTime.now().toIso8601String();
    final logTag = tag ?? 'ERROR';
    debugPrint('[$timestamp] [$logTag] $message');
    
    if (error != null) {
      debugPrint('[$timestamp] [$logTag] Error: $error');
    }
    
    if (stackTrace != null) {
      debugPrint('[$timestamp] [$logTag] StackTrace: $stackTrace');
    }
  }
  
  /// Log debug messages (only in debug mode)
  static void logDebug(String message, {String? tag}) {
    if (kDebugMode && AppConfig.enableDebugLogging) {
      final timestamp = DateTime.now().toIso8601String();
      final logTag = tag ?? 'DEBUG';
      debugPrint('[$timestamp] [$logTag] $message');
    }
  }
  
  /// Log warning messages
  static void logWarning(String message, {String? tag}) {
    if (AppConfig.enableDebugLogging || kDebugMode) {
      final timestamp = DateTime.now().toIso8601String();
      final logTag = tag ?? 'WARNING';
      debugPrint('[$timestamp] [$logTag] $message');
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add file-based logging for production error tracking
// - Implement log levels (verbose, info, warning, error, fatal)
// - Add remote logging service integration (Firebase Crashlytics, Sentry)
// - Create log rotation and cleanup mechanisms
// - Add user action tracking for analytics
// - Implement log export functionality for debugging
// - Add structured logging with JSON format support

