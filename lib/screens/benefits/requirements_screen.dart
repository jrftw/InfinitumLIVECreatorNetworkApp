/*
 * Filename: requirements_screen.dart
 * Purpose: Public join requirements for Infinitum LIVE, Shop, Favorited, and Bigo programs
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart, app_config.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - Requirements Screen
class RequirementsScreen extends StatelessWidget {
  const RequirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Logger.logInfo(
      'Opened Requirements screen (app ${AppConfig.appVersion} Build 1)',
      tag: 'RequirementsScreen',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.requirements),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          // MARK: - Join Path
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How joining works',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Text(
                  'Apply on infinitumlive.com (or the Join tab). If you are eligible, Infinitum emails next steps. TikTok LIVE applicants submit a TikTok invitation code; TikTok must approve the network invitation. After acceptance, complete InfiniView Finish setup (web or the InfiniView app) to activate membership tools and your manager. This Creator Network hub has no login.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildTikTokLiveRequirements(theme.textTheme),
          const SizedBox(height: 16),
          _buildTikTokShopRequirements(theme.textTheme),
          const SizedBox(height: 16),
          _buildFavoritedRequirements(theme.textTheme),
          const SizedBox(height: 16),
          _buildBigoRequirements(theme.textTheme),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // MARK: - TikTok LIVE Requirements Builder
  Widget _buildTikTokLiveRequirements(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RequirementsProgramHeader(
            icon: Icons.videocam_outlined,
            title: 'TikTok LIVE Creator Network requirements',
            textTheme: textTheme,
          ),
          const SizedBox(height: 20),
          const RequirementsItem(
            label: 'Age:',
            value: '18 years old or older',
          ),
          const RequirementsItem(
            label: 'Location:',
            value:
                'Currently accepting TikTok LIVE applications from the United States, Canada, United Kingdom, Australia, and New Zealand',
          ),
          const RequirementsItem(
            label: 'Interest:',
            value:
                'Willing to treat live streaming as a career (full-time or part-time)',
          ),
          const RequirementsItem(
            label: 'Guideline adherence:',
            value:
                'Familiar with and committed to following TikTok Community Guidelines',
          ),
          const RequirementsItem(
            label: 'Affiliation:',
            value:
                'Not currently signed with another TikTok LIVE agency or manager. Backup accounts are not permitted.',
          ),
          const RequirementsItem(
            label: 'Apply commitment:',
            value:
                'Able to go LIVE at least 8 valid days and 20 valid hours per month. Full Diamond Incentive Program and campaign qualification typically require 12 valid days and 25+ hours as announced in InfiniView.',
          ),
          const RequirementsItem(
            label: 'Account settings:',
            value: 'Public TikTok account (cannot be private)',
          ),
          const RequirementsItem(
            label: 'Profile quality:',
            value: 'Professional, high-quality profile picture',
          ),
          const RequirementsItem(
            label: 'Content:',
            value: 'At least 4 videos posted',
          ),
          const RequirementsItem(
            label: 'Followers:',
            value: 'At least 10 followers',
          ),
          const RequirementsItem(
            label: 'Discord:',
            value:
                'A Discord account is required for Infinitum communication and support',
          ),
          const RequirementsItem(
            label: 'After acceptance:',
            value:
                'Complete InfiniView Finish setup. Stream keys are not automatic. Advertising dual or multi-streaming on TikTok LIVE is not permitted.',
          ),
        ],
      ),
    );
  }

  // MARK: - TikTok Shop Requirements Builder
  Widget _buildTikTokShopRequirements(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RequirementsProgramHeader(
            icon: Icons.storefront_outlined,
            title: 'TikTok Shop agency requirements',
            textTheme: textTheme,
          ),
          const SizedBox(height: 20),
          const RequirementsItem(
            label: 'Location:',
            value: 'United States–based creator',
          ),
          const RequirementsItem(
            label: 'Age:',
            value: '18 years old or older',
          ),
          const RequirementsItem(
            label: 'Interest:',
            value:
                'Willing to learn TikTok Shop affiliate selling as a career',
          ),
          const RequirementsItem(
            label: 'Guideline adherence:',
            value:
                'Familiar with and committed to following TikTok Community Guidelines and TikTok Shop policies',
          ),
          const RequirementsItem(
            label: 'Account settings:',
            value: 'Public TikTok account (cannot be private)',
          ),
          const RequirementsItem(
            label: 'Profile quality:',
            value: 'Professional, high-quality profile picture',
          ),
          const RequirementsItem(
            label: 'Content:',
            value: 'At least 4 videos posted',
          ),
          const RequirementsItem(
            label: 'Followers:',
            value: 'At least 5,000 followers',
          ),
          const RequirementsItem(
            label: 'TikTok Shop access:',
            value: 'Already have TikTok Shop access (or manager access)',
          ),
          const RequirementsItem(
            label: 'Existing Shop link:',
            value:
                'Cannot already be linked to a TikTok seller account or another TikTok Shop agency',
          ),
        ],
      ),
    );
  }

  // MARK: - Favorited Requirements Builder
  Widget _buildFavoritedRequirements(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RequirementsProgramHeader(
            icon: Icons.favorite_outline,
            title: 'Favorited agency requirements',
            textTheme: textTheme,
          ),
          const SizedBox(height: 20),
          const RequirementsItem(
            label: 'Age:',
            value: '18 years old or older',
          ),
          const RequirementsItem(
            label: 'Location:',
            value: 'Must be based in the United States or Canada',
          ),
          const RequirementsItem(
            label: 'Platform earnings:',
            value:
                'Have made less than \$1,000 on Favorited already',
          ),
          const RequirementsItem(
            label: 'Interest:',
            value:
                'Willing to treat live streaming as a career and go LIVE consistently',
          ),
          const RequirementsItem(
            label: 'Guideline adherence:',
            value:
                'Familiar with and committed to following Favorited community guidelines and Infinitum Favorited LIVE policy',
          ),
          const RequirementsItem(
            label: 'Affiliation:',
            value:
                'Cannot already be in a Favorited agency. Agencies on other platforms are permitted.',
          ),
          const RequirementsItem(
            label: 'LIVE streaming commitment:',
            value:
                'Must actively go LIVE on Favorited. Keep a consistent schedule and tell your audience when possible.',
          ),
          const RequirementsItem(
            label: 'Account settings:',
            value: 'Public account (cannot be private)',
          ),
          const RequirementsItem(
            label: 'Profile quality:',
            value: 'Professional, high-quality profile picture',
          ),
          const RequirementsItem(
            label: 'Followers:',
            value: 'No follower minimum',
          ),
        ],
      ),
    );
  }

  // MARK: - Bigo Requirements Builder
  Widget _buildBigoRequirements(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RequirementsProgramHeader(
            icon: Icons.live_tv_outlined,
            title: 'Bigo agency requirements',
            textTheme: textTheme,
          ),
          const SizedBox(height: 20),
          const RequirementsItem(
            label: 'Age:',
            value: '18 years old or older',
          ),
          const RequirementsItem(
            label: 'Location:',
            value: 'Must be based in the United States or Canada',
          ),
          const RequirementsItem(
            label: 'Interest:',
            value: 'Willing to treat live streaming as a career',
          ),
          const RequirementsItem(
            label: 'Guideline adherence:',
            value:
                'Familiar with and committed to following Bigo Community Guidelines',
          ),
          const RequirementsItem(
            label: 'Affiliation:',
            value:
                'Not currently affiliated with another Bigo LIVE agency or manager',
          ),
          const RequirementsItem(
            label: 'LIVE streaming commitment:',
            value: 'Able to go LIVE at least 1 day a month',
          ),
          const RequirementsItem(
            label: 'Account settings:',
            value: 'Public account (cannot be private)',
          ),
          const RequirementsItem(
            label: 'Profile quality:',
            value: 'Professional, high-quality profile picture',
          ),
          const RequirementsItem(
            label: 'Followers:',
            value: 'No follower minimum',
          ),
        ],
      ),
    );
  }
}

// MARK: - Requirements Program Header
class _RequirementsProgramHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextTheme textTheme;

  const _RequirementsProgramHeader({
    required this.icon,
    required this.title,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}

// MARK: - Requirement Item Widget
class RequirementsItem extends StatelessWidget {
  final String label;
  final String value;

  const RequirementsItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(value, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Load currently-accepting countries from a public Infinitum config feed
// - Deep-link each program to its infinitumlive.com apply form
// - Surface InfiniView Finish setup status only after a creator signs in to InfiniView
