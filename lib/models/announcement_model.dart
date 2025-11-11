/*
 * Filename: announcement_model.dart
 * Purpose: Data model for announcement objects from API
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
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
  
  AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    this.date,
    this.imageUrl,
    this.isImportant = false,
    this.link,
  });
  
  // MARK: - JSON Serialization
  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['id']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: json['title']?.toString() ?? 'Untitled',
      content: json['content']?.toString() ?? json['message']?.toString() ?? '',
      date: json['date'] != null 
          ? DateTime.tryParse(json['date'].toString())
          : json['timestamp'] != null
              ? DateTime.tryParse(json['timestamp'].toString())
              : null,
      imageUrl: json['imageUrl']?.toString() ?? json['image']?.toString(),
      isImportant: json['isImportant'] == true || json['important'] == true,
      link: json['link']?.toString() ?? json['url']?.toString(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date?.toIso8601String(),
      'imageUrl': imageUrl,
      'isImportant': isImportant,
      'link': link,
    };
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
    final announcementsList = json['announcements'] ?? json['data'] ?? [];
    final List<AnnouncementModel> announcements = [];
    
    if (announcementsList is List) {
      for (var item in announcementsList) {
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
}

// Suggestions For Features and Additions Later:
// - Add support for rich text content (HTML/Markdown)
// - Implement announcement categories/tags
// - Add expiration dates for time-sensitive announcements
// - Create announcement priority levels
// - Add support for attachments and media files
// - Implement announcement read/unread status tracking

