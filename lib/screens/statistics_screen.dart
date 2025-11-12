/*
 * Filename: statistics_screen.dart
 * Purpose: Screen displaying creator statistics and network metrics
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-11-12
 * Dependencies: flutter/material.dart, api_service.dart, models, widgets
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/creator_stats_model.dart';
import 'package:infinitum_live_creator_network/services/api_service.dart';
import 'package:infinitum_live_creator_network/services/preload_service.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/stat_card_widget.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:shimmer/shimmer.dart';

// MARK: - Statistics Screen
class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final ApiService _apiService = ApiService();
  CreatorStatsModel? _stats;
  bool _isLoading = true;
  String? _errorMessage;
  
  // MARK: - Lifecycle Methods
  @override
  void initState() {
    super.initState();
    _loadStatistics();
  }
  
  // MARK: - Data Loading
  Future<void> _loadStatistics() async {
    // Try to load from cache first for instant display
    final cachedStats = PreloadService().getCachedStats();
    if (cachedStats != null && mounted) {
      setState(() {
        _stats = cachedStats;
        _isLoading = false;
        _errorMessage = null;
      });
    } else {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }
    
    // Then fetch fresh data in background
    try {
      final stats = await _apiService.fetchCreatorStats();
      if (mounted) {
        setState(() {
          _stats = stats;
          _isLoading = false;
        });
      }
    } catch (e) {
      Logger.logError('Failed to load statistics', error: e, tag: 'StatisticsScreen');
      if (mounted) {
        setState(() {
          // Only show error if we don't have cached data
          if (_stats == null) {
            _errorMessage = 'Failed to load statistics. Please try again later.';
          }
          _isLoading = false;
        });
      }
    }
  }
  
  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: RefreshIndicator(
        onRefresh: _loadStatistics,
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
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        _buildShimmerCard(),
        const SizedBox(height: 16),
        _buildShimmerCard(),
      ],
    );
  }
  
  Widget _buildShimmerCard() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: GlassCardWidget(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 120,
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
              onPressed: _loadStatistics,
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
    final theme = Theme.of(context);
    
    if (_stats == null) {
      return const Center(child: Text('No statistics available'));
    }
    
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        // Header
        Text(
          'Creator Network Statistics',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Real-time data from our creator network',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        
        // Statistics Cards
        Row(
          children: [
            Expanded(
              child: StatCardWidget(
                title: 'TikTok Creators',
                value: _stats!.formattedTotalCreators,
                icon: Icons.people,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCardWidget(
                title: 'Favorited Creators',
                value: _stats!.formattedFavoritedCreators,
                icon: Icons.star,
                color: Colors.purple,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Detailed Stats
        GlassCardWidget(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detailed Statistics',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              _StatRow(
                label: 'Total TikTok Creators',
                value: _stats!.totalCreators.toString(),
              ),
              const Divider(),
              _StatRow(
                label: 'Favorited LIVE Creators',
                value: _stats!.favoritedCreators.toString(),
              ),
              if (_stats!.lastUpdated != null) ...[
                const Divider(),
                _StatRow(
                  label: 'Last Updated',
                  value: _formatDate(_stats!.lastUpdated!),
                ),
              ],
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              // Discord Community Link
              InkWell(
                onTap: () async {
                  Logger.logInfo('Opening Discord community link', tag: 'StatisticsScreen');
                  await UrlLauncherUtil.launchUrl(
                    AppConfig.discordCommunityUrl,
                    context: context,
                    title: 'Discord Community',
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              theme.colorScheme.primary.withOpacity(0.2),
                              theme.colorScheme.primary.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: theme.colorScheme.primary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Join the Discord Community',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Connect with other creators',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
  
  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}

// MARK: - Stat Row Widget
class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  
  const _StatRow({
    required this.label,
    required this.value,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add historical charts and graphs
// - Implement statistics filtering by date range
// - Add export functionality for statistics
// - Create comparison views (month over month)
// - Add platform-specific breakdowns
// - Implement real-time updates with WebSocket
// - Add statistics sharing functionality
// - Create detailed analytics dashboard

