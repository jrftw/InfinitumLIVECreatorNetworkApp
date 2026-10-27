/*
 * Filename: preload_service.dart
 * Purpose: Background preload and short-lived cache for public hub feeds
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: api_service.dart, logger.dart, shared_preferences, models
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:convert';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/announcement_model.dart';
import 'package:infinitum_live_creator_network/models/creator_stats_model.dart';
import 'package:infinitum_live_creator_network/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// MARK: - Preload Service
class PreloadService {
  static final PreloadService _instance = PreloadService._internal();
  factory PreloadService() => _instance;
  PreloadService._internal();

  static const String _announcementsCacheKey =
      'cached_infinicore_announcements_v2';
  static const String _statsCacheKey = 'cached_public_network_stats_v2';
  static const String _announcementsCacheTimeKey =
      'infinicore_announcements_cache_time_v2';
  static const String _statsCacheTimeKey = 'public_network_stats_cache_time_v2';
  static const Duration _cacheValidDuration = Duration(minutes: 5);

  final ApiService _apiService = ApiService();
  SharedPreferences? _prefs;
  bool _isInitialized = false;

  // MARK: - Initialization
  Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    try {
      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;
      Logger.logInfo('PreloadService initialized', tag: 'PreloadService');
    } catch (e) {
      Logger.logError(
        'Failed to initialize PreloadService',
        error: e,
        tag: 'PreloadService',
      );
    }
  }

  // MARK: - Preload All Data
  Future<void> preloadAll() async {
    if (!_isInitialized) {
      await initialize();
    }

    Future.microtask(() async {
      try {
        await preloadAnnouncements();
      } catch (e) {
        Logger.logError(
          'Failed to preload announcements',
          error: e,
          tag: 'PreloadService',
        );
      }
    });

    Future.microtask(() async {
      try {
        await preloadStats();
      } catch (e) {
        Logger.logError(
          'Failed to preload stats',
          error: e,
          tag: 'PreloadService',
        );
      }
    });
  }

  // MARK: - Preload Announcements
  Future<void> preloadAnnouncements() async {
    try {
      Logger.logInfo('Preloading announcements...', tag: 'PreloadService');
      final AnnouncementsResponseModel response =
          await _apiService.fetchAnnouncements();
      await _preloadServiceCacheAnnouncements(response.announcements);
      Logger.logInfo(
        'Announcements preloaded successfully',
        tag: 'PreloadService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to preload announcements',
        error: e,
        tag: 'PreloadService',
      );
    }
  }

  // MARK: - Preload Statistics
  Future<void> preloadStats() async {
    try {
      Logger.logInfo('Preloading public network stats...', tag: 'PreloadService');
      final CreatorNetworkPublicStatsModel stats =
          await _apiService.fetchCreatorStats();
      await _preloadServiceCacheStats(stats);
      Logger.logInfo(
        'Statistics preloaded successfully',
        tag: 'PreloadService',
      );
    } catch (e) {
      Logger.logError(
        'Failed to preload statistics',
        error: e,
        tag: 'PreloadService',
      );
    }
  }

  // MARK: - Get Cached Announcements
  AnnouncementsResponseModel? getCachedAnnouncements() {
    if (!_isInitialized || _prefs == null) {
      return null;
    }

    try {
      final String? cachedJson = _prefs!.getString(_announcementsCacheKey);
      final String? cacheTimeStr = _prefs!.getString(_announcementsCacheTimeKey);

      if (cachedJson == null || cacheTimeStr == null) {
        return null;
      }

      final DateTime cacheTime = DateTime.parse(cacheTimeStr);
      if (DateTime.now().difference(cacheTime) > _cacheValidDuration) {
        Logger.logInfo('Cached announcements expired', tag: 'PreloadService');
        return null;
      }

      final Map<String, dynamic> jsonData =
          json.decode(cachedJson) as Map<String, dynamic>;
      return AnnouncementsResponseModel.fromJson(jsonData);
    } catch (e) {
      Logger.logError(
        'Failed to get cached announcements',
        error: e,
        tag: 'PreloadService',
      );
      return null;
    }
  }

  // MARK: - Get Cached Stats
  CreatorNetworkPublicStatsModel? getCachedStats() {
    if (!_isInitialized || _prefs == null) {
      return null;
    }

    try {
      final String? cachedJson = _prefs!.getString(_statsCacheKey);
      final String? cacheTimeStr = _prefs!.getString(_statsCacheTimeKey);

      if (cachedJson == null || cacheTimeStr == null) {
        return null;
      }

      final DateTime cacheTime = DateTime.parse(cacheTimeStr);
      if (DateTime.now().difference(cacheTime) > _cacheValidDuration) {
        Logger.logInfo('Cached stats expired', tag: 'PreloadService');
        return null;
      }

      final Map<String, dynamic> jsonData =
          json.decode(cachedJson) as Map<String, dynamic>;
      return CreatorNetworkPublicStatsModel.fromJson(jsonData);
    } catch (e) {
      Logger.logError(
        'Failed to get cached stats',
        error: e,
        tag: 'PreloadService',
      );
      return null;
    }
  }

  // MARK: - Cache Management
  Future<void> _preloadServiceCacheAnnouncements(
    List<AnnouncementModel> announcements,
  ) async {
    if (_prefs == null) {
      return;
    }

    try {
      final Map<String, dynamic> jsonData = {
        'items': announcements.map((a) => a.toJson()).toList(),
      };
      await _prefs!.setString(_announcementsCacheKey, json.encode(jsonData));
      await _prefs!.setString(
        _announcementsCacheTimeKey,
        DateTime.now().toIso8601String(),
      );
    } catch (e) {
      Logger.logError(
        'Failed to cache announcements',
        error: e,
        tag: 'PreloadService',
      );
    }
  }

  Future<void> _preloadServiceCacheStats(
    CreatorNetworkPublicStatsModel stats,
  ) async {
    if (_prefs == null) {
      return;
    }

    try {
      await _prefs!.setString(_statsCacheKey, json.encode(stats.toJson()));
      await _prefs!.setString(
        _statsCacheTimeKey,
        DateTime.now().toIso8601String(),
      );
    } catch (e) {
      Logger.logError(
        'Failed to cache stats',
        error: e,
        tag: 'PreloadService',
      );
    }
  }

  // MARK: - Clear Cache
  Future<void> clearCache() async {
    if (_prefs == null) {
      return;
    }

    try {
      await _prefs!.remove(_announcementsCacheKey);
      await _prefs!.remove(_statsCacheKey);
      await _prefs!.remove(_announcementsCacheTimeKey);
      await _prefs!.remove(_statsCacheTimeKey);
      Logger.logInfo('Cache cleared', tag: 'PreloadService');
    } catch (e) {
      Logger.logError(
        'Failed to clear cache',
        error: e,
        tag: 'PreloadService',
      );
    }
  }
}

// Suggestions For Features and Additions Later:
// - Drop leftover v1 GitHub cache keys on upgrade
// - Persist last-good stats beyond the 5-minute window for offline hub opens
