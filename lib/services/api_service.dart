/*
 * Filename: api_service.dart
 * Purpose: Service for fetching data from external APIs
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: dart:async, dart:convert, http package, app_config.dart, logger.dart, models
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/announcement_model.dart';
import 'package:infinitum_live_creator_network/models/creator_stats_model.dart';

// MARK: - API Service
class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();
  
  // MARK: - Fetch Announcements
  Future<AnnouncementsResponseModel> fetchAnnouncements() async {
    try {
      Logger.logInfo('Fetching announcements from API: ${AppConfig.announcementsUrl}', tag: 'ApiService');
      
      final response = await http
          .get(Uri.parse(AppConfig.announcementsUrl))
          .timeout(AppConfig.apiTimeout);
      
      Logger.logInfo('API Response Status: ${response.statusCode}', tag: 'ApiService');
      
      if (response.statusCode == 200) {
        try {
          final decodedData = json.decode(response.body);
          
          // Handle case where API returns a List directly
          Map<String, dynamic> jsonData;
          if (decodedData is List) {
            Logger.logInfo('API returned a List, converting to Map format', tag: 'ApiService');
            jsonData = {'announcements': decodedData};
          } else if (decodedData is Map<String, dynamic>) {
            jsonData = decodedData;
          } else {
            throw FormatException('Unexpected JSON format: ${decodedData.runtimeType}');
          }
          
          final announcementsResponse = AnnouncementsResponseModel.fromJson(jsonData);
          
          Logger.logInfo(
            'Successfully fetched ${announcementsResponse.announcements.length} announcements',
            tag: 'ApiService',
          );
          
          return announcementsResponse;
        } catch (e) {
          Logger.logError(
            'Failed to parse announcements JSON',
            error: e,
            tag: 'ApiService',
          );
          throw Exception('Failed to parse announcements data: ${e.toString()}');
        }
      } else {
        Logger.logError(
          'Failed to fetch announcements: HTTP ${response.statusCode}',
          tag: 'ApiService',
        );
        throw Exception('Failed to load announcements: HTTP ${response.statusCode}');
      }
    } on TimeoutException {
      Logger.logError(
        'Request timeout while fetching announcements',
        tag: 'ApiService',
      );
      throw Exception('Request timed out. Please check your internet connection and try again.');
    } on FormatException catch (e) {
      Logger.logError(
        'JSON format error while fetching announcements',
        error: e,
        tag: 'ApiService',
      );
      throw Exception('Invalid data format received: ${e.message}');
    } catch (e, stackTrace) {
      Logger.logError(
        'Error fetching announcements: ${e.toString()}',
        error: e,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      
      // Provide more user-friendly error messages
      if (e.toString().contains('SocketException') || e.toString().contains('Network')) {
        throw Exception('Network error. Please check your internet connection and try again.');
      } else if (e.toString().contains('Failed host lookup')) {
        throw Exception('Cannot reach server. Please check your internet connection.');
      } else {
        rethrow;
      }
    }
  }
  
  // MARK: - Fetch Creator Statistics
  Future<CreatorStatsModel> fetchCreatorStats() async {
    try {
      Logger.logInfo('Fetching creator statistics from API', tag: 'ApiService');
      
      final response = await http
          .get(Uri.parse(AppConfig.creatorStatsUrl))
          .timeout(AppConfig.apiTimeout);
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final stats = CreatorStatsModel.fromJson(jsonData);
        
        Logger.logInfo(
          'Successfully fetched creator stats: ${stats.totalCreators} TikTok, ${stats.favoritedCreators} Favorited',
          tag: 'ApiService',
        );
        
        return stats;
      } else {
        Logger.logError(
          'Failed to fetch creator stats: HTTP ${response.statusCode}',
          tag: 'ApiService',
        );
        throw Exception('Failed to load creator statistics: HTTP ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      Logger.logError(
        'Error fetching creator statistics',
        error: e,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      rethrow;
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add request caching to reduce API calls
// - Implement retry logic with exponential backoff
// - Add request/response interceptors for logging
// - Create offline mode with local data storage
// - Add API response validation and error handling
// - Implement rate limiting to prevent excessive requests
// - Add support for pagination for large data sets

