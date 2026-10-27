/*
 * Filename: home_screen.dart
 * Purpose: Hub shell with Home, Join, Network, InfiniView, and About tabs
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, hub screens, about_screen, widgets
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/announcement_model.dart';
import 'package:infinitum_live_creator_network/models/creator_stats_model.dart';
import 'package:infinitum_live_creator_network/screens/about_screen.dart';
import 'package:infinitum_live_creator_network/screens/infiniview_hub_screen.dart';
import 'package:infinitum_live_creator_network/screens/join_hub_screen.dart';
import 'package:infinitum_live_creator_network/screens/network_hub_screen.dart';
import 'package:infinitum_live_creator_network/services/api_service.dart';
import 'package:infinitum_live_creator_network/services/preload_service.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';
import 'package:infinitum_live_creator_network/widgets/banner_ad_widget.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_adaptive_shell.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_announcement_card.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_hub_link_card.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_settings_cog_button.dart';
import 'package:infinitum_live_creator_network/widgets/stat_card_widget.dart';

// MARK: - Home Screen Shell
class HomeScreen extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final ValueChanged<Locale?>? onLocaleChanged;

  const HomeScreen({
    super.key,
    this.onThemeModeChanged,
    this.onLocaleChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const int creatorNetworkHubJoinTabIndex = 1;
  static const int creatorNetworkHubNetworkTabIndex = 2;
  static const int creatorNetworkHubInfiniViewTabIndex = 3;

  Widget get _creatorNetworkHubSettingsCog => CreatorNetworkSettingsCogButton(
        onThemeModeChanged: widget.onThemeModeChanged,
        onLocaleChanged: widget.onLocaleChanged,
      );

  // MARK: - Navigation Pages
  List<Widget> get _pages => [
        _CreatorNetworkHubHomePage(
          onSelectTab: _creatorNetworkHubSelectTab,
          settingsAction: _creatorNetworkHubSettingsCog,
        ),
        JoinHubScreen(
          settingsAction: _creatorNetworkHubSettingsCog,
          onOpenInfiniView: () => _creatorNetworkHubSelectTab(
            creatorNetworkHubInfiniViewTabIndex,
          ),
        ),
        NetworkHubScreen(
          settingsAction: _creatorNetworkHubSettingsCog,
        ),
        InfiniViewHubScreen(
          settingsAction: _creatorNetworkHubSettingsCog,
        ),
        AboutScreen(
          onThemeModeChanged: widget.onThemeModeChanged,
          onLocaleChanged: widget.onLocaleChanged,
          showBackButton: false,
          settingsAction: _creatorNetworkHubSettingsCog,
          onOpenInfiniView: () => _creatorNetworkHubSelectTab(
            creatorNetworkHubInfiniViewTabIndex,
          ),
        ),
      ];

  void _creatorNetworkHubSelectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Logger.logInfo('Navigated to hub index: $index', tag: 'HomeScreen');
  }

  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return CreatorNetworkAdaptiveShell(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _creatorNetworkHubSelectTab,
      pages: _pages,
      destinations: [
        CreatorNetworkAdaptiveDestination(
          label: l10n.home,
          materialIcon: Icons.home_outlined,
          materialSelectedIcon: Icons.home,
          cupertinoIcon: CupertinoIcons.house_fill,
        ),
        CreatorNetworkAdaptiveDestination(
          label: l10n.joinTab,
          materialIcon: Icons.person_add_outlined,
          materialSelectedIcon: Icons.person_add,
          cupertinoIcon: CupertinoIcons.person_add,
        ),
        CreatorNetworkAdaptiveDestination(
          label: l10n.networkTab,
          materialIcon: Icons.hub_outlined,
          materialSelectedIcon: Icons.hub,
          cupertinoIcon: CupertinoIcons.graph_circle,
        ),
        CreatorNetworkAdaptiveDestination(
          label: l10n.infiniViewTab,
          materialIcon: Icons.dashboard_outlined,
          materialSelectedIcon: Icons.dashboard,
          cupertinoIcon: CupertinoIcons.square_grid_2x2_fill,
        ),
        CreatorNetworkAdaptiveDestination(
          label: l10n.about,
          materialIcon: Icons.info_outline,
          materialSelectedIcon: Icons.info,
          cupertinoIcon: CupertinoIcons.info_circle_fill,
        ),
      ],
    );
  }
}

// MARK: - Home Page Content
class _CreatorNetworkHubHomePage extends StatefulWidget {
  final ValueChanged<int> onSelectTab;
  final Widget settingsAction;

  const _CreatorNetworkHubHomePage({
    required this.onSelectTab,
    required this.settingsAction,
  });

  @override
  State<_CreatorNetworkHubHomePage> createState() =>
      _CreatorNetworkHubHomePageState();
}

class _CreatorNetworkHubHomePageState extends State<_CreatorNetworkHubHomePage> {
  final ApiService _homeApiService = ApiService();
  CreatorNetworkPublicStatsModel? _homeStats;
  AnnouncementModel? _homeLatestAnnouncement;

  @override
  void initState() {
    super.initState();
    _creatorNetworkHubHomeLoadSnapshot();
  }

  Future<void> _creatorNetworkHubHomeLoadSnapshot() async {
    final CreatorNetworkPublicStatsModel? cachedStats =
        PreloadService().getCachedStats();
    final AnnouncementsResponseModel? cachedAnnouncements =
        PreloadService().getCachedAnnouncements();

    if (mounted) {
      setState(() {
        _homeStats = cachedStats;
        if (cachedAnnouncements != null &&
            cachedAnnouncements.announcements.isNotEmpty) {
          _homeLatestAnnouncement = cachedAnnouncements.announcements.first;
        }
      });
    }

    try {
      final CreatorNetworkPublicStatsModel stats =
          await _homeApiService.fetchCreatorStats();
      if (mounted) {
        setState(() {
          _homeStats = stats;
        });
      }
    } catch (e) {
      Logger.logError(
        'Home snapshot stats failed',
        error: e,
        tag: 'HomeScreen',
      );
    }

    try {
      final AnnouncementsResponseModel announcements =
          await _homeApiService.fetchAnnouncements();
      if (mounted && announcements.announcements.isNotEmpty) {
        setState(() {
          _homeLatestAnnouncement = announcements.announcements.first;
        });
      }
    } catch (e) {
      Logger.logError(
        'Home snapshot announcements failed',
        error: e,
        tag: 'HomeScreen',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return CustomScrollView(
      physics: PlatformUtil.creatorNetworkScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 220,
          floating: false,
          pinned: true,
          automaticallyImplyLeading: false,
          actions: [
            widget.settingsAction,
          ],
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double collapsePercentage =
                  (1.0 - (constraints.maxHeight / 220)).clamp(0.0, 1.0);
              final bool isCollapsed = collapsePercentage > 0.5;

              return FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  bottom: isCollapsed ? 16 : 0,
                  left: 16,
                  right: 16,
                ),
                title: isCollapsed
                    ? Text(
                        AppConfig.appName,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: -0.3,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink(),
                centerTitle: true,
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isDark
                          ? const [
                              Color(0xFF1A1440),
                              Color(0xFF5B4BC4),
                              Color(0xFF007C78),
                            ]
                          : const [
                              Color(0xFF5B4BC4),
                              Color(0xFF6E5AE0),
                              Color(0xFF007C78),
                            ],
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      AppLogoWidget(
                        size: 120,
                        showShadow: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Text(
                l10n.hubTagline,
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.hubPurpose,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CreatorNetworkHubLinkCard(
                title: l10n.joinTheNetwork,
                subtitle: l10n.joinTheNetworkSubtitle,
                icon: Icons.person_add,
                onTap: () => widget.onSelectTab(
                  _HomeScreenState.creatorNetworkHubJoinTabIndex,
                ),
              ),
              const SizedBox(height: 12),
              CreatorNetworkHubLinkCard(
                title: l10n.alreadyOnTheNetwork,
                subtitle: l10n.alreadyOnTheNetworkSubtitle,
                icon: Icons.hub,
                onTap: () => widget.onSelectTab(
                  _HomeScreenState.creatorNetworkHubNetworkTabIndex,
                ),
              ),
              const SizedBox(height: 12),
              CreatorNetworkHubLinkCard(
                title: l10n.getInfiniView,
                subtitle: l10n.getInfiniViewSubtitle,
                icon: Icons.dashboard,
                onTap: () => widget.onSelectTab(
                  _HomeScreenState.creatorNetworkHubInfiniViewTabIndex,
                ),
              ),
              if (_homeStats != null) ...[
                const SizedBox(height: 32),
                Text(
                  l10n.networkSnapshot,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                if (_homeStats!.monthLabel.isNotEmpty)
                  Text(
                    l10n.networkStatsMonthSubtitle(_homeStats!.monthLabel),
                    style: theme.textTheme.bodyMedium,
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: StatCardWidget(
                        title: l10n.rosterCreators,
                        value: _homeStats!.formattedRosterCreatorCount,
                        icon: Icons.people,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StatCardWidget(
                        title: l10n.diamonds,
                        value: _homeStats!.formattedMonthDiamonds,
                        icon: Icons.diamond,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CreatorNetworkHubLinkCard(
                  title: l10n.seeFullNetworkStats,
                  subtitle: l10n.seeFullNetworkStatsSubtitle,
                  icon: Icons.analytics,
                  onTap: () => widget.onSelectTab(
                    _HomeScreenState.creatorNetworkHubNetworkTabIndex,
                  ),
                ),
              ],
              if (_homeLatestAnnouncement != null) ...[
                const SizedBox(height: 32),
                Text(
                  l10n.latestAnnouncement,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                CreatorNetworkAnnouncementCard(
                  announcement: _homeLatestAnnouncement!,
                  contentMaxLines: 3,
                  onTapOverride: () => widget.onSelectTab(
                    _HomeScreenState.creatorNetworkHubNetworkTabIndex,
                  ),
                ),
              ],
              const BannerAdContainer(
                margin: EdgeInsets.symmetric(vertical: 24),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

// Suggestions For Features and Additions Later:
// - Deep-link Home destination cards from infinitumlive://join and similar
// - Pin a seasonal InfiniView campaign card without adding login
