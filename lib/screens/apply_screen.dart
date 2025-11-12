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
import 'package:infinitum_live_creator_network/l10n/app_localizations.dart';

// MARK: - Apply Screen
class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.applyNow),
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
                    AppLocalizations.of(context)!.appName,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.tiktokTopAgencyChoice,
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
                    AppLocalizations.of(context)!.whyChooseInfinitum,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.whyChooseInfinitumDescription,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  
                  // Benefits List
                  _BenefitItem(
                    icon: Icons.money_off,
                    title: AppLocalizations.of(context)!.noFeesOrCommissions,
                    description: AppLocalizations.of(context)!.noFeesOrCommissionsDescription,
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.support_agent,
                    title: AppLocalizations.of(context)!.comprehensiveSupport,
                    description: AppLocalizations.of(context)!.comprehensiveSupportDescription,
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.analytics,
                    title: AppLocalizations.of(context)!.exclusiveAnalyticsTools,
                    description: AppLocalizations.of(context)!.exclusiveAnalyticsToolsDescription,
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.school,
                    title: AppLocalizations.of(context)!.personalCoachingTraining,
                    description: AppLocalizations.of(context)!.personalCoachingTrainingDescription,
                  ),
                  const SizedBox(height: 12),
                  _BenefitItem(
                    icon: Icons.celebration,
                    title: AppLocalizations.of(context)!.communityEvents,
                    description: AppLocalizations.of(context)!.communityEventsDescription,
                  ),
                  
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.infinitumEcosystem,
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
                    AppLocalizations.of(context)!.howInfinitumCompares,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.howInfinitumComparesDescription,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.comparedToOthers,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ComparisonPoint(
                    text: AppLocalizations.of(context)!.accessibility,
                  ),
                  _ComparisonPoint(
                    text: AppLocalizations.of(context)!.directTikTokIntegration,
                  ),
                  _ComparisonPoint(
                    text: AppLocalizations.of(context)!.communityMentorship,
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
                    AppLocalizations.of(context)!.whyInfinitumDominates,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.whyInfinitumDominatesDescription,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  _DominancePoint(
                    text: AppLocalizations.of(context)!.rapidGrowth,
                  ),
                  _DominancePoint(
                    text: AppLocalizations.of(context)!.positiveTestimonials,
                  ),
                  _DominancePoint(
                    text: AppLocalizations.of(context)!.uniquePositioning,
                  ),
                  _DominancePoint(
                    text: AppLocalizations.of(context)!.strongBrandIdentity,
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
              label: Text(AppLocalizations.of(context)!.applyNow),
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
            AppLocalizations.of(context)!.readyToJoin,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.clickApplyNow,
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
            SnackBar(content: Text(AppLocalizations.of(context)!.couldNotOpenApplicationLink)),
          );
        }
      }
    } catch (e) {
      Logger.logError('Error opening application link', error: e, tag: 'ApplyScreen');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.anErrorOccurred)),
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

