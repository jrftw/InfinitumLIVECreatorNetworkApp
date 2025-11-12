/*
 * Filename: what_is_your_role_screen.dart
 * Purpose: Screen displaying detailed information about creator roles and responsibilities
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - What Is Your Role Screen
class WhatIsYourRoleScreen extends StatelessWidget {
  const WhatIsYourRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('What Is Your Role'),
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
                Row(
                  children: [
                    const Text('🇺🇸', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Proudly Founded and Thriving in the USA!',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome to Infinitum LIVE Creator Network — a professional, supportive, and high-performing community built for ambitious creators.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  'We proudly support creators across multiple platforms:',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                _PlatformItem(icon: '🎥', title: 'TikTok LIVE'),
                _PlatformItem(icon: '🛒', title: 'TikTok Shop'),
                _PlatformItem(icon: '⭐', title: 'Favorited LIVE'),
                _PlatformItem(icon: '🔥', title: 'Bigo LIVE'),
                const SizedBox(height: 16),
                Text(
                  'Each section below outlines your expectations, responsibilities, and opportunities as a member of Infinitum LIVE. These standards ensure professionalism, compliance, and growth while also protecting your long-term success.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - TikTok LIVE Section
          _buildTikTokLiveSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - TikTok Shop Section
          _buildTikTokShopSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Favorited Section
          _buildFavoritedSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Bigo Section
          _buildBigoSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Final Note
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Final Note',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Text(
                  'These responsibilities and opportunities are designed to empower you as a creator while ensuring the Infinitum LIVE Network remains professional, compliant, and high-performing. By meeting these standards, you protect your career, maximize your growth, and contribute to a thriving community of like-minded creators.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'At Infinitum LIVE, your success is our success. 🚀',
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
  Widget _buildTikTokLiveSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TikTok LIVE (United States, Canada, United Kingdom, Australia ONLY)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & Responsibilities for Infinitum LIVE Creator Network Members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You Have to Put in the Work to Make This Work!',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _ResponsibilitySection(
            number: '1',
            title: 'Commitment to Going LIVE Regularly',
            items: [
              'Minimum 12 Valid Days Per Month: You must stream at least 12 separate days each month.',
              'Minimum 25 Hours Per Month: You must complete at least 25 cumulative streaming hours.',
              'Valid Sessions: Each LIVE must last a minimum of 1 continuous hour. Resetting or cutting sessions short before the 1-hour mark does not count.',
              'Exception Requests: If serious obligations (e.g., military duty, work schedules, illness, family emergencies, natural disasters) prevent you from meeting requirements, submit a documented exception request. Each case will be reviewed individually.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '2',
            title: 'Follow TikTok Community Guidelines',
            items: [
              'Strict Compliance: You must adhere to TikTok\'s Community Guidelines at all times.',
              'Professionalism on LIVE: Avoid behavior that may harm your image or Infinitum\'s reputation, including excessive profanity, smoking/vaping, drinking alcohol, explicit discussions, or other inappropriate conduct.',
              'Zero Tolerance: Severe or repeated violations may result in suspension or removal from the network.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '3',
            title: 'Accountability & Communication',
            items: [
              'Stay Connected: Use your iVIEW/InfiniVIEW card to identify and contact your assigned manager.',
              'Ask for Support: Managers and the Infinitum team are available to assist with technical issues, LIVE strategies, or platform-related challenges.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '4',
            title: 'Referral Program',
            items: [
              'Earn Rewards: Invite new creators to Infinitum LIVE and receive referral bonuses once they successfully join and meet requirements.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '5',
            title: 'Loyalty & Integrity',
            items: [
              'Report Poaching: If another network approaches you, immediately notify us with screenshots or chat logs.',
              'Stay Committed: Joining or entertaining offers from outside agencies while under Infinitum LIVE violates your agreement and will jeopardize your future opportunities.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - TikTok Shop Section Builder
  Widget _buildTikTokShopSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TikTok Shop (USA Only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & Responsibilities for Infinitum TikTok Shop Members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You Have to Put in the Work to Make This Work!',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _ResponsibilitySection(
            number: '1',
            title: 'Shop Activity & Engagement',
            items: [
              'Consistency Matters: Maintain regular participation in TikTok Shop activities such as product promotion, sales streams, and content uploads.',
              'Exception Requests: If personal obligations or emergencies affect your ability to participate, notify us for review.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '2',
            title: 'Achieve Monthly Sales Goals',
            items: [
              'Performance Standards: Strive to meet or exceed monthly sales targets.',
              'Track Your Growth: Use Infinitum tools to review sales progress and identify improvement areas.',
              'Get Help: Managers are available to provide strategies for boosting sales when needed.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '3',
            title: 'Compliance with TikTok Shop Rules',
            items: [
              'Adhere to Policies: Always comply with TikTok Shop terms to avoid penalties or suspensions.',
              'Professional Conduct: Treat all customers and sales interactions with respect and professionalism.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '4',
            title: 'Communication & Support',
            items: [
              'Direct Help: Reach out to Infinitum support for assistance with violations, login problems, or account concerns.',
              'Manager Contact: Use Discord to connect with your assigned manager quickly.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '5',
            title: 'Referral Opportunities',
            items: [
              'Expand the Shop: Recruit other sellers and earn referral rewards when they successfully join under Infinitum.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '6',
            title: 'Integrity & Loyalty',
            items: [
              'Report Poaching Attempts: Share screenshots if other agencies contact you.',
              'No Dual Membership: Working with other agencies while under Infinitum violates your contract and will result in consequences.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Favorited Section Builder
  Widget _buildFavoritedSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorited LIVE (USA Only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & Responsibilities for Favorited Agency Members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You Have to Put in the Work to Make This Work!',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _ResponsibilitySection(
            number: '1',
            title: 'LIVE Activity',
            items: [
              'Flexible Streaming: No strict requirements, but consistency will increase your reach and income.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '2',
            title: 'Platform & Behavior Standards',
            items: [
              'Respect the Rules: Follow all Favorited platform policies and community guidelines.',
              'Professionalism on Camera: Avoid excessive profanity, smoking/vaping, drinking, or other unprofessional conduct. Violations may result in removal.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '3',
            title: 'Support & Communication',
            items: [
              'Your Manager Matters: Favorited managers are available to help with questions and account issues.',
              'Discord Connection: Use Discord to stay in contact with your assigned manager.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '4',
            title: 'Referral Rewards',
            items: [
              'Grow the Team: Invite friends or new creators to Favorited LIVE and earn referral bonuses.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '5',
            title: 'Integrity & Protection',
            items: [
              'Report Poaching Attempts: Provide evidence if another agency attempts to recruit you.',
              'Stay Loyal: Accepting outside offers while contracted with Infinitum is prohibited and can affect future opportunities.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Bigo Section Builder
  Widget _buildBigoSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bigo LIVE (USA Only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Expectations & Responsibilities for Infinitum Bigo LIVE Members',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'You Have to Put in the Work to Make This Work!',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _ResponsibilitySection(
            number: '1',
            title: 'LIVE Activity',
            items: [
              'Encouraged Consistency: While Bigo has flexible activity rules, consistent streaming significantly improves visibility and rewards.',
              'Engagement Focus: The more frequently and consistently you stream, the better your growth potential on the platform.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '2',
            title: 'Compliance with Bigo Standards',
            items: [
              'Abide by Rules: Always follow Bigo LIVE\'s community guidelines and policies.',
              'Professionalism on Camera: Refrain from inappropriate conduct such as excessive profanity, smoking, alcohol consumption, or offensive content.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '3',
            title: 'Communication & Support',
            items: [
              'Manager Guidance: Infinitum managers are available to support you with Bigo-related issues, including violations, performance tips, or account concerns.',
              'Stay Connected: Use Discord to communicate directly with your assigned manager.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '4',
            title: 'Referral Opportunities',
            items: [
              'Build the Family: Invite others to join Bigo LIVE with Infinitum and earn referral bonuses for successful recruits.',
            ],
            textTheme: textTheme,
          ),
          _ResponsibilitySection(
            number: '5',
            title: 'Loyalty & Protection',
            items: [
              'Poaching Awareness: Immediately report outside agencies attempting to recruit you.',
              'Stay Committed: Working with other agencies while under Infinitum is a violation of your agreement.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

// MARK: - Platform Item Widget
class _PlatformItem extends StatelessWidget {
  final String icon;
  final String title;
  
  const _PlatformItem({
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
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Text(title, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

// MARK: - Responsibility Section Widget
class _ResponsibilitySection extends StatelessWidget {
  final String number;
  final String title;
  final List<String> items;
  final TextTheme textTheme;
  
  const _ResponsibilitySection({
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: textTheme.bodyMedium?.color?.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  number,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 8),
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
          )),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add expandable sections for better navigation
// - Implement checklist functionality for tracking responsibilities
// - Add reminder notifications for key responsibilities
// - Create progress tracking for meeting requirements
// - Add FAQ section for common questions about roles
// - Implement search functionality within responsibilities
// - Add print/export role information feature

