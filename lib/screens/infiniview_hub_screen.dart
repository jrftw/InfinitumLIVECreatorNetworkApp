/*
 * Filename: infiniview_hub_screen.dart
 * Purpose: InfiniView destination with iOS/Android/web CTAs, month and lifetime stats
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, app_config.dart, api_service, stats model
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/models/creator_stats_model.dart';
import 'package:infinitum_live_creator_network/services/api_service.dart';
import 'package:infinitum_live_creator_network/services/preload_service.dart';
import 'package:infinitum_live_creator_network/widgets/banner_ad_widget.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_hub_link_card.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - InfiniView Hub Screen
class InfiniViewHubScreen extends StatefulWidget {
  final Widget? settingsAction;

  const InfiniViewHubScreen({
    super.key,
    this.settingsAction,
  });

  @override
  State<InfiniViewHubScreen> createState() => _InfiniViewHubScreenState();
}

class _InfiniViewHubScreenState extends State<InfiniViewHubScreen> {
  final ApiService _infiniViewHubApiService = ApiService();
  CreatorNetworkPublicStatsModel? _infiniViewHubStats;
  bool _infiniViewHubIsLoading = true;

  bool get _infiniViewHubIsIos =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  bool get _infiniViewHubIsAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  // MARK: - Lifecycle
  @override
  void initState() {
    super.initState();
    _infiniViewHubLoadStats();
  }

  // MARK: - Data
  Future<void> _infiniViewHubLoadStats() async {
    final CreatorNetworkPublicStatsModel? cachedStats =
        PreloadService().getCachedStats();
    if (mounted && cachedStats != null) {
      setState(() {
        _infiniViewHubStats = cachedStats;
        _infiniViewHubIsLoading = false;
      });
    }

    try {
      final CreatorNetworkPublicStatsModel freshStats =
          await _infiniViewHubApiService.fetchCreatorStats();
      if (!mounted) {
        return;
      }
      setState(() {
        _infiniViewHubStats = freshStats;
        _infiniViewHubIsLoading = false;
      });
      Logger.logInfo(
        'InfiniView hub stats loaded: roster=${freshStats.rosterCreatorCount}',
        tag: 'InfiniViewHubScreen',
      );
    } catch (e) {
      Logger.logError(
        'InfiniView hub stats failed',
        error: e,
        tag: 'InfiniViewHubScreen',
      );
      if (mounted) {
        setState(() {
          _infiniViewHubIsLoading = false;
        });
      }
    }
  }

  // MARK: - Build
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.infiniViewTab),
        actions: [
          if (widget.settingsAction != null) widget.settingsAction!,
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _infiniViewHubLoadStats,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            _infiniViewHubBuildHero(context, l10n),
            const SizedBox(height: 20),
            _infiniViewHubBuildDownloads(context, l10n),
            const SizedBox(height: 28),
            if (_infiniViewHubIsLoading && _infiniViewHubStats == null)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_infiniViewHubStats != null) ...[
              _infiniViewHubBuildMonthBoard(context, l10n, _infiniViewHubStats!),
              const SizedBox(height: 16),
              _infiniViewHubBuildLifetimeBoard(
                context,
                l10n,
                _infiniViewHubStats!,
              ),
            ],
            const BannerAdContainer(
              margin: EdgeInsets.symmetric(vertical: 24),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: - Hero
  Widget _infiniViewHubBuildHero(BuildContext context, AppLocalizations l10n) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? const [
                  Color(0xFF2A1F6E),
                  Color(0xFF5B4BC4),
                  Color(0xFF007C78),
                ]
              : const [
                  Color(0xFF5B4BC4),
                  Color(0xFF6E5AE0),
                  Color(0xFF007C78),
                ],
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.35),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.infiniViewTab.toUpperCase(),
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
              letterSpacing: 2.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.infiniViewWhatItIs,
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.infiniViewWhatItIsBody,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.92),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            l10n.infiniViewOnboardingNote,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.88),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Downloads
  Widget _infiniViewHubBuildDownloads(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final bool showIosDownload = _infiniViewHubIsIos || kIsWeb;
    final bool showAndroidDownload = _infiniViewHubIsAndroid || kIsWeb;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showIosDownload)
          InfiniViewHubPrimaryCta(
            title: l10n.downloadInfiniViewIos,
            subtitle: l10n.downloadInfiniViewIosSubtitle,
            icon: Icons.apple,
            url: AppConfig.infiniviewAppStoreUrl,
          ),
        if (showIosDownload && showAndroidDownload) const SizedBox(height: 12),
        if (showAndroidDownload)
          InfiniViewHubPrimaryCta(
            title: l10n.downloadInfiniViewAndroid,
            subtitle: l10n.downloadInfiniViewAndroidSubtitle,
            icon: Icons.android,
            url: AppConfig.infiniviewPlayStoreUrl,
            isSecondary: showIosDownload,
          ),
        const SizedBox(height: 12),
        CreatorNetworkHubLinkCard(
          title: l10n.openInfiniViewWeb,
          subtitle: l10n.openInfiniViewWebSubtitle,
          icon: Icons.language,
          url: AppConfig.viewAppUrl,
        ),
      ],
    );
  }

  // MARK: - Month board
  Widget _infiniViewHubBuildMonthBoard(
    BuildContext context,
    AppLocalizations l10n,
    CreatorNetworkPublicStatsModel stats,
  ) {
    final String monthTitle = stats.monthLabel.isNotEmpty
        ? l10n.networkStatsMonthSubtitle(stats.monthLabel)
        : l10n.thisMonthStatsTitle;

    return InfiniViewHubScoreboard(
      title: l10n.thisMonthStatsTitle,
      subtitle: monthTitle,
      accent: const Color(0xFF007C78),
      metrics: [
        InfiniViewHubMetric(
          label: l10n.diamonds,
          value: stats.formattedMonthDiamonds,
        ),
        InfiniViewHubMetric(
          label: l10n.estimatedEarningsUsd,
          value: stats.formattedMonthEarnings,
        ),
        InfiniViewHubMetric(
          label: l10n.liveHours,
          value: stats.formattedMonthLiveHours,
        ),
        InfiniViewHubMetric(
          label: l10n.validDays,
          value: stats.formattedMonthValidDays,
        ),
        InfiniViewHubMetric(
          label: l10n.thisMonthCreators,
          value: creatorNetworkPublicStatsFormatCount(stats.month.creators),
        ),
        InfiniViewHubMetric(
          label: l10n.followersGainedThisMonth,
          value: stats.formattedMonthFollowersGained,
        ),
        InfiniViewHubMetric(
          label: l10n.videosThisMonth,
          value: stats.formattedMonthVideos,
        ),
        InfiniViewHubMetric(
          label: l10n.likesThisMonth,
          value: stats.formattedMonthLikes,
        ),
      ],
    );
  }

  // MARK: - Lifetime board
  Widget _infiniViewHubBuildLifetimeBoard(
    BuildContext context,
    AppLocalizations l10n,
    CreatorNetworkPublicStatsModel stats,
  ) {
    return InfiniViewHubScoreboard(
      title: l10n.lifetimeStatsTitle,
      subtitle: l10n.networkStatsLiveSubtitle,
      accent: const Color(0xFF5B4BC4),
      metrics: [
        InfiniViewHubMetric(
          label: l10n.rosterCreators,
          value: stats.formattedRosterCreatorCount,
        ),
        InfiniViewHubMetric(
          label: l10n.diamonds,
          value: stats.formattedTotalDiamonds,
        ),
        InfiniViewHubMetric(
          label: l10n.estimatedEarningsUsd,
          value: stats.formattedTotalEarnings,
        ),
        InfiniViewHubMetric(
          label: l10n.totalFollowers,
          value: stats.formattedTotalFollowers,
        ),
        InfiniViewHubMetric(
          label: l10n.videosPosted,
          value: stats.formattedTotalVideos,
        ),
        InfiniViewHubMetric(
          label: l10n.validDays,
          value: stats.formattedTotalValidDays,
        ),
      ],
    );
  }
}

// MARK: - Primary store CTA
class InfiniViewHubPrimaryCta extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String url;
  final bool isSecondary;

  const InfiniViewHubPrimaryCta({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.url,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color background = isSecondary
        ? theme.colorScheme.surface
        : theme.colorScheme.primary;
    final Color foreground =
        isSecondary ? theme.colorScheme.primary : Colors.white;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => creatorNetworkHubOpenLink(
          context: context,
          title: title,
          url: url,
        ),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.35),
            ),
            boxShadow: isSecondary
                ? null
                : [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.28),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
          ),
          child: Row(
            children: [
              Icon(icon, color: foreground, size: 28),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: foreground,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: foreground.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_rounded, color: foreground),
            ],
          ),
        ),
      ),
    );
  }
}

// MARK: - Scoreboard
class InfiniViewHubScoreboard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color accent;
  final List<InfiniViewHubMetric> metrics;

  const InfiniViewHubScoreboard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GlassCardWidget(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: metrics.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.55,
            ),
            itemBuilder: (BuildContext context, int index) {
              final InfiniViewHubMetric metric = metrics[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      metric.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: accent,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      metric.label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// MARK: - Metric
class InfiniViewHubMetric {
  final String label;
  final String value;

  const InfiniViewHubMetric({
    required this.label,
    required this.value,
  });
}

// Suggestions For Features and Additions Later:
// - Deep-link InfiniView straight into Finish setup when a public onboarding URL exists
// - Hide web CTA on iOS once App Store conversion is verified as the only needed path
