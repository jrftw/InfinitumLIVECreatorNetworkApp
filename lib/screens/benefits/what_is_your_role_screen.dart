/*
 * Filename: what_is_your_role_screen.dart
 * Purpose: Creator responsibilities after joining Infinitum LIVE programs
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

// MARK: - What Is Your Role Screen
class WhatIsYourRoleScreen extends StatelessWidget {
  const WhatIsYourRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Logger.logInfo(
      'Opened What Is Your Role screen (app ${AppConfig.appVersion} Build 1)',
      tag: 'WhatIsYourRoleScreen',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.whatIsYourRole),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          // MARK: - Header Section
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Infinitum LIVE',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'Proudly founded and thriving in the USA — Pittsburgh, Pennsylvania. Established March 15, 2023.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome to Infinitum LIVE Creator Network — a professional, supportive community for ambitious creators. After you join, InfiniView is where you finish setup, find your manager, and track LIVE performance. This hub has no login.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  'We support creators across:',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                const WhatIsYourRolePlatformItem(
                  icon: Icons.videocam_outlined,
                  title: 'TikTok LIVE',
                ),
                const WhatIsYourRolePlatformItem(
                  icon: Icons.storefront_outlined,
                  title: 'TikTok Shop',
                ),
                const WhatIsYourRolePlatformItem(
                  icon: Icons.favorite_outline,
                  title: 'Favorited LIVE',
                ),
                const WhatIsYourRolePlatformItem(
                  icon: Icons.live_tv_outlined,
                  title: 'Bigo LIVE',
                ),
                const WhatIsYourRolePlatformItem(
                  icon: Icons.hub_outlined,
                  title:
                      'Also: YouTube, Instagram, Neptune, Clapper, and RedNote (program details after you join)',
                ),
                const SizedBox(height: 16),
                Text(
                  'Each section below is your role after you are accepted. These standards keep the network professional, compliant, and high-performing.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildWhatIsYourRoleTikTokLiveSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatIsYourRoleTikTokShopSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatIsYourRoleFavoritedSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatIsYourRoleBigoSection(theme.textTheme),
          const SizedBox(height: 16),
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Final note',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Text(
                  'These responsibilities and opportunities are designed to empower you as a creator while keeping Infinitum LIVE professional, compliant, and high-performing. Meeting these standards protects your career, maximizes growth, and supports the community.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'At Infinitum LIVE, your success is our success.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // MARK: - TikTok LIVE Section Builder
  Widget _buildWhatIsYourRoleTikTokLiveSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TikTok LIVE (United States, Canada, United Kingdom, Australia, New Zealand)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & responsibilities for Infinitum LIVE Creator Network members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You have to put in the work to make this work.',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          WhatIsYourRoleResponsibilitySection(
            number: '1',
            title: 'Complete InfiniView Finish setup',
            items: const [
              'After TikTok accepts the invitation, finish onboarding in InfiniView (web or iOS/Android). That is where your manager card, time-off, bonuses, and appeals live.',
              'Join Infinitum Discord. Discord is required for communication and support.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '2',
            title: 'Commitment to going LIVE regularly',
            items: const [
              'Apply commitment: at least 8 valid days and 20 valid hours per month.',
              'Diamond Incentive Program and many campaigns: typically 12 valid days and 25+ hours, as announced in InfiniView.',
              'Valid sessions: each LIVE must last a minimum of 1 continuous hour. Resetting or cutting sessions short before the 1-hour mark does not count.',
              'Backup accounts are not permitted. Advertising dual or multi-streaming on TikTok LIVE is not permitted.',
              'Exception requests: if military duty, work schedules, illness, family emergencies, or natural disasters prevent you from meeting requirements, submit a documented request. Each case is reviewed individually.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '3',
            title: 'Follow TikTok Community Guidelines',
            items: const [
              'Strict compliance: you must adhere to TikTok\'s Community Guidelines at all times.',
              'Professionalism on LIVE: avoid behavior that may harm your image or Infinitum\'s reputation, including excessive profanity, smoking/vaping, drinking alcohol, explicit discussions, or other inappropriate conduct.',
              'Zero tolerance: severe or repeated violations may result in suspension or removal from the network.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '4',
            title: 'Accountability & communication',
            items: const [
              'Stay connected: use your InfiniView card to identify and contact your assigned manager.',
              'Ask for support: managers and the Infinitum team help with technical issues, LIVE strategies, and platform-related challenges during 8 AM–8 PM EST, Monday–Friday.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '5',
            title: 'Referral program',
            items: const [
              'Earn rewards: invite new creators to Infinitum LIVE and receive referral bonuses once they successfully join and meet requirements.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '6',
            title: 'Loyalty & integrity',
            items: const [
              'Report poaching: if another network approaches you, notify us immediately with screenshots or chat logs.',
              'Stay committed: joining or entertaining offers from outside TikTok LIVE agencies while under Infinitum LIVE violates your agreement.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - TikTok Shop Section Builder
  Widget _buildWhatIsYourRoleTikTokShopSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TikTok Shop (United States only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & responsibilities for Infinitum TikTok Shop members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You have to put in the work to make this work.',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          WhatIsYourRoleResponsibilitySection(
            number: '1',
            title: 'Shop activity & engagement',
            items: const [
              'Consistency matters: maintain regular participation in TikTok Shop activities such as product promotion, sales streams, and content uploads.',
              'Exception requests: if personal obligations or emergencies affect your ability to participate, notify us for review.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '2',
            title: 'Achieve monthly sales goals',
            items: const [
              'Performance standards: strive to meet or exceed monthly sales targets.',
              'Track your growth: use Infinitum and InfiniView tools to review sales progress.',
              'Get help: managers can provide strategies for boosting sales.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '3',
            title: 'Compliance with TikTok Shop rules',
            items: const [
              'Adhere to policies: always comply with TikTok Shop terms to avoid penalties or suspensions.',
              'Professional conduct: treat all customers and sales interactions with respect.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '4',
            title: 'Communication & support',
            items: const [
              'Direct help: reach out to Infinitum support for assistance with violations, login problems, or account concerns.',
              'Manager contact: use Discord to connect with your assigned manager.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '5',
            title: 'Referral opportunities',
            items: const [
              'Expand the Shop: recruit other sellers and earn referral rewards when they successfully join under Infinitum.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '6',
            title: 'Integrity & loyalty',
            items: const [
              'Report poaching attempts: share screenshots if other agencies contact you.',
              'No dual Shop membership: working with another TikTok Shop agency while under Infinitum violates your contract.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Favorited Section Builder
  Widget _buildWhatIsYourRoleFavoritedSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorited LIVE (United States and Canada)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & responsibilities for Favorited agency members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You have to put in the work to make this work.',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          WhatIsYourRoleResponsibilitySection(
            number: '1',
            title: 'LIVE activity',
            items: const [
              'Favorited LIVE Creators must actively go LIVE on Favorited.',
              'Maintain a consistent schedule and notify your audience in advance when possible.',
              'Failing to meet required LIVE participation without prior communication or valid justification may result in a warning or removal of Favorited status.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '2',
            title: 'Platform & behavior standards',
            items: const [
              'Follow all Favorited platform policies and Infinitum Favorited LIVE policy (no harassment, no sexual content, family-friendly, professional conduct).',
              'Agencies on other platforms are permitted. You cannot already be in another Favorited agency.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '3',
            title: 'Support & communication',
            items: const [
              'Your manager matters: Favorited managers help with questions and account issues.',
              'Discord connection: use Discord to stay in contact with your assigned manager.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '4',
            title: 'Referral rewards',
            items: const [
              'Grow the team: invite friends or new creators to Favorited LIVE and earn referral bonuses when they join.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '5',
            title: 'Integrity & protection',
            items: const [
              'Report poaching attempts: provide evidence if another Favorited agency attempts to recruit you.',
              'Stay loyal: accepting outside Favorited agency offers while contracted with Infinitum is prohibited.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Bigo Section Builder
  Widget _buildWhatIsYourRoleBigoSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bigo LIVE (United States and Canada)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & responsibilities for Infinitum Bigo LIVE members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You have to put in the work to make this work.',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          WhatIsYourRoleResponsibilitySection(
            number: '1',
            title: 'LIVE activity',
            items: const [
              'Encouraged consistency: while Bigo has flexible activity rules, consistent streaming significantly improves visibility and rewards.',
              'Engagement focus: the more frequently and consistently you stream, the better your growth potential.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '2',
            title: 'Compliance with Bigo standards',
            items: const [
              'Abide by rules: always follow Bigo LIVE\'s community guidelines and policies.',
              'Professionalism on camera: refrain from inappropriate conduct such as excessive profanity, smoking, alcohol consumption, or offensive content.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '3',
            title: 'Communication & support',
            items: const [
              'Manager guidance: Infinitum managers support Bigo-related issues, including violations, performance tips, or account concerns.',
              'Stay connected: use Discord to communicate directly with your assigned manager.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '4',
            title: 'Referral opportunities',
            items: const [
              'Build the family: invite others to join Bigo LIVE with Infinitum and earn referral bonuses for successful recruits.',
            ],
            textTheme: textTheme,
          ),
          WhatIsYourRoleResponsibilitySection(
            number: '5',
            title: 'Loyalty & protection',
            items: const [
              'Poaching awareness: immediately report outside agencies attempting to recruit you.',
              'Stay committed: working with other Bigo agencies while under Infinitum is a violation of your agreement.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

// MARK: - Platform Item Widget
class WhatIsYourRolePlatformItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const WhatIsYourRolePlatformItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 22, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: theme.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

// MARK: - Responsibility Section Widget
class WhatIsYourRoleResponsibilitySection extends StatelessWidget {
  final String number;
  final String title;
  final List<String> items;
  final TextTheme textTheme;

  const WhatIsYourRoleResponsibilitySection({
    super.key,
    required this.number,
    required this.title,
    required this.items,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $title',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: textTheme.bodyMedium),
                  Expanded(
                    child: Text(
                      item,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Deep-link "InfiniView card" to the InfiniView tab
// - Load campaign hour floors from InfiniView Resources
// - Localize after legal review
