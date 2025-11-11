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
import 'package:infinitum_live_creator_network/screens/apply_screen.dart';
import 'package:infinitum_live_creator_network/screens/statistics_screen.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';

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
      bottomNavigationBar: NavigationBar(
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
    );
  }
}

// MARK: - Home Page Content
class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return CustomScrollView(
      slivers: [
        // MARK: - App Bar
        SliverAppBar(
          expandedHeight: 200,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              AppConfig.appName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
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
              Text(
                'Tools & Services',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
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
              
              const SizedBox(height: 24),
              
              // Quick Links
              Text(
                'Quick Links',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
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
              
              const SizedBox(height: 24),
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
    
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
          child: Icon(icon, color: theme.colorScheme.primary),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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

