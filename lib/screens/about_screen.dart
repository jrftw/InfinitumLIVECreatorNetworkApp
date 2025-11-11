/*
 * Filename: about_screen.dart
 * Purpose: Screen displaying company information and details
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, app_config.dart, url_launcher
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/core/version_manager.dart';
import 'package:infinitum_live_creator_network/services/theme_preferences_service.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';

// MARK: - About Screen
class AboutScreen extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  
  const AboutScreen({super.key, this.onThemeModeChanged});
  
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentThemeMode = ThemePreferencesService.themeMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        actions: [
          // Theme mode switcher
          PopupMenuButton<ThemeMode>(
            icon: Icon(
              currentThemeMode == ThemeMode.light
                  ? Icons.light_mode
                  : currentThemeMode == ThemeMode.dark
                      ? Icons.dark_mode
                      : Icons.brightness_auto,
            ),
            tooltip: 'Theme Mode',
            onSelected: (ThemeMode mode) {
              widget.onThemeModeChanged?.call(mode);
              setState(() {});
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
              PopupMenuItem<ThemeMode>(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    const Icon(Icons.light_mode, size: 20),
                    const SizedBox(width: 12),
                    const Text('Light'),
                    if (currentThemeMode == ThemeMode.light)
                      const Spacer(),
                    if (currentThemeMode == ThemeMode.light)
                      const Icon(Icons.check, size: 20),
                  ],
                ),
              ),
              PopupMenuItem<ThemeMode>(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    const Icon(Icons.dark_mode, size: 20),
                    const SizedBox(width: 12),
                    const Text('Dark'),
                    if (currentThemeMode == ThemeMode.dark)
                      const Spacer(),
                    if (currentThemeMode == ThemeMode.dark)
                      const Icon(Icons.check, size: 20),
                  ],
                ),
              ),
              PopupMenuItem<ThemeMode>(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    const Icon(Icons.brightness_auto, size: 20),
                    const SizedBox(width: 12),
                    const Text('Auto'),
                    if (currentThemeMode == ThemeMode.system)
                      const Spacer(),
                    if (currentThemeMode == ThemeMode.system)
                      const Icon(Icons.check, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // MARK: - Company Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const AppLogoWidget(
                    size: 120,
                    showShadow: true,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppConfig.companyDBA,
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppConfig.companyName,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - About Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Infinitum',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your Premier Destination for LIVE Talent',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'At Infinitum Imagery LLC we were officially founded on March 15, 2023 by ${AppConfig.founderHandle}, inspired by our founder\'s sincere commitment to uplift creators after witnessing the limited support offered by a previous agency from May 2022 to March 2023.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Since our earliest beginnings in 2023, we have proudly built a strong reputation for identifying and nurturing top-tier talent, forging meaningful connections with essential industry partners. Our mission is to empower every aspiring star by equipping them with robust tools, targeted resources, and caring, personalized guidance—ensuring that each individual is fully supported in reaching their highest potential.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'We partner with leading platforms such as ${AppConfig.platformPartners.join(', ')}, continually expanding our network to maximize opportunities for our creators.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Proudly founded, operated, and thriving in the heart of the United States! Based in ${AppConfig.location}.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Service Regions
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service Regions',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  ...AppConfig.serviceRegions.map((region) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(region, style: theme.textTheme.bodyMedium),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Contact Information
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _ContactItem(
                    icon: Icons.email,
                    label: 'Support Email',
                    value: AppConfig.supportEmail,
                    onTap: () => _launchEmail(context, AppConfig.supportEmail),
                  ),
                  const Divider(),
                  _ContactItem(
                    icon: Icons.account_circle,
                    label: 'Official Account',
                    value: AppConfig.officialAccount,
                  ),
                  const Divider(),
                  _ContactItem(
                    icon: Icons.access_time,
                    label: 'Business Hours',
                    value: AppConfig.businessHours,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Quick Links
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Links',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _LinkItem(
                    icon: Icons.language,
                    label: 'Website',
                    url: AppConfig.websiteUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.person_add,
                    label: 'Onboarding',
                    url: AppConfig.onboardingUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.dashboard,
                    label: 'Creator Dashboard',
                    url: AppConfig.viewAppUrl,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Legal & Privacy
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Legal & Privacy',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _LinkItem(
                    icon: Icons.privacy_tip,
                    label: 'Privacy Policy',
                    url: AppConfig.privacyPolicyUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.description,
                    label: 'Terms of Service',
                    url: AppConfig.termsOfServiceUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.cookie,
                    label: 'Cookie Policy',
                    url: AppConfig.cookiePolicyUrl,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Third-Party Acknowledgments
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Third-Party Acknowledgments',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'TikTok Partnership',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Infinitum LIVE Creator Network is an official third-party partner with TikTok. Infinitum Imagery LLC has been granted permission by TikTok to use the TikTok name and branding in its applications and products. This partnership is established to better serve and train creators within the TikTok creator ecosystem.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'TikTok is a trademark of TikTok Inc. and/or its affiliates. The use of the TikTok name and branding in this application is done with explicit permission as an official third-party partner.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - App Information
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App Information',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _InfoRow(
                    label: 'Version',
                    value: VersionManager.getDisplayVersion(),
                  ),
                  const Divider(),
                  _InfoRow(
                    label: 'Theme Mode',
                    value: ThemePreferencesService.getThemeModeLabel(currentThemeMode),
                  ),
                  const Divider(),
                  _InfoRow(
                    label: 'Company',
                    value: AppConfig.companyName,
                  ),
                  const Divider(),
                  _InfoRow(
                    label: 'Founded',
                    value: AppConfig.foundedDate,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // MARK: - Footer
          Center(
            child: Text(
              '© ${DateTime.now().year} ${AppConfig.companyName}',
              style: theme.textTheme.bodySmall,
            ),
          ),
          
          const SizedBox(height: 16),
        ],
      ),
    );
  }
  
  void _launchEmail(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contact Email'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email address:'),
            const SizedBox(height: 8),
            SelectableText(
              email,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Please use your email client to contact us.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
    Logger.logInfo('Showed email info: $email', tag: 'AboutScreen');
  }
}

// MARK: - Contact Item Widget
class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: onTap != null
                          ? theme.colorScheme.primary
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
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

// MARK: - Link Item Widget
class _LinkItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  
  const _LinkItem({
    required this.icon,
    required this.label,
    required this.url,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: () => _openLink(context, url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
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
  
  void _openLink(BuildContext context, String url) {
    Logger.logInfo('Opening link: $url', tag: 'AboutScreen');
    UrlLauncherUtil.launchUrl(
      url,
      context: context,
      title: label,
    );
  }
}

// MARK: - Info Row Widget
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  
  const _InfoRow({
    required this.label,
    required this.value,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add team member profiles
// - Implement company timeline/history
// - Add testimonials section
// - Create FAQ section
// - Add social media links
// - Implement newsletter signup
// - Add press kit and media resources
// - Create accessibility information

