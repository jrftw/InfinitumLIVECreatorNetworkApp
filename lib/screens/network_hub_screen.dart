/*
 * Filename: network_hub_screen.dart
 * Purpose: Network tab with live public stats, InfiniCore announcements, and member tools
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, api_service.dart, models, hub widgets
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/announcement_model.dart';
import 'package:infinitum_live_creator_network/models/creator_stats_model.dart';
import 'package:infinitum_live_creator_network/services/api_service.dart';
import 'package:infinitum_live_creator_network/services/preload_service.dart';
import 'package:infinitum_live_creator_network/widgets/banner_ad_widget.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_announcement_card.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_hub_link_card.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:infinitum_live_creator_network/widgets/stat_card_widget.dart';
import 'package:shimmer/shimmer.dart';

// MARK: - Network Hub Screen
class NetworkHubScreen extends StatefulWidget {
  final Widget? settingsAction;

  const NetworkHubScreen({
    super.key,
    this.settingsAction,
  });

  @override
  State<NetworkHubScreen> createState() => _NetworkHubScreenState();
}

class _NetworkHubScreenState extends State<NetworkHubScreen> {
  final ApiService _networkHubApiService = ApiService();
  CreatorNetworkPublicStatsModel? _networkHubStats;
  List<AnnouncementModel> _networkHubAnnouncements = [];
  bool _networkHubIsLoading = true;
  String? _networkHubErrorMessage;

  // MARK: - Lifecycle
  @override
  void initState() {
    super.initState();
    _networkHubLoadContent();
  }

  // MARK: - Data Loading
  Future<void> _networkHubLoadContent() async {
    final CreatorNetworkPublicStatsModel? cachedStats =
        PreloadService().getCachedStats();
    final AnnouncementsResponseModel? cachedAnnouncements =
        PreloadService().getCachedAnnouncements();

    if (mounted && (cachedStats != null || cachedAnnouncements != null)) {
      setState(() {
        _networkHubStats = cachedStats ?? _networkHubStats;
        _networkHubAnnouncements =
            cachedAnnouncements?.announcements ?? _networkHubAnnouncements;
        _networkHubIsLoading = false;
        _networkHubErrorMessage = null;
      });
    } else if (mounted) {
      setState(() {
        _networkHubIsLoading = true;
        _networkHubErrorMessage = null;
      });
    }

    CreatorNetworkPublicStatsModel? freshStats = _networkHubStats;
    List<AnnouncementModel> freshAnnouncements = _networkHubAnnouncements;
    String? statsError;
    String? announcementsError;

    try {
      freshStats = await _networkHubApiService.fetchCreatorStats();
    } catch (e) {
      Logger.logError(
        'Failed to load public network stats',
        error: e,
        tag: 'NetworkHubScreen',
      );
      statsError = e.toString().replaceFirst('Exception: ', '');
    }

    try {
      freshAnnouncements =
          (await _networkHubApiService.fetchAnnouncements()).announcements;
    } catch (e) {
      Logger.logError(
        'Failed to load public announcements',
        error: e,
        tag: 'NetworkHubScreen',
      );
      announcementsError = e.toString().replaceFirst('Exception: ', '');
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _networkHubStats = freshStats;
      _networkHubAnnouncements = freshAnnouncements;
      _networkHubIsLoading = false;
      if (freshStats == null && freshAnnouncements.isEmpty) {
        _networkHubErrorMessage = statsError ?? announcementsError;
      } else {
        _networkHubErrorMessage = null;
      }
    });
  }

  // MARK: - Build
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.networkTab),
        actions: [
          if (widget.settingsAction != null) widget.settingsAction!,
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _networkHubLoadContent,
        child: _networkHubIsLoading && _networkHubStats == null
            ? _networkHubBuildLoadingState()
            : _networkHubErrorMessage != null
                ? _networkHubBuildErrorState()
                : _networkHubBuildContent(),
      ),
    );
  }

  Widget _networkHubBuildLoadingState() {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: const EdgeInsets.all(16),
      children: List<Widget>.generate(3, (int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Shimmer.fromColors(
            baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
            highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
            child: const GlassCardWidget(
              padding: EdgeInsets.all(20),
              child: SizedBox(height: 120),
            ),
          ),
        );
      }),
    );
  }

  Widget _networkHubBuildErrorState() {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  _networkHubErrorMessage ?? l10n.anErrorOccurred,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _networkHubLoadContent,
                icon: const Icon(Icons.refresh),
                label: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _networkHubBuildContent() {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final CreatorNetworkPublicStatsModel? stats = _networkHubStats;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          l10n.creatorNetworkStatistics,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          stats?.monthLabel.isNotEmpty == true
              ? l10n.networkStatsMonthSubtitle(stats!.monthLabel)
              : l10n.networkStatsLiveSubtitle,
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        if (stats != null) ...[
          Row(
            children: [
              Expanded(
                child: StatCardWidget(
                  title: l10n.rosterCreators,
                  value: stats.formattedRosterCreatorCount,
                  icon: Icons.people,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCardWidget(
                  title: l10n.diamonds,
                  value: stats.formattedMonthDiamonds,
                  icon: Icons.diamond,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: StatCardWidget(
                  title: l10n.liveHours,
                  value: stats.formattedMonthLiveHours,
                  icon: Icons.schedule,
                  color: theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCardWidget(
                  title: l10n.validDays,
                  value: stats.formattedMonthValidDays,
                  icon: Icons.calendar_month,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.detailedStatistics,
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                _NetworkHubStatRow(
                  label: l10n.thisMonthCreators,
                  value: creatorNetworkPublicStatsFormatCount(
                    stats.month.creators,
                  ),
                ),
                const Divider(),
                _NetworkHubStatRow(
                  label: l10n.estimatedEarningsUsd,
                  value: creatorNetworkPublicStatsFormatUsd(
                    stats.month.liveEarningsUsd,
                  ),
                ),
                const Divider(),
                _NetworkHubStatRow(
                  label: l10n.totalFollowers,
                  value: creatorNetworkPublicStatsFormatCount(
                    stats.total.followers,
                  ),
                ),
                const Divider(),
                _NetworkHubStatRow(
                  label: l10n.videosPosted,
                  value: creatorNetworkPublicStatsFormatCount(
                    stats.total.videos,
                  ),
                ),
                if (stats.generatedAt != null) ...[
                  const Divider(),
                  _NetworkHubStatRow(
                    label: l10n.lastUpdated,
                    value: _networkHubFormatTimestamp(stats.generatedAt!),
                  ),
                ],
                if (stats.tiktokCreatorPayoutsDisclaimer.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    stats.tiktokCreatorPayoutsDisclaimer,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),
        ],
        const SizedBox(height: 28),
        Text(
          l10n.memberTools,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        CreatorNetworkHubLinkCard(
          title: l10n.joinDiscordCommunity,
          subtitle: l10n.connectWithOtherCreators,
          icon: Icons.forum,
          url: AppConfig.discordCommunityUrl,
        ),
        const SizedBox(height: 12),
        CreatorNetworkHubLinkCard(
          title: l10n.estimateEarnings,
          subtitle: l10n.estimateEarningsSubtitle,
          icon: Icons.calculate,
          url: AppConfig.estimateEarningsUrl,
        ),
        const SizedBox(height: 12),
        CreatorNetworkHubLinkCard(
          title: l10n.shadowBanChecker,
          subtitle: l10n.shadowBanCheckerSubtitle,
          icon: Icons.visibility_off,
          url: AppConfig.shadowBanCheckerUrl,
        ),
        const SizedBox(height: 12),
        CreatorNetworkHubLinkCard(
          title: l10n.merch,
          subtitle: l10n.merchSubtitle,
          icon: Icons.shopping_bag,
          url: AppConfig.merchUrl,
        ),
        const SizedBox(height: 12),
        CreatorNetworkHubLinkCard(
          title: l10n.infinitumStatus,
          subtitle: l10n.infinitumStatusSubtitle,
          icon: Icons.monitor_heart,
          url: AppConfig.statusPageUrl,
        ),
        const SizedBox(height: 28),
        Text(
          l10n.announcements,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        if (_networkHubAnnouncements.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              l10n.noAnnouncementsAvailable,
              style: theme.textTheme.bodyLarge,
            ),
          )
        else
          ..._networkHubAnnouncements.map((AnnouncementModel announcement) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CreatorNetworkAnnouncementCard(
                announcement: announcement,
              ),
            );
          }),
        const BannerAdContainer(
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ],
    );
  }

  String _networkHubFormatTimestamp(DateTime date) {
    final String minute = date.minute.toString().padLeft(2, '0');
    return '${date.month}/${date.day}/${date.year} ${date.hour}:$minute';
  }
}

// MARK: - Stat Row
class _NetworkHubStatRow extends StatelessWidget {
  final String label;
  final String value;

  const _NetworkHubStatRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyLarge,
          ),
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
// - Split stats / announcements into inner tabs if the feed grows long
// - Add pull-to-refresh last-updated relative time ("2 minutes ago")
