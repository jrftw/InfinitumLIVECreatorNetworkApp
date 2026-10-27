/*
 * Filename: api_service.dart
 * Purpose: Fetch public InfiniCore announcements and InfiniView network stats
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: dart:async, dart:convert, http, app_config.dart, logger.dart, models
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
  /// Loads network-wide InfiniCore announcements, then GitHub JSON if Core fails.
  Future<AnnouncementsResponseModel> fetchAnnouncements() async {
    try {
      return await _apiServiceFetchInfinicoreAnnouncements();
    } catch (coreError, coreStack) {
      Logger.logError(
        'InfiniCore public announcements failed; trying GitHub fallback',
        error: coreError,
        stackTrace: coreStack,
        tag: 'ApiService',
      );
      try {
        return await _apiServiceFetchGithubLegacyAnnouncements();
      } catch (githubError, githubStack) {
        Logger.logError(
          'GitHub announcement fallback also failed',
          error: githubError,
          stackTrace: githubStack,
          tag: 'ApiService',
        );
        throw Exception(
          'Unable to load announcements. Please check your connection and try again.',
        );
      }
    }
  }

  Future<AnnouncementsResponseModel> _apiServiceFetchInfinicoreAnnouncements() async {
    Logger.logInfo(
      'Fetching InfiniCore public announcements: ${AppConfig.infinicorePublicAnnouncementsUrl}',
      tag: 'ApiService',
    );

    final http.Response response = await http
        .get(Uri.parse(AppConfig.infinicorePublicAnnouncementsUrl))
        .timeout(AppConfig.apiTimeout);

    Logger.logInfo(
      'InfiniCore announcements HTTP ${response.statusCode}',
      tag: 'ApiService',
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load announcements: HTTP ${response.statusCode}',
      );
    }

    final dynamic decodedData = json.decode(response.body);
    if (decodedData is! Map<String, dynamic>) {
      throw const FormatException('InfiniCore announcements were not a JSON object');
    }

    final AnnouncementsResponseModel parsed =
        AnnouncementsResponseModel.fromJson(decodedData);
    Logger.logInfo(
      'Fetched ${parsed.announcements.length} InfiniCore public announcements',
      tag: 'ApiService',
    );
    return parsed;
  }

  Future<AnnouncementsResponseModel> _apiServiceFetchGithubLegacyAnnouncements() async {
    Logger.logInfo(
      'Fetching GitHub legacy announcements: ${AppConfig.githubLegacyAnnouncementsUrl}',
      tag: 'ApiService',
    );

    final http.Response response = await http
        .get(Uri.parse(AppConfig.githubLegacyAnnouncementsUrl))
        .timeout(AppConfig.apiTimeout);

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load GitHub announcements: HTTP ${response.statusCode}',
      );
    }

    final dynamic decodedData = json.decode(response.body);
    final AnnouncementsResponseModel parsed;
    if (decodedData is List) {
      parsed = AnnouncementsResponseModel.fromList(decodedData);
    } else if (decodedData is Map<String, dynamic>) {
      parsed = AnnouncementsResponseModel.fromJson(decodedData);
    } else {
      throw FormatException(
        'Unexpected GitHub announcement JSON: ${decodedData.runtimeType}',
      );
    }

    Logger.logInfo(
      'Fetched ${parsed.announcements.length} GitHub fallback announcements',
      tag: 'ApiService',
    );
    return parsed;
  }

  // MARK: - Fetch Creator Statistics
  Future<CreatorNetworkPublicStatsModel> fetchCreatorStats() async {
    try {
      Logger.logInfo(
        'Fetching InfiniView public network stats: ${AppConfig.infiniviewPublicNetworkStatsUrl}',
        tag: 'ApiService',
      );

      final http.Response response = await http
          .get(Uri.parse(AppConfig.infiniviewPublicNetworkStatsUrl))
          .timeout(AppConfig.apiTimeout);

      if (response.statusCode != 200) {
        Logger.logError(
          'Failed to fetch public network stats: HTTP ${response.statusCode}',
          tag: 'ApiService',
        );
        throw Exception(
          'Failed to load network statistics: HTTP ${response.statusCode}',
        );
      }

      final dynamic decodedData = json.decode(response.body);
      if (decodedData is! Map<String, dynamic>) {
        throw const FormatException('Public network stats were not a JSON object');
      }

      final CreatorNetworkPublicStatsModel stats =
          CreatorNetworkPublicStatsModel.fromJson(decodedData);
      Logger.logInfo(
        'Fetched public network stats: roster=${stats.rosterCreatorCount} month=${stats.monthLabel}',
        tag: 'ApiService',
      );
      return stats;
    } on TimeoutException {
      Logger.logError(
        'Request timeout while fetching public network stats',
        tag: 'ApiService',
      );
      throw Exception(
        'Request timed out. Please check your internet connection and try again.',
      );
    } catch (e, stackTrace) {
      Logger.logError(
        'Error fetching public network stats',
        error: e,
        stackTrace: stackTrace,
        tag: 'ApiService',
      );
      if (e.toString().contains('SocketException') ||
          e.toString().contains('Failed host lookup')) {
        throw Exception(
          'Cannot reach InfiniView stats. Please check your internet connection.',
        );
      }
      rethrow;
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add retry with backoff for InfiniCore 60/min public rate limit
// - Send If-None-Match if InfiniCore later exposes an ETag on /public/announcements
// - Cache HTTP 304 handling for the InfiniView public stats 60s Cache-Control
