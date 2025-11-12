/*
 * Filename: preload_service.dart
 * Purpose: Service for pre-loading and caching app data in the background
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: api_service.dart, logger.dart, shared_preferences
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:convert';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/announcement_model.dart';
import 'package:infinitum_live_creator_network/models/creator_stats_model.dart';
import 'package:infinitum_live_creator_network/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// MARK: - Preload Service
/// Service that pre-loads and caches app data for instant access
class PreloadService {
  static final PreloadService _instance = PreloadService._internal();
  factory PreloadService() => _instance;
  PreloadService._internal();
  
  static const String _announcementsCacheKey = 'cached_announcements';
  static const String _statsCacheKey = 'cached_stats';
  static const String _announcementsCacheTimeKey = 'announcements_cache_time';
  static const String _statsCacheTimeKey = 'stats_cache_time';
  static const Duration _cacheValidDuration = Duration(minutes: 5);
  
  final ApiService _apiService = ApiService();
  SharedPreferences? _prefs;
  bool _isInitialized = false;
  
  // MARK: - Initialization
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;
      Logger.logInfo('PreloadService initialized', tag: 'PreloadService');
    } catch (e) {
      Logger.logError('Failed to initialize PreloadService', error: e, tag: 'PreloadService');
    }
  }
  
  // MARK: - Preload All Data
  /// Pre-loads all app data in the background without blocking
  Future<void> preloadAll() async {
    if (!_isInitialized) {
      await initialize();
    }
    
    // Pre-load both in parallel without waiting
    Future.microtask(() async {
      try {
        await preloadAnnouncements();
      } catch (e) {
        Logger.logError('Failed to preload announcements', error: e, tag: 'PreloadService');
      }
    });
    
    Future.microtask(() async {
      try {
        await preloadStats();
      } catch (e) {
        Logger.logError('Failed to preload stats', error: e, tag: 'PreloadService');
      }
    });
  }
  
  // MARK: - Preload Announcements
  Future<void> preloadAnnouncements() async {
    try {
      Logger.logInfo('Preloading announcements...', tag: 'PreloadService');
      final response = await _apiService.fetchAnnouncements();
      await _cacheAnnouncements(response.announcements);
      Logger.logInfo('Announcements preloaded successfully', tag: 'PreloadService');
    } catch (e) {
      Logger.logError('Failed to preload announcements', error: e, tag: 'PreloadService');
    }
  }
  
  // MARK: - Preload Statistics
  Future<void> preloadStats() async {
    try {
      Logger.logInfo('Preloading statistics...', tag: 'PreloadService');
      final stats = await _apiService.fetchCreatorStats();
      await _cacheStats(stats);
      Logger.logInfo('Statistics preloaded successfully', tag: 'PreloadService');
    } catch (e) {
      Logger.logError('Failed to preload statistics', error: e, tag: 'PreloadService');
    }
  }
  
  // MARK: - Get Cached Announcements
  AnnouncementsResponseModel? getCachedAnnouncements() {
    if (!_isInitialized || _prefs == null) return null;
    
    try {
      final cachedJson = _prefs!.getString(_announcementsCacheKey);
      final cacheTimeStr = _prefs!.getString(_announcementsCacheTimeKey);
      
      if (cachedJson == null || cacheTimeStr == null) return null;
      
      final cacheTime = DateTime.parse(cacheTimeStr);
      final now = DateTime.now();
      
      if (now.difference(cacheTime) > _cacheValidDuration) {
        Logger.logInfo('Cached announcements expired', tag: 'PreloadService');
        return null;
      }
      
      final jsonData = json.decode(cachedJson) as Map<String, dynamic>;
      return AnnouncementsResponseModel.fromJson(jsonData);
    } catch (e) {
      Logger.logError('Failed to get cached announcements', error: e, tag: 'PreloadService');
      return null;
    }
  }
  
  // MARK: - Get Cached Stats
  CreatorStatsModel? getCachedStats() {
    if (!_isInitialized || _prefs == null) return null;
    
    try {
      final cachedJson = _prefs!.getString(_statsCacheKey);
      final cacheTimeStr = _prefs!.getString(_statsCacheTimeKey);
      
      if (cachedJson == null || cacheTimeStr == null) return null;
      
      final cacheTime = DateTime.parse(cacheTimeStr);
      final now = DateTime.now();
      
      if (now.difference(cacheTime) > _cacheValidDuration) {
        Logger.logInfo('Cached stats expired', tag: 'PreloadService');
        return null;
      }
      
      final jsonData = json.decode(cachedJson) as Map<String, dynamic>;
      return CreatorStatsModel.fromJson(jsonData);
    } catch (e) {
      Logger.logError('Failed to get cached stats', error: e, tag: 'PreloadService');
      return null;
    }
  }
  
  // MARK: - Cache Management
  Future<void> _cacheAnnouncements(List<AnnouncementModel> announcements) async {
    if (_prefs == null) return;
    
    try {
      final jsonData = {
        'announcements': announcements.map((a) => a.toJson()).toList(),
      };
      await _prefs!.setString(_announcementsCacheKey, json.encode(jsonData));
      await _prefs!.setString(_announcementsCacheTimeKey, DateTime.now().toIso8601String());
    } catch (e) {
      Logger.logError('Failed to cache announcements', error: e, tag: 'PreloadService');
    }
  }
  
  Future<void> _cacheStats(CreatorStatsModel stats) async {
    if (_prefs == null) return;
    
    try {
      await _prefs!.setString(_statsCacheKey, json.encode(stats.toJson()));
      await _prefs!.setString(_statsCacheTimeKey, DateTime.now().toIso8601String());
    } catch (e) {
      Logger.logError('Failed to cache stats', error: e, tag: 'PreloadService');
    }
  }
  
  // MARK: - Clear Cache
  Future<void> clearCache() async {
    if (_prefs == null) return;
    
    try {
      await _prefs!.remove(_announcementsCacheKey);
      await _prefs!.remove(_statsCacheKey);
      await _prefs!.remove(_announcementsCacheTimeKey);
      await _prefs!.remove(_statsCacheTimeKey);
      Logger.logInfo('Cache cleared', tag: 'PreloadService');
    } catch (e) {
      Logger.logError('Failed to clear cache', error: e, tag: 'PreloadService');
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add cache size management and automatic cleanup
// - Implement cache compression for large data sets
// - Add cache hit/miss metrics
// - Create cache warming strategies
// - Add support for incremental updates
// - Implement cache versioning for schema changes

