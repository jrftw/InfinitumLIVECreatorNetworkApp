/*
 * Filename: creator_stats_model.dart
 * Purpose: Marketing-safe public network stats from InfiniView GET /public/network-stats
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: None
 * Platform Compatibility: iOS, Android, Web
 */

// MARK: - Public Network Stats Model
class CreatorNetworkPublicStatsModel {
  final String networkName;
  final String establishedLabel;
  final String establishedLocation;
  final int rosterCreatorCount;
  final String monthLabel;
  final String monthKey;
  final DateTime? generatedAt;
  final bool tiktokMonthlyMetricsWarmingUp;
  final String tiktokCreatorPayoutsDisclaimer;
  final CreatorNetworkPublicStatsMonthBucket month;
  final CreatorNetworkPublicStatsTotalBucket total;

  CreatorNetworkPublicStatsModel({
    required this.networkName,
    required this.establishedLabel,
    required this.establishedLocation,
    required this.rosterCreatorCount,
    required this.monthLabel,
    required this.monthKey,
    required this.tiktokMonthlyMetricsWarmingUp,
    required this.tiktokCreatorPayoutsDisclaimer,
    required this.month,
    required this.total,
    this.generatedAt,
  });

  // MARK: - JSON Serialization
  factory CreatorNetworkPublicStatsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> monthJson =
        json['month'] is Map<String, dynamic>
            ? json['month'] as Map<String, dynamic>
            : <String, dynamic>{};
    final Map<String, dynamic> totalJson =
        json['total'] is Map<String, dynamic>
            ? json['total'] as Map<String, dynamic>
            : <String, dynamic>{};

    return CreatorNetworkPublicStatsModel(
      networkName: json['networkName']?.toString() ??
          'Infinitum LIVE Creator Network',
      establishedLabel: json['establishedLabel']?.toString() ?? 'March 2023',
      establishedLocation: json['establishedLocation']?.toString() ??
          'Pittsburgh, Pennsylvania, United States',
      rosterCreatorCount: _creatorNetworkPublicStatsParseInt(
        json['rosterCreatorCount'] ?? json['totalCreators'] ?? 0,
      ),
      monthLabel: json['monthLabel']?.toString() ?? '',
      monthKey: json['monthKey']?.toString() ?? '',
      generatedAt: json['generatedAt'] != null
          ? DateTime.tryParse(json['generatedAt'].toString())
          : null,
      tiktokMonthlyMetricsWarmingUp:
          json['tiktokMonthlyMetricsWarmingUp'] == true,
      tiktokCreatorPayoutsDisclaimer:
          json['tiktokCreatorPayoutsDisclaimer']?.toString() ?? '',
      month: CreatorNetworkPublicStatsMonthBucket.fromJson(monthJson),
      total: CreatorNetworkPublicStatsTotalBucket.fromJson(totalJson),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'networkName': networkName,
      'establishedLabel': establishedLabel,
      'establishedLocation': establishedLocation,
      'rosterCreatorCount': rosterCreatorCount,
      'monthLabel': monthLabel,
      'monthKey': monthKey,
      'generatedAt': generatedAt?.toIso8601String(),
      'tiktokMonthlyMetricsWarmingUp': tiktokMonthlyMetricsWarmingUp,
      'tiktokCreatorPayoutsDisclaimer': tiktokCreatorPayoutsDisclaimer,
      'month': month.toJson(),
      'total': total.toJson(),
    };
  }

  // MARK: - Display Helpers
  String get formattedRosterCreatorCount =>
      _creatorNetworkPublicStatsFormatCount(rosterCreatorCount);

  String get formattedMonthDiamonds =>
      _creatorNetworkPublicStatsFormatCount(month.diamonds);

  String get formattedMonthLiveHours =>
      _creatorNetworkPublicStatsFormatCount(month.liveHours.round());

  String get formattedMonthValidDays =>
      _creatorNetworkPublicStatsFormatCount(month.validDays);

  String get formattedMonthVideos =>
      _creatorNetworkPublicStatsFormatCount(month.videos);

  String get formattedMonthLikes =>
      _creatorNetworkPublicStatsFormatCount(month.likes);

  String get formattedMonthFollowersGained =>
      _creatorNetworkPublicStatsFormatCount(month.followersGained);

  String get formattedMonthEarnings =>
      creatorNetworkPublicStatsFormatUsd(month.liveEarningsUsd);

  String get formattedTotalDiamonds {
    final int? diamonds = total.diamonds;
    if (diamonds == null) {
      return '—';
    }
    return _creatorNetworkPublicStatsFormatCount(diamonds);
  }

  String get formattedTotalFollowers =>
      _creatorNetworkPublicStatsFormatCount(total.followers);

  String get formattedTotalVideos =>
      _creatorNetworkPublicStatsFormatCount(total.videos);

  String get formattedTotalLikes =>
      _creatorNetworkPublicStatsFormatCount(total.likes);

  String get formattedTotalValidDays {
    final int? days = total.validDays;
    if (days == null) {
      return '—';
    }
    return _creatorNetworkPublicStatsFormatCount(days);
  }

  String get formattedTotalEarnings =>
      creatorNetworkPublicStatsFormatUsd(total.liveEarningsUsd);

  DateTime? get lastUpdated => generatedAt;
}

