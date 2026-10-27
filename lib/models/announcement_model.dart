/*
 * Filename: announcement_model.dart
 * Purpose: Public announcement models for InfiniCore items and GitHub legacy JSON
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: None
 * Platform Compatibility: iOS, Android, Web
 */

// MARK: - Announcement Model
class AnnouncementModel {
  final String id;
  final String title;
  final String content;
  final DateTime? date;
  final String? imageUrl;
  final bool isImportant;
  final String? link;
  final String source;

  AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    this.date,
    this.imageUrl,
    this.isImportant = false,
    this.link,
    this.source = 'unknown',
  });

  // MARK: - JSON Serialization
  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    final String? parsedLink = _announcementModelFirstLink(json);
    final DateTime? parsedDate = _announcementModelParseDate(json);
    final String content = (json['body'] ??
            json['content'] ??
            json['message'] ??
            json['description'] ??
            '')
        .toString();

    return AnnouncementModel(
      id: json['id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      title: json['title']?.toString() ?? 'Untitled',
      content: content,
      date: parsedDate,
      imageUrl: json['imageUrl']?.toString() ?? json['image']?.toString(),
      isImportant: json['isImportant'] == true ||
          json['important'] == true ||
          json['requiresAcknowledgement'] == true,
      link: parsedLink,
      source: json['source']?.toString() ?? 'unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': content,
      'content': content,
      'date': date?.toIso8601String(),
      'imageUrl': imageUrl,
      'isImportant': isImportant,
      'link': link,
      'source': source,
    };
  }

  static String? _announcementModelFirstLink(Map<String, dynamic> json) {
    final dynamic linkItems = json['linkItems'];
    if (linkItems is List) {
      for (final dynamic item in linkItems) {
        if (item is Map<String, dynamic>) {
          final String url = (item['url'] ?? '').toString().trim();
          if (url.isNotEmpty) {
            return url;
          }
        }
      }
    }

    final dynamic links = json['links'];
    if (links is List) {
      for (final dynamic item in links) {
        if (item is String && item.trim().isNotEmpty) {
          return item.trim();
        }
      }
    }

    final dynamic linkValue = json['link'] ?? json['url'];
    if (linkValue is String && linkValue.trim().isNotEmpty) {
      return linkValue.trim();
    }
    if (linkValue is List) {
      for (final dynamic item in linkValue) {
        if (item is String && item.trim().isNotEmpty) {
          return item.trim();
        }
      }
    }
    return null;
  }

  static DateTime? _announcementModelParseDate(Map<String, dynamic> json) {
    final List<dynamic> candidates = [
      json['publishAt'],
      json['createdAt'],
      json['displayDate'],
      json['date'],
      json['timestamp'],
    ];
    for (final dynamic candidate in candidates) {
      if (candidate == null) {
        continue;
      }
      final DateTime? parsed = DateTime.tryParse(candidate.toString());
      if (parsed != null) {
        return parsed;
      }
    }
    return null;
  }
}

// MARK: - Announcements Response Model
class AnnouncementsResponseModel {
  final List<AnnouncementModel> announcements;
  final DateTime? lastUpdated;

  AnnouncementsResponseModel({
    required this.announcements,
    this.lastUpdated,
  });

  factory AnnouncementsResponseModel.fromJson(Map<String, dynamic> json) {
    final dynamic announcementsList =
        json['items'] ?? json['announcements'] ?? json['data'] ?? [];
    final List<AnnouncementModel> announcements = [];

    if (announcementsList is List) {
      for (final dynamic item in announcementsList) {
        if (item is Map<String, dynamic>) {
          announcements.add(AnnouncementModel.fromJson(item));
        }
      }
    }

    return AnnouncementsResponseModel(
      announcements: announcements,
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.tryParse(json['lastUpdated'].toString())
          : null,
    );
  }

  factory AnnouncementsResponseModel.fromList(List<dynamic> items) {
    return AnnouncementsResponseModel.fromJson({'items': items});
  }
}

// Suggestions For Features and Additions Later:
// - Render InfiniCore linkItems as labeled buttons instead of a single CTA
// - Show announcement images when InfiniCore native posts include imageUrl
// - Add local read-state for public visitors without InfiniView accounts
