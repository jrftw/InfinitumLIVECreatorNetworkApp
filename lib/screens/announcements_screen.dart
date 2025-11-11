/*
 * Filename: announcements_screen.dart
 * Purpose: Screen displaying network announcements and updates
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, api_service.dart, models
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/announcement_model.dart';
import 'package:infinitum_live_creator_network/services/api_service.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

// MARK: - Announcements Screen
class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  final ApiService _apiService = ApiService();
  List<AnnouncementModel> _announcements = [];
  bool _isLoading = true;
  String? _errorMessage;
  
  // MARK: - Lifecycle Methods
  @override
  void initState() {
    super.initState();
    _loadAnnouncements();
  }
  
  // MARK: - Data Loading
  Future<void> _loadAnnouncements() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      final response = await _apiService.fetchAnnouncements();
      setState(() {
        _announcements = response.announcements;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      Logger.logError('Failed to load announcements', error: e, tag: 'AnnouncementsScreen');
      setState(() {
        // Use the error message from the exception if available, otherwise use generic message
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }
  
  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
      ),
      body: RefreshIndicator(
        onRefresh: _loadAnnouncements,
        child: _isLoading
            ? _buildLoadingState()
            : _errorMessage != null
                ? _buildErrorState()
                : _buildContent(),
      ),
    );
  }
  
  // MARK: - Loading State
  Widget _buildLoadingState() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildShimmerCard(),
        ),
      ),
    );
  }
  
  Widget _buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
  
  // MARK: - Error State
  Widget _buildErrorState() {
    final theme = Theme.of(context);
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              _errorMessage ?? 'An error occurred',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _loadAnnouncements,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
  
  // MARK: - Content
  Widget _buildContent() {
    if (_announcements.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No announcements available',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _announcements.length,
      itemBuilder: (context, index) {
        final announcement = _announcements[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _AnnouncementCard(announcement: announcement),
        );
      },
    );
  }
}

// MARK: - Announcement Card Widget
class _AnnouncementCard extends StatelessWidget {
  final AnnouncementModel announcement;
  
  const _AnnouncementCard({
    required this.announcement,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: announcement.isImportant ? 4 : 2,
      color: announcement.isImportant
          ? theme.colorScheme.primaryContainer
          : null,
      child: InkWell(
        onTap: announcement.link != null
            ? () => _openLink(context, announcement.link!)
            : null,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  if (announcement.isImportant)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'IMPORTANT',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (announcement.isImportant) const SizedBox(width: 8),
                  if (announcement.date != null)
                    Text(
                      _formatDate(announcement.date!),
                      style: theme.textTheme.bodySmall,
                    ),
                  const Spacer(),
                  if (announcement.link != null)
                    Icon(
                      Icons.open_in_new,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Title
              Text(
                announcement.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Content
              Text(
                announcement.content,
                style: theme.textTheme.bodyMedium,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMM d, yyyy').format(date);
    }
  }
  
  void _openLink(BuildContext context, String url) {
    Logger.logInfo('Opening announcement link: $url', tag: 'AnnouncementsScreen');
    UrlLauncherUtil.launchUrl(
      url,
      context: context,
      title: announcement.title,
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add announcement categories and filtering
// - Implement search functionality
// - Add mark as read/unread functionality
// - Create announcement detail view
// - Add push notifications for new announcements
// - Implement announcement sharing
// - Add support for rich media content
// - Create announcement favorites/bookmarks

