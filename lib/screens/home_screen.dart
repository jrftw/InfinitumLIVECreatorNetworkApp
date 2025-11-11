/*
 * Filename: home_screen.dart
 * Purpose: Main home screen with navigation and overview
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, widgets, other screens
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/screens/about_screen.dart';
import 'package:infinitum_live_creator_network/screens/announcements_screen.dart';
import 'package:infinitum_live_creator_network/screens/statistics_screen.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - Home Screen
class HomeScreen extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  
  const HomeScreen({super.key, this.onThemeModeChanged});

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
    AboutScreen(onThemeModeChanged: widget.onThemeModeChanged),
  ];
  
  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: GlassContainerWidget(
        margin: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(30),
        blurIntensity: 20.0,
        opacity: 0.3,
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
            Logger.logInfo('Navigated to index: $index', tag: 'HomeScreen');
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.analytics_outlined),
              selectedIcon: Icon(Icons.analytics),
              label: 'Statistics',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Announcements',
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              selectedIcon: Icon(Icons.info),
              label: 'About',
            ),
          ],
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
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              AppConfig.appName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: -0.3,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            centerTitle: true,
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                          theme.colorScheme.primary.withOpacity(0.3),
                          theme.colorScheme.secondary.withOpacity(0.2),
                        ]
                      : [
                          theme.colorScheme.primary.withOpacity(0.15),
                          theme.colorScheme.secondary.withOpacity(0.1),
                        ],
                ),
              ),
              child: const Center(
                child: AppLogoWidget(
                  size: 120,
                  showShadow: true,
                ),
              ),
            ),
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
                  'Tools & Services',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              _QuickLinkCard(
                title: 'Merch',
                subtitle: 'Shop Infinitum LIVE apparel',
                icon: Icons.shopping_bag,
                url: AppConfig.merchUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: 'Estimate Earnings',
                subtitle: 'Calculate your potential earnings',
                icon: Icons.calculate,
                url: AppConfig.estimateEarningsUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: 'Shadow Ban Checker',
                subtitle: 'Check if your account is shadow banned',
                icon: Icons.visibility_off,
                url: AppConfig.shadowBanCheckerUrl,
              ),
              
              const SizedBox(height: 32),
              
              // Quick Links
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Quick Links',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              _QuickLinkCard(
                title: 'View Dashboard',
                subtitle: 'Access your creator dashboard',
                icon: Icons.dashboard,
                url: AppConfig.viewAppUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: 'Onboarding',
                subtitle: 'Join the network',
                icon: Icons.person_add,
                url: AppConfig.onboardingUrl,
              ),
              const SizedBox(height: 12),
              _QuickLinkCard(
                title: 'Website',
                subtitle: 'Visit infinitumlive.com',
                icon: Icons.language,
                url: AppConfig.websiteUrl,
              ),
              
              const SizedBox(height: 32),
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
  
  const _QuickLinkCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.url,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return RepaintBoundary(
      child: GlassCardWidget(
        onTap: () async {
          Logger.logInfo('Opening URL: $url', tag: 'HomeScreen');
          final launched = await UrlLauncherUtil.launchUrl(
            url,
            context: context,
            title: title,
          );
          if (!launched && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Could not open $title'),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium,
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