// MARK: - Month Bucket
class CreatorNetworkPublicStatsMonthBucket {
  final int creators;
  final int diamonds;
  final double? liveEarningsUsd;
  final String earningsSource;
  final int followersGained;
  final int validDays;
  final double liveHours;
  final int videos;
  final int likes;
  final int followers;

  CreatorNetworkPublicStatsMonthBucket({
    required this.creators,
    required this.diamonds,
    required this.earningsSource,
    required this.followersGained,
    required this.validDays,
    required this.liveHours,
    required this.videos,
    required this.likes,
    required this.followers,
    this.liveEarningsUsd,
  });

  factory CreatorNetworkPublicStatsMonthBucket.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreatorNetworkPublicStatsMonthBucket(
      creators: _creatorNetworkPublicStatsParseInt(json['creators']),
      diamonds: _creatorNetworkPublicStatsParseInt(json['diamonds']),
      liveEarningsUsd: _creatorNetworkPublicStatsParseDouble(
        json['liveEarningsUsd'],
      ),
      earningsSource: json['earningsSource']?.toString() ?? 'unavailable',
      followersGained: _creatorNetworkPublicStatsParseInt(
        json['followersGained'],
      ),
      validDays: _creatorNetworkPublicStatsParseInt(json['validDays']),
      liveHours: _creatorNetworkPublicStatsParseDouble(json['liveHours']) ?? 0,
      videos: _creatorNetworkPublicStatsParseInt(json['videos']),
      likes: _creatorNetworkPublicStatsParseInt(json['likes']),
      followers: _creatorNetworkPublicStatsParseInt(json['followers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'creators': creators,
      'diamonds': diamonds,
      'liveEarningsUsd': liveEarningsUsd,
      'earningsSource': earningsSource,
      'followersGained': followersGained,
      'validDays': validDays,
      'liveHours': liveHours,
      'videos': videos,
      'likes': likes,
      'followers': followers,
    };
  }
}

// MARK: - Total Bucket
class CreatorNetworkPublicStatsTotalBucket {
  final int creators;
  final int followers;
  final int videos;
  final int likes;
  final int? diamonds;
  final double? liveEarningsUsd;
  final String earningsSource;
  final int? validDays;
  final bool historyAvailable;

  CreatorNetworkPublicStatsTotalBucket({
    required this.creators,
    required this.followers,
    required this.videos,
    required this.likes,
    required this.earningsSource,
    required this.historyAvailable,
    this.diamonds,
    this.liveEarningsUsd,
    this.validDays,
  });

  factory CreatorNetworkPublicStatsTotalBucket.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreatorNetworkPublicStatsTotalBucket(
      creators: _creatorNetworkPublicStatsParseInt(json['creators']),
      followers: _creatorNetworkPublicStatsParseInt(json['followers']),
      videos: _creatorNetworkPublicStatsParseInt(json['videos']),
      likes: _creatorNetworkPublicStatsParseInt(json['likes']),
      diamonds: json['diamonds'] == null
          ? null
          : _creatorNetworkPublicStatsParseInt(json['diamonds']),
      liveEarningsUsd: _creatorNetworkPublicStatsParseDouble(
        json['liveEarningsUsd'],
      ),
      earningsSource: json['earningsSource']?.toString() ?? 'unavailable',
      validDays: json['validDays'] == null
          ? null
          : _creatorNetworkPublicStatsParseInt(json['validDays']),
      historyAvailable: json['historyAvailable'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'creators': creators,
      'followers': followers,
      'videos': videos,
      'likes': likes,
      'diamonds': diamonds,
      'liveEarningsUsd': liveEarningsUsd,
      'earningsSource': earningsSource,
      'validDays': validDays,
      'historyAvailable': historyAvailable,
    };
  }
}

// MARK: - Parsing Helpers
int _creatorNetworkPublicStatsParseInt(dynamic value) {
  if (value is int) {
    return value;
  }
  if (value is double) {
    return value.round();
  }
  if (value is String) {
    return int.tryParse(value.replaceAll(',', '')) ?? 0;
  }
  return 0;
}

double? _creatorNetworkPublicStatsParseDouble(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is double) {
    return value;
  }
  if (value is int) {
    return value.toDouble();
  }
  if (value is String) {
    return double.tryParse(value.replaceAll(',', ''));
  }
  return null;
}

String _creatorNetworkPublicStatsFormatCount(int value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(1)}M';
  }
  if (value >= 1000) {
    return '${(value / 1000).toStringAsFixed(1)}K';
  }
  return value.toString();
}

String creatorNetworkPublicStatsFormatUsd(double? value) {
  if (value == null) {
    return '—';
  }
  if (value >= 1000000) {
    return '\$${(value / 1000000).toStringAsFixed(1)}M';
  }
  if (value >= 1000) {
    return '\$${(value / 1000).toStringAsFixed(1)}K';
  }
  return '\$${value.toStringAsFixed(0)}';
}

String creatorNetworkPublicStatsFormatCount(int value) {
  return _creatorNetworkPublicStatsFormatCount(value);
}

// Suggestions For Features and Additions Later:
// - Add month-over-month deltas once the public API exposes prior-month buckets
// - Localize compact number formatting per selected locale
// - Chart recent months when a public history endpoint exists
