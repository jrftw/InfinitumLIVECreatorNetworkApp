/*
 * Filename: creator_stats_model.dart
 * Purpose: Data model for creator statistics from API
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: None
 * Platform Compatibility: iOS, Android, Web
 */

// MARK: - Creator Statistics Model
class CreatorStatsModel {
  final int totalCreators;
  final int favoritedCreators;
  final DateTime? lastUpdated;
  
  CreatorStatsModel({
    required this.totalCreators,
    required this.favoritedCreators,
    this.lastUpdated,
  });
  
  // MARK: - JSON Serialization
  factory CreatorStatsModel.fromJson(Map<String, dynamic> json) {
    return CreatorStatsModel(
      totalCreators: _parseInt(json['totalCreators'] ?? json['totalcreators'] ?? 0),
      favoritedCreators: _parseInt(json['favoritedCreators'] ?? json['favoritedcreators'] ?? 0),
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.tryParse(json['lastUpdated'].toString())
          : null,
    );
  }
  
  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
  
  Map<String, dynamic> toJson() {
    return {
      'totalCreators': totalCreators,
      'favoritedCreators': favoritedCreators,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }
  
  // MARK: - Computed Properties
  String get formattedTotalCreators {
    if (totalCreators >= 1000000) {
      return '${(totalCreators / 1000000).toStringAsFixed(1)}M';
    } else if (totalCreators >= 1000) {
      return '${(totalCreators / 1000).toStringAsFixed(1)}K';
    }
    return totalCreators.toString();
  }
  
  String get formattedFavoritedCreators {
    if (favoritedCreators >= 1000000) {
      return '${(favoritedCreators / 1000000).toStringAsFixed(1)}M';
    } else if (favoritedCreators >= 1000) {
      return '${(favoritedCreators / 1000).toStringAsFixed(1)}K';
    }
    return favoritedCreators.toString();
  }
}

// Suggestions For Features and Additions Later:
// - Add more detailed statistics (diamonds, viewers, followers)
// - Implement historical data tracking
// - Add growth rate calculations
// - Create statistics breakdown by platform
// - Add regional statistics
// - Implement statistics comparison over time periods

