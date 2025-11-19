/*
 * Filename: home_screen.dart
 * Purpose: Main home screen with navigation and overview
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-11-12
 * Dependencies: flutter/material.dart, widgets, other screens
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/screens/about_screen.dart';
import 'package:infinitum_live_creator_network/screens/announcements_screen.dart';
import 'package:infinitum_live_creator_network/screens/statistics_screen.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';
import 'package:infinitum_live_creator_network/widgets/banner_ad_widget.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:infinitum_live_creator_network/l10n/app_localizations.dart';

// MARK: - Home Screen
class HomeScreen extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final ValueChanged<Locale?>? onLocaleChanged;
  
  const HomeScreen({super.key, this.onThemeModeChanged, this.onLocaleChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  // MARK: - Navigation Pages
  List<Widget> get _pages => [
    const _HomePage(),
    const StatisticsScreen(),
    const AnnouncementsScreen(),
    AboutScreen(
      onThemeModeChanged: widget.onThemeModeChanged,
      onLocaleChanged: widget.onLocaleChanged,
    ),
  ];
  
  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    // Get safe area padding for iOS home indicator optimization (iPhone X and later)
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;
    
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        // SafeArea automatically handles home indicator spacing on iOS
        // Only apply minimum bottom padding to ensure proper spacing
        minimum: EdgeInsets.only(
          bottom: bottomPadding > 0 ? 0 : 8, // Use safe area if available, otherwise small margin
        ),
        child: GlassContainerWidget(
          // Optimized margin for iOS 16+ liquid glass design
          // Horizontal margin creates floating effect, bottom margin works with SafeArea
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: bottomPadding > 0 ? 8 : 16, // Smaller bottom margin when safe area exists
            top: 0,
          ),
          borderRadius: BorderRadius.circular(28),
          blurIntensity: 25.0,
          opacity: 0.25,
          child: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
              Logger.logInfo('Navigated to index: $index', tag: 'HomeScreen');
            },
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.home,
              ),
              NavigationDestination(
                icon: const Icon(Icons.analytics_outlined),
                selectedIcon: const Icon(Icons.analytics),
                label: AppLocalizations.of(context)!.statistics,
              ),
              NavigationDestination(
                icon: const Icon(Icons.notifications_outlined),
                selectedIcon: const Icon(Icons.notifications),
                label: AppLocalizations.of(context)!.announcements,
              ),
              NavigationDestination(
                icon: const Icon(Icons.info_outline),
                selectedIcon: const Icon(Icons.info),
                label: AppLocalizations.of(context)!.about,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MARK: - Home Page Content
class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // MARK: - App Bar with Liquid Glass
        SliverAppBar(
          expandedHeight: 220,
          floating: false,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Calculate collapse percentage (0.0 = fully expanded, 1.0 = fully collapsed)
              final collapsePercentage = (1.0 - (constraints.maxHeight / 220)).clamp(0.0, 1.0);
              final isCollapsed = collapsePercentage > 0.5;
              
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
                          fontSize: 20,
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
                          ? [
                              theme.colorScheme.primary.withOpacity(0.2),
                              theme.colorScheme.secondary.withOpacity(0.15),
                            ]
                          : [
                              theme.colorScheme.primary.withOpacity(0.1),
                              theme.colorScheme.secondary.withOpacity(0.08),
                            ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40), // Space for status bar
                      const AppLogoWidget(
                        size: 140,
                        showShadow: true,
                      ),
                      const SizedBox(height: 16), // Space between logo and text
                      // Title text positioned below logo (only when expanded)
                      if (!isCollapsed)
                        Text(
                          AppConfig.appName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            letterSpacing: -0.3,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        
        // MARK: - Content
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Tools & Services
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  AppLocalizations.of(context)!.toolsAndServices,
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.merch,
                subtitle: AppLocalizations.of(context)!.merchSubtitle,
                icon: Icons.shopping_bag,
                url: AppConfig.merchUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.estimateEarnings,
                subtitle: AppLocalizations.of(context)!.estimateEarningsSubtitle,
                icon: Icons.calculate,
                url: AppConfig.estimateEarningsUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.shadowBanChecker,
                subtitle: AppLocalizations.of(context)!.shadowBanCheckerSubtitle,
                icon: Icons.visibility_off,
                url: AppConfig.shadowBanCheckerUrl,
              ),
              
              const SizedBox(height: 32),
              
              // Quick Links
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  AppLocalizations.of(context)!.quickLinks,
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.viewDashboard,
                subtitle: AppLocalizations.of(context)!.viewDashboardSubtitle,
                icon: Icons.dashboard,
                url: PlatformUtil.isIOS 
                    ? AppConfig.infiniviewAppStoreUrl 
                    : AppConfig.viewAppUrl,
                useExternalBrowser: PlatformUtil.isIOS, // Open App Store in external browser on iOS
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.onboarding,
                subtitle: AppLocalizations.of(context)!.onboardingSubtitle,
                icon: Icons.person_add,
                url: AppConfig.onboardingUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.website,
                subtitle: AppLocalizations.of(context)!.websiteSubtitle,
                icon: Icons.language,
                url: AppConfig.websiteUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.howToApply,
                subtitle: AppLocalizations.of(context)!.howToApplySubtitle,
                icon: Icons.how_to_reg,
                url: AppConfig.howToApplyUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.applyTikTokLive,
                subtitle: AppLocalizations.of(context)!.applyTikTokLiveSubtitle,
                icon: Icons.video_library,
                url: AppConfig.creatorPreCheckUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.applyTikTokShop,
                subtitle: AppLocalizations.of(context)!.applyTikTokShopSubtitle,
                icon: Icons.store,
                url: AppConfig.tiktokShopUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: AppLocalizations.of(context)!.applyFavoritedLive,
                subtitle: AppLocalizations.of(context)!.applyFavoritedLiveSubtitle,
                icon: Icons.favorite,
                url: AppConfig.favoritedLiveApplyUrl,
              ),
              
              const SizedBox(height: 32),
              
              // MARK: - Banner Ad
              const BannerAdContainer(
                margin: EdgeInsets.symmetric(vertical: 16),
              ),
              
              const SizedBox(height: 16),
            ]),
          ),
        ),
      ],
    );
  }
}

// MARK: - Quick Link Card Widget
class _QuickLinkCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String url;
  final bool useExternalBrowser;
  
  const _QuickLinkCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.url,
    this.useExternalBrowser = false,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return RepaintBoundary(
      child: GlassCardWidget(
        onTap: () async {
          Logger.logInfo('Opening URL: $url', tag: 'HomeScreen');
          
          // If useExternalBrowser is true, open in external browser (for App Store links)
          if (useExternalBrowser) {
            try {
              final uri = Uri.parse(url);
              if (await url_launcher.canLaunchUrl(uri)) {
                final launched = await url_launcher.launchUrl(
                  uri,
                  mode: url_launcher.LaunchMode.externalApplication,
                );
                if (!launched && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context)!.couldNotOpen(title)),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context)!.cannotOpen(title)),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              }
            } catch (e) {
              Logger.logError('Error opening URL in external browser: $url', error: e, tag: 'HomeScreen');
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppLocalizations.of(context)!.errorOpening(title)),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            }
          } else {
            // Use normal URL launcher (opens in webview on mobile)
            final launched = await UrlLauncherUtil.launchUrl(
              url,
              context: context,
              title: title,
            );
            if (!launched && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.couldNotOpen(title)),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          }
        },
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.2),
                    theme.colorScheme.primary.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add personalized welcome message based on user preferences
// - Implement quick action buttons for common tasks
// - Add recent activity feed
// - Create customizable home screen widgets
// - Add search functionality
// - Implement pull-to-refresh for stats
// - Add notification badges for new announcements
// - Create shortcut actions for power users

