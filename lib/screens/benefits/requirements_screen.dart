/*
 * Filename: requirements_screen.dart
 * Purpose: Screen displaying requirements for joining different Infinitum programs
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:infinitum_live_creator_network/l10n/app_localizations.dart';

// MARK: - Requirements Screen
class RequirementsScreen extends StatelessWidget {
  const RequirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.requirements),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          // MARK: - TikTok LIVE Requirements
          _buildTikTokLiveRequirements(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - TikTok Shop Requirements
          _buildTikTokShopRequirements(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Favorited Requirements
          _buildFavoritedRequirements(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Bigo Requirements
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
          Row(
            children: [
              const Text('🎥', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'TikTok LIVE Creator Network Requirements:',
                  style: textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _RequirementItem(
            label: 'Age:',
            value: '18 years old or older',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Location:',
            value: 'Must be based in the United States Of America, Canada, United Kingdom or Australia',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Interest:',
            value: 'Willing to learn about live streaming as a career',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Guideline Adherence:',
            value: 'Familiar with and committed to following TikTok Community Guidelines',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Affiliation:',
            value: 'Not currently affiliated with another TikTok LIVE agency or manager',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'LIVE Streaming Commitment:',
            value: 'Able to go LIVE for at least 12 valid days and 25 hours per month',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Account Settings:',
            value: 'Must have a public account (cannot be private)',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Profile Quality:',
            value: 'Must have a high-quality profile picture',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Content Requirements:',
            value: 'Must have at least 4 videos posted',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Followers:',
            value: 'Must have a minimum of 10 followers',
            textTheme: textTheme,
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
          Row(
            children: [
              const Text('🛒', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'TikTok Shop Agency Requirements:',
                  style: textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _RequirementItem(
            label: 'Location:',
            value: 'US-based creator',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Age:',
            value: '18 years old or older',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Interest:',
            value: 'Willing to learn about TikTok Shop affilate as a career',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Guideline Adherence:',
            value: 'Familiar with and committed to following TikTok Community Guidelines',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Account Settings:',
            value: 'Must have a public account (cannot be private)',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Profile Quality:',
            value: 'Must have a high-quality profile picture',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Content Requirements:',
            value: 'Must have at least 4 videos posted',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Followers:',
            value: 'Must have at least 5,000 followers',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'TikTok Shop Access:',
            value: 'Already have access to TikTok Shop or manager',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'TikTok Shop Not Linked:',
            value: 'Can not already be linked to a TikTok seller account or another TikTok Shop Agency',
            textTheme: textTheme,
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
          Row(
            children: [
              const Text('⭐', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Favorited Agency Requirements:',
                  style: textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _RequirementItem(
            label: 'Age:',
            value: '18 years old or older',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Location:',
            value: 'Must be based in the US or Canada',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Interest:',
            value: 'Willing to learn about live streaming as a career',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Guideline Adherence:',
            value: 'Familiar with and committed to following TikTok Community Guidelines',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Affiliation:',
            value: 'Not currently affiliated with another LIVE agency or manager',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'LIVE Streaming Commitment:',
            value: 'Able to go LIVE for at least 1 day a month',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Account Settings:',
            value: 'Must have a public account (cannot be private)',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Profile Quality:',
            value: 'Must have a high-quality profile picture',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Followers:',
            value: 'Must have a minimum of 0 followers',
            textTheme: textTheme,
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
          Row(
            children: [
              const Text('🔥', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Bigo Agency Requirements:',
                  style: textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _RequirementItem(
            label: 'Age:',
            value: '18 years old or older',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Location:',
            value: 'Must be based in the US or Canada',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Interest:',
            value: 'Willing to learn about live streaming as a career',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Guideline Adherence:',
            value: 'Familiar with and committed to following TikTok Community Guidelines',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Affiliation:',
            value: 'Not currently affiliated with another LIVE agency or manager',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'LIVE Streaming Commitment:',
            value: 'Able to go LIVE for at least 1 day a month',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Account Settings:',
            value: 'Must have a public account (cannot be private)',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Profile Quality:',
            value: 'Must have a high-quality profile picture',
            textTheme: textTheme,
          ),
          _RequirementItem(
            label: 'Followers:',
            value: 'Must have a minimum of 0 followers',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

// MARK: - Requirement Item Widget
class _RequirementItem extends StatelessWidget {
  final String label;
  final String value;
  final TextTheme textTheme;
  
  const _RequirementItem({
    required this.label,
    required this.value,
    required this.textTheme,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add requirement checklist functionality
// - Implement requirement validation tool
// - Add progress tracking for meeting requirements
// - Create comparison table between different program requirements
// - Add FAQ section for common requirement questions
// - Implement requirement reminder notifications
// - Add print/export requirements feature

