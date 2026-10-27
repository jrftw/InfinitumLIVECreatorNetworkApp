/*
 * Filename: what_we_do_not_do_screen.dart
 * Purpose: Transparent list of services Infinitum LIVE does not provide
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

// MARK: - What We Do Not Do Screen
class WhatWeDoNotDoScreen extends StatelessWidget {
  const WhatWeDoNotDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Logger.logInfo(
      'Opened What We Do Not Do screen (app ${AppConfig.appVersion} Build 1)',
      tag: 'WhatWeDoNotDoScreen',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.whatWeDoNotDo),
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
                  'What we do not do — in black and white',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'Infinitum LIVE is a Creator Network partner. We are not TikTok, Favorited, or Bigo. Too often, false claims spread about what a network does. Here is exactly what we do not do across TikTok LIVE, TikTok Shop, Favorited, and Bigo. This public hub also does not sign you into InfiniView.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildWhatWeDoNotDoTikTokLiveSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoNotDoTikTokShopSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoNotDoFavoritedSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoNotDoBigoSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoNotDoUniversalSection(theme.textTheme),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // MARK: - TikTok LIVE Section Builder
  Widget _buildWhatWeDoNotDoTikTokLiveSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TikTok LIVE (United States, Canada, United Kingdom, Australia, New Zealand)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          WhatWeDoNotDoCategory(
            title: 'Account ownership & management',
            items: const [
              'No account ownership: We never take control of your TikTok account. You remain the sole owner.',
              'No direct content management: We do not create, post, or edit TikTok videos for you.',
              'No cross-platform control: YouTube, Instagram, and other accounts remain outside our scope unless you join that program separately.',
              'No personal branding services: We do not handle logos, merchandise, or sponsorship deals.',
              'No device control: We do not monitor or manage your phone, computer, or personal devices.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Payments & financials',
            items: const [
              'No payments for going LIVE: Payouts come directly from TikTok, not from us.',
              'No hidden fees: Our TikTok LIVE services are free for creators.',
              'No reimbursement: We do not cover or refund equipment or material costs.',
              'No financial or tax advice: We do not manage, file, or prepare taxes for you. Creators are independent contractors, not employees.',
              'No retroactive contract changes: Your terms cannot change without your written agreement.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Gifts, products, & followers',
            items: const [
              'No free gifts for battles or rankings: Rewards are only offered through official network campaigns.',
              'No free products: We do not provide equipment or merchandise as an entitlement.',
              'No artificial growth: We do not sell followers, likes, bots, viewers, or any form of fake engagement.',
              'No guaranteed views or instant success.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Bans, violations, & reports',
            items: const [
              'No authority over bans: TikTok enforces bans and suspensions — not us.',
              'No access to report data: We cannot see who reported or flagged your content.',
              'No violation removal: We cannot erase TikTok-issued content strikes.',
              'No special appeal access: We do not bypass TikTok\'s appeals system.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Support & moderation',
            items: const [
              'No dedicated manager for every LIVE: Managers support many creators and cannot join each stream.',
              'No LIVE moderation: You must appoint and manage your own moderators.',
              'No 24/7 availability: Managers provide guidance, not personal assistant services. Support hours are 8 AM–8 PM EST, Monday–Friday.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Events, keys, & streaming',
            items: const [
              'No personal event reminders: You are responsible for tracking events and LIVE schedules.',
              'Stream keys are not automatically granted.',
              'Advertising dual or multi-streaming on TikTok LIVE is not permitted.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Success & guarantees',
            items: const [
              'No guarantee of fame or earnings: Growth depends on your effort, consistency, and content.',
              'No recruitment promises: We do not promise income just for joining.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Miscellaneous',
            items: const [
              'No legal advice: We do not provide legal or contractual counsel.',
              'No health or mental health services: We do not provide therapy, counseling, or emergency support. We can share wellness resources.',
              'No InfiniView login in this hub: Finish setup and member tools live in InfiniView, not this public app.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - TikTok Shop Section Builder
  Widget _buildWhatWeDoNotDoTikTokShopSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TikTok Shop (United States only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          WhatWeDoNotDoCategory(
            title: 'Account ownership & management',
            items: const [
              'No account takeover: You retain full control of your TikTok Shop.',
              'No content creation: We do not make or post TikTok Shop videos.',
              'No branding or cross-platform support: Logos, merchandise, or Instagram/YouTube accounts are not covered.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Payments & financials',
            items: const [
              'No direct payments: All payouts come from TikTok Shop.',
              'No equipment funding: We do not purchase or reimburse equipment.',
              'No tax or financial advice: Revenue management and filing are your responsibility.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Gifts, products, & engagement',
            items: const [
              'No free inventory: Products must be sourced by you.',
              'No fake sales or views: We do not provide artificial viewer or sales boosting.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Bans, violations, & reports',
            items: const [
              'No authority over bans: TikTok Shop enforces account actions.',
              'No violation removal: We cannot appeal or erase violations on our own authority.',
              'No report data access: We do not see who flagged your content.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Support & moderation',
            items: const [
              'No manager for every sale: Managers provide general support, not live oversight.',
              'No Shop moderation: You must manage your own moderators.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Events & reminders',
            items: const [
              'No event or sale reminders: You are responsible for scheduling and tracking sales.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Success & guarantees',
            items: const [
              'No guaranteed sales growth: Results depend on your content and effort.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Miscellaneous',
            items: const [
              'No legal or contract advice: Please consult a legal professional.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Favorited Section Builder
  Widget _buildWhatWeDoNotDoFavoritedSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorited (United States and Canada)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          WhatWeDoNotDoCategory(
            title: 'Account ownership & management',
            items: const [
              'No account control: Your Favorited account remains yours.',
              'No content posting: We do not create or manage Favorited content.',
              'No cross-platform oversight: Other platforms are not managed as part of Favorited membership.',
              'No branding services: Merchandise, logos, and deals are not provided as an entitlement.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Payments & financials',
            items: const [
              'No payments for streaming: Earnings come directly from Favorited.',
              'No fees: Our Favorited services are free.',
              'No equipment reimbursement: You fund your own tools.',
              'No financial advice: We do not offer financial planning or tax prep.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Gifts, products, & engagement',
            items: const [
              'No free products: We do not supply items for going LIVE.',
              'No artificial growth: We do not sell followers, likes, or viewers.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Bans, violations, & reports',
            items: const [
              'No ban control: Favorited enforces bans independently.',
              'No report data access: We cannot see who reports you.',
              'No violation removal: Favorited handles its own guideline enforcement.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Support & moderation',
            items: const [
              'No dedicated manager for every LIVE: Managers provide guidance but cannot attend all streams.',
              'No moderation services: You are responsible for selecting moderators.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Events & reminders',
            items: const [
              'No event reminders: You must track and manage your schedule.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Success & guarantees',
            items: const [
              'No promise of instant growth: Success takes time and effort.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Miscellaneous',
            items: const [
              'No legal advice: Seek professionals for contracts or disputes.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Bigo Section Builder
  Widget _buildWhatWeDoNotDoBigoSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bigo LIVE (United States and Canada)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          WhatWeDoNotDoCategory(
            title: 'Account ownership & management',
            items: const [
              'No account control: Your Bigo account remains yours.',
              'No content posting: We do not create or manage Bigo streams for you.',
              'No device control: We do not monitor your phone, computer, or personal devices.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Payments & financials',
            items: const [
              'No payments for streaming: Earnings come directly from Bigo.',
              'No fees: Our Bigo services are free.',
              'No equipment reimbursement: You fund your own tools.',
              'No financial or tax advice.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Gifts, products, & engagement',
            items: const [
              'No free gifts or fake growth: We do not sell beans, followers, likes, bots, or viewers.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Bans, violations, & reports',
            items: const [
              'No ban control: Bigo enforces bans independently.',
              'No report data access: We cannot see who reports you.',
              'No violation removal: Bigo handles its own guideline enforcement.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Support & moderation',
            items: const [
              'No dedicated manager for every LIVE.',
              'No moderation services: You appoint your own moderators.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoNotDoCategory(
            title: 'Success & guarantees',
            items: const [
              'No guarantee of fame or earnings.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Universal Section Builder
  Widget _buildWhatWeDoNotDoUniversalSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Universal across all platforms',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          WhatWeDoNotDoCategory(
            title: '',
            items: const [
              'No hidden clauses or fees: All terms are transparent and provided in writing.',
              'No retroactive contract changes: We cannot alter agreements without your consent.',
              'No platform authority: We do not create or change TikTok, Favorited, Bigo, or Shop policies.',
              'No fraudulent services: We do not sell fake growth, bots, or empty promises.',
              'No forced exclusivity without consent: You are never locked in unless you choose to sign with us.',
              'No misrepresentation: We are a Creator Network partner — not TikTok, not Favorited, not Bigo.',
              'No direct platform access: We do not provide a special line to platform executives.',
              'No responsibility for harassment or safety risks: We promote safe streaming but cannot prevent or control external harassment.',
              'No InfiniView account in this app: Onboarding and member dashboards are inside InfiniView.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

// MARK: - Do Not Do Category Widget
class WhatWeDoNotDoCategory extends StatelessWidget {
  final String title;
  final List<String> items;
  final TextTheme textTheme;

  const WhatWeDoNotDoCategory({
    super.key,
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
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: textTheme.bodyMedium,
                  ),
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
// - Add a do vs do-not comparison table
// - Pull campaign "we do not pay you" language from InfiniView Resources
// - Localize after legal review
