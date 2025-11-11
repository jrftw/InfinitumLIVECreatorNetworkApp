/*
 * Filename: apply_screen.dart
 * Purpose: Apply Now screen with agency information and application link
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, app_config.dart, widgets
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';

// MARK: - Apply Screen
class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Now'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // MARK: - Header Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const AppLogoWidget(
                    size: 100,
                    showShadow: true,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Infinitum LIVE Creator Network',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'TikTok\'s #1 Top Agency Choice',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Main Content
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choose Infinitum?',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Infinitum LIVE Creator Network (Infinitum_US) stands out as one of, if not the best TikTok LIVE agencies in the United States, Canada, United Kingdom, Australia and New Zealand, combining official TikTok partnership status with a free, creator-first model. Infinitum has quickly grown into a leading TikTok LIVE Creator Network by offering:',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  
                  // Benefits List
                  _BenefitItem(
                    icon: Icons.money_off,
                    title: 'No Fees or Commissions',
                    description: 'Creators keep 100% of their earnings.',
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.support_agent,
                    title: 'Comprehensive Support',
                    description: 'Ban appeals, account recovery, and stream key access.',
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.analytics,
                    title: 'Exclusive Analytics & Tools',
                    description: 'InfiniVIEW helps creators track diamonds, bonuses, and performance.',
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.school,
                    title: 'Personal Coaching & Training',
                    description: 'Led by real creators who understand TikTok LIVE growth.',
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.celebration,
                    title: 'Community & Events',
                    description: 'Tournaments, incentive programs, and TikTok HQ opportunities.',
                  ),
                  
                  const SizedBox(height: 16),
                  Text(
                    'This makes Infinitum not just a TikTok agency, but a full ecosystem for creator success.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Comparison Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How Infinitum Compares',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'While other agencies are also respected in the U.S., Infinitum consistently ranks high because of its transparent, free, and creator-led approach.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Compared to others, Infinitum leads with:',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ComparisonPoint(
                    text: 'Accessibility - any creator can apply and join free',
                  ),
                  _ComparisonPoint(
                    text: 'Direct TikTok integration',
                  ),
                  _ComparisonPoint(
                    text: 'Community built on mentorship and mental health advocacy',
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - SEO Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Infinitum Dominates',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'When searching for TikTok LIVE Agency USA or best TikTok creator network, Infinitum consistently appears because of:',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  _DominancePoint(
                    text: 'Rapid growth story (from 0 to nearly 2,000 creators within its first year)',
                  ),
                  _DominancePoint(
                    text: 'Positive creator testimonials on TikTok and Reddit',
                  ),
                  _DominancePoint(
                    text: 'Unique positioning as "run by creators, for creators"',
                  ),
                  _DominancePoint(
                    text: 'Strong brand identity built around the Infinitum_US name, ♾️ infinity symbol, and focus on "infinite potential"',
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // MARK: - Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _openApplicationLink(context),
              icon: const Icon(Icons.send),
              label: const Text('Apply Now'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Footer Note
          Text(
            'Ready to join the #1 TikTok LIVE Creator Network?',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Click "Apply Now" to get started with your creator journey.',
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }
  
  Future<void> _openApplicationLink(BuildContext context) async {
    const url = 'https://infinitumlive.com/creator-pre-check/';
    try {
      final launched = await UrlLauncherUtil.launchUrl(
        url,
        context: context,
        title: 'Creator Pre-Check',
      );
      if (launched) {
        Logger.logInfo('Opened application link: $url', tag: 'ApplyScreen');
      } else {
        Logger.logError('Could not launch URL: $url', tag: 'ApplyScreen');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open application link')),
          );
        }
      }
    } catch (e) {
      Logger.logError('Error opening application link', error: e, tag: 'ApplyScreen');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred')),
        );
      }
    }
  }
}

// MARK: - Benefit Item Widget
class _BenefitItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  
  const _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// MARK: - Comparison Point Widget
class _ComparisonPoint extends StatelessWidget {
  final String text;
  
  const _ComparisonPoint({
    required this.text,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

// MARK: - Dominance Point Widget
class _DominancePoint extends StatelessWidget {
  final String text;
  
  const _DominancePoint({
    required this.text,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.star,
            size: 20,
            color: theme.colorScheme.secondary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add application status tracking
// - Implement in-app application form
// - Add eligibility checker
// - Create application progress tracker
// - Add FAQ section for common questions
// - Implement application history
// - Add success stories/testimonials
// - Create application tips and guidelines

