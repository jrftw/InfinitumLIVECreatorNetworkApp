/*
 * Filename: what_we_do_not_do_screen.dart
 * Purpose: Screen displaying detailed information about what Infinitum does NOT do
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - What We Do Not Do Screen
class WhatWeDoNotDoScreen extends StatelessWidget {
  const WhatWeDoNotDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('What We Do NOT Do'),
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
                  'What We Do NOT Do – In Black and White.',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'At Infinitum LIVE, we believe in transparency and honesty. Too often, false claims and misinformation spread about what a Creator Network does. To set the record straight, here is exactly what we do not do across TikTok LIVE, TikTok Shop, Favorited, and Bigo.',
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
          
          // MARK: - Universal Section
          _buildUniversalSection(theme.textTheme),
          
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
            'TikTok LIVE (USA, Canada, United Kingdom, Australia)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          _DoNotDoCategory(
            title: 'Account Ownership & Management',
            items: [
              'No Account Ownership: We never take control of your TikTok account. You remain the sole owner.',
              'No Direct Content Management: We do not create, post, or edit TikTok videos for you.',
              'No Cross-Platform Control: YouTube, Instagram, and other accounts remain outside our scope.',
              'No Personal Branding Services: We do not handle logos, merchandise, or sponsorship deals.',
              'No Device Control: We do not monitor or manage your phone, computer, or personal devices.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Payments & Financials',
            items: [
              'No Payments for Going LIVE: Payouts come directly from TikTok, not from us.',
              'No Hidden Fees: Our TikTok LIVE services are free for creators.',
              'No Reimbursement: We do not cover or refund equipment or material costs.',
              'No Financial or Tax Advice: We do not manage, file, or prepare taxes for you. (Creators are independent contractors, not employees.)',
              'No Retroactive Contract Changes: Your terms cannot change without your written agreement.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Gifts, Products, & Followers',
            items: [
              'No Free Gifts for Battles/Rankings: Rewards are only offered through official network campaigns.',
              'No Free Products: We do not provide equipment or merchandise.',
              'No Artificial Growth: We do not sell followers, likes, bots, viewers, or any form of fake engagement.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Bans, Violations, & Reports',
            items: [
              'No Authority Over Bans: TikTok enforces bans and suspensions—not us.',
              'No Access to Report Data: We cannot see who reported or flagged your content.',
              'No Violation Removal: We cannot erase TikTok-issued content strikes.',
              'No Special Appeal Access: We do not bypass TikTok\'s appeals system.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Support & Moderation',
            items: [
              'No Dedicated Manager for Every LIVE: Managers support many creators and cannot join each stream.',
              'No LIVE Moderation: You must appoint and manage your own moderators.',
              'No 24/7 Availability: Managers provide guidance, not personal assistant services.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Events & Reminders',
            items: [
              'No Personal Event Reminders: You are responsible for tracking events and LIVE schedules.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Success & Guarantees',
            items: [
              'No Guarantee of Fame or Earnings: Growth depends on your effort, consistency, and content.',
              'No Recruitment Promises: We do not promise income just for joining.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Miscellaneous',
            items: [
              'No Legal Advice: We do not provide legal or contractual counsel.',
              'No Health/Mental Health Services: We do not provide therapy, counseling, or emergency support.',
              'No Romance Guarantees: We cannot make anyone fall in love with you… yet.',
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
          const SizedBox(height: 20),
          _DoNotDoCategory(
            title: 'Account Ownership & Management',
            items: [
              'No Account Takeover: You retain full control of your TikTok Shop.',
              'No Content Creation: We do not make or post TikTok Shop videos.',
              'No Branding or Cross-Platform Support: Logos, merchandise, or Instagram/YouTube accounts are not covered.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Payments & Financials',
            items: [
              'No Direct Payments: All payouts come from TikTok Shop.',
              'No Equipment Funding: We do not purchase or reimburse equipment.',
              'No Tax/Financial Advice: Revenue management and filing are your responsibility.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Gifts, Products, & Engagement',
            items: [
              'No Free Inventory: Products must be sourced by you.',
              'No Fake Sales/Views: We do not provide artificial viewer or sales boosting.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Bans, Violations, & Reports',
            items: [
              'No Authority Over Bans: TikTok Shop enforces account actions.',
              'No Violation Removal: We cannot appeal or erase violations.',
              'No Report Data Access: We do not see who flagged your content.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Support & Moderation',
            items: [
              'No Manager for Every Sale: Managers provide general support, not live oversight.',
              'No Shop Moderation: You must manage your own moderators.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Events & Reminders',
            items: [
              'No Event/Sale Reminders: You are responsible for scheduling and tracking sales.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Success & Guarantees',
            items: [
              'No Guaranteed Sales Growth: Results depend on your content and effort.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Miscellaneous',
            items: [
              'No Legal or Contract Advice: Please consult a legal professional.',
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
            'Favorited (USA Only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          _DoNotDoCategory(
            title: 'Account Ownership & Management',
            items: [
              'No Account Control: Your Favorited account remains yours.',
              'No Content Posting: We do not create or manage Favorited content.',
              'No Cross-Platform Oversight: Other platforms (YouTube, Instagram, etc.) are not managed.',
              'No Branding Services: Merchandise, logos, and deals are not provided.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Payments & Financials',
            items: [
              'No Payments for Streaming: Earnings come directly from Favorited.',
              'No Fees: Our services are free.',
              'No Equipment Reimbursement: You fund your own tools.',
              'No Financial Advice: We do not offer financial planning or tax prep.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Gifts, Products, & Engagement',
            items: [
              'No Free Products: We do not supply items for going LIVE.',
              'No Artificial Growth: We do not sell followers, likes, or viewers.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Bans, Violations, & Reports',
            items: [
              'No Ban Control: Favorited enforces bans independently.',
              'No Report Data Access: We cannot see who reports you.',
              'No Violation Removal: Favorited handles its own guideline enforcement.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Support & Moderation',
            items: [
              'No Dedicated Manager for Every LIVE: Managers provide guidance but cannot attend all streams.',
              'No Moderation Services: You are responsible for selecting moderators.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Events & Reminders',
            items: [
              'No Event Reminders: You must track and manage your schedule.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Success & Guarantees',
            items: [
              'No Promise of Instant Growth: Success takes time and effort.',
            ],
            textTheme: textTheme,
          ),
          _DoNotDoCategory(
            title: 'Miscellaneous',
            items: [
              'No Legal Advice: Seek professionals for contracts or disputes.',
              'No Romance Guarantees: Still can\'t make love happen!',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Universal Section Builder
  Widget _buildUniversalSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Universal Across All Platforms',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          _DoNotDoCategory(
            title: '',
            items: [
              'No Hidden Clauses or Fees: All terms are transparent and provided in writing.',
              'No Retroactive Contract Changes: We cannot alter agreements without your consent.',
              'No Platform Authority: We do not create or change TikTok, Favorited, Bigo, or Shop policies.',
              'No Fraudulent Services: We do not sell fake growth, bots, or empty promises.',
              'No Forced Exclusivity Without Consent: You are never locked in unless you choose to sign with us.',
              'No Misrepresentation: We are a Creator Network partner—not TikTok, not Favorited, not Bigo.',
              'No Direct Platform Access: We do not provide a "special line" to platform executives.',
              'No Responsibility for Harassment or Safety Risks: We promote safe streaming but cannot prevent or control external harassment.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

// MARK: - Do Not Do Category Widget
class _DoNotDoCategory extends StatelessWidget {
  final String title;
  final List<String> items;
  final TextTheme textTheme;
  
  const _DoNotDoCategory({
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
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
          ],
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '✗ ',
                  style: textTheme.bodyMedium?.copyWith(
                    color: textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
                ),
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
// - Add search functionality for specific "do not do" items
// - Implement expandable sections for better navigation
// - Add comparison table showing what we do vs. what we don't do
// - Create FAQ section addressing common misconceptions
// - Add print/export functionality
// - Implement bookmark feature for important clarifications

