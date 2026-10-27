/*
 * Filename: what_we_do_screen.dart
 * Purpose: Public benefits of Infinitum LIVE Creator Network programs
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

// MARK: - What We Do Screen
class WhatWeDoScreen extends StatelessWidget {
  const WhatWeDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Logger.logInfo(
      'Opened What We Do screen (app ${AppConfig.appVersion} Build 1)',
      tag: 'WhatWeDoScreen',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.whatWeDo),
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
                  'What we do',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'Infinitum_US, Infinitum_UK, Infinitum_AU, Infinitum_LATAM, Infinitum_PH — Infinitum Imagery LLC Creator Network marks.',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Proudly founded and thriving in the USA. Pittsburgh, Pennsylvania. Established March 15, 2023.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'TikTok LIVE applications are currently accepted from the United States, Canada, United Kingdom, Australia, and New Zealand. We also operate Infinitum network marks for LATAM and the Philippines.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // MARK: - Services Overview
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We offer services you can review by section:',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                const WhatWeDoServiceItem(
                  icon: Icons.videocam_outlined,
                  title: 'TikTok LIVE',
                ),
                const WhatWeDoServiceItem(
                  icon: Icons.storefront_outlined,
                  title: 'TikTok Shop',
                ),
                const WhatWeDoServiceItem(
                  icon: Icons.favorite_outline,
                  title: 'Favorited',
                ),
                const WhatWeDoServiceItem(
                  icon: Icons.live_tv_outlined,
                  title: 'Bigo',
                ),
                const WhatWeDoServiceItem(
                  icon: Icons.hub_outlined,
                  title:
                      'YouTube, Instagram, Neptune, Clapper, and RedNote support after you join',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildWhatWeDoTikTokLiveBenefits(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoTikTokShopBenefits(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoFavoritedBenefits(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoBigoBenefits(theme.textTheme),
          const SizedBox(height: 16),
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Final summary',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Text(
                  'At Infinitum, whether you are on TikTok LIVE, TikTok Shop, Favorited LIVE, or Bigo LIVE, you gain:',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                const WhatWeDoBulletPoint(
                  'Full coaching and strategic support.',
                ),
                const WhatWeDoBulletPoint('Fast problem resolution.'),
                const WhatWeDoBulletPoint(
                  'Exclusive tools — InfiniView on web, iOS, and Android.',
                ),
                const WhatWeDoBulletPoint(
                  'Top earning potential (100% of your TikTok LIVE diamonds).',
                ),
                const WhatWeDoBulletPoint(
                  'Invitations to elite events and HQ visits for qualifying creators.',
                ),
                const SizedBox(height: 16),
                Text(
                  'Join Infinitum and take your content, earnings, and growth to the next level.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildWhatWeDoFaqSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildWhatWeDoWhyChooseSection(theme.textTheme),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // MARK: - TikTok LIVE Benefits Builder
  Widget _buildWhatWeDoTikTokLiveBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum TikTok LIVE Creator Network benefits',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Infinitum_US — USA/Canada | Infinitum_UK — United Kingdom | Infinitum_AU — Australia',
            style: textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Infinitum LIVE is a TikTok LIVE Creator Network and TikTok agency helping creators across the United States, Canada, United Kingdom, Australia, and New Zealand.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            'We provide coaching, strategic guidance, account support, and exclusive campaigns to help creators grow faster, earn more, and unlock opportunities like TikTok HQ visits, red carpet events, and agency-only bonuses.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          WhatWeDoBenefitSection(
            title: 'Coaching & strategic guidance',
            items: const [
              'Video calls & training — schedule private coaching sessions with your TikTok LIVE manager.',
              'Game plan creation — personalized content roadmaps with follow-up check-ins.',
              'Profile optimization — reviews to boost visibility, retention, and TikTok growth.',
              'Low viewer/traffic support — strategies to grow engagement and build consistent viewership.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Account & safety support',
            items: const [
              'Login & access issues — fast help with TikTok account access problems.',
              'Commission withdrawal issues — support for payout and commission delays.',
              'Hacked account recovery — escalation and assistance if your account is compromised.',
              'Doxxing protection — support if personal information is leaked.',
              'Violation & ban appeals — guidance and support with false flags or LIVE bans.',
              'Safety training — education on handling trolls, stalkers, and harassment.',
              'Copyright & strike guidance — protect content, avoid muted streams, and file takedowns.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'TikTok content support & optimization',
            items: const [
              'Hashtag & SEO strategy — trending keywords, captions, and TikTok search optimization.',
              'Thumbnail & title guidance — improve LIVE click-through with optimized covers.',
              'Content calendar templates — pre-built schedules to stay organized and consistent.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Analytics & performance tracking',
            items: const [
              'Monthly performance reviews — analyze diamonds, hours, and engagement growth.',
              'Goal tracking — personalized milestone setting with progress checkpoints.',
              'Custom reports — benchmark your results against regional and national averages.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Community & group benefits',
            items: const [
              'Group meetings — regular strategy sessions with managers and peers.',
              'Peer collaboration groups — smaller teams for sharing strategies and support.',
              'Shoutouts & promotions — featured on Infinitum TikTok, Instagram, and Facebook.',
              'Recognition awards — monthly and quarterly creator spotlights.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Exclusive TikTok event invitations',
            subtitle: '(Top-performing creators only)',
            items: const [
              'Special access — Red Carpet, BeautyCon, Fashion Week, and other TikTok events.',
              'TikTok HQ visits — invites to Los Angeles or New York HQ for elite creators.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Additional earning opportunities',
            items: const [
              'Agency-only promotions — exclusive bonus campaigns.',
              'Weekly rewards — CN rankings, LIVE matches, and battle opportunities.',
              'Monthly bonuses — extra milestone-based payouts (restrictions apply).',
              'Recruiting bonuses — earn when referred creators hit milestones.',
              'Brand partnership guidance — prep for sponsorships and partnerships.',
              'Cross-platform growth — expand audiences across TikTok, YouTube, and Instagram.',
              'Seasonal campaigns — holiday/trending campaigns with extra rewards.',
              'Free gifts — exclusive creator rewards through Infinitum\'s Diamond Incentive Program.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'International & regional LIVE matches',
            items: const [
              'Global matches — compete worldwide.',
              'Speed networking — collaborate with Infinitum creators across regions.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Exclusive TikTok campaign access',
            items: const [
              'Diamond Incentive Program (D.I.P.) — earn payouts for valid days, diamonds, and LIVE hours.',
              'TikTok tier graduation — swag and promotion for milestone achievements.',
              'Brawls campaigns — weekly 2v2 battle campaigns.',
              'Diamond Drive challenges — large-scale competitions with top-tier rewards.',
              'Traffic Boost campaigns — when offered, general qualification currently uses a 7,500 diamond floor plus days/hours rules announced in InfiniView.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Technical & streaming support',
            items: const [
              'Device & setup recommendations — affordable gear, lights, and mics.',
              'TikTok LIVE Studio / OBS support — streaming software setup and troubleshooting.',
              'Exclusive support — online chat support 8 AM–8 PM EST, Monday–Friday (phone, text, Discord DMs, email, WhatsApp).',
              'Community growth support for audience building.',
              'LIVE monitoring & feedback with real-time insights.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Exclusive Infinitum creator tools',
            items: const [
              'InfiniView web — track bonuses, diamonds, hours, appeals, and Finish setup at view.infinitumlive.com.',
              'InfiniView for iOS — iPhone, iPad, and other Apple devices.',
              'InfiniView for Android — full mobile support for Android devices.',
              'This Creator Network hub is public and has no login. Members sign in only inside InfiniView.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Early access & special perks',
            items: const [
              'Early TikTok feature access — test new platform features first when TikTok offers them to the network.',
              'Key information first — priority updates on TikTok news and Infinitum campaigns.',
              'Exclusive swag — TikTok & Infinitum merchandise rewards.',
              '100% earnings — keep all your TikTok LIVE diamonds (we take no cut).',
              'Creator Network LIVE access — TikTok grants LIVE access through the network invitation after you join and complete InfiniView Finish setup. Stream keys are not automatic.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Creator wellness & support',
            items: const [
              'Mental health resources — burnout prevention and wellness guidance.',
              'Time management support — balance TikTok content with personal life.',
              'Time-off submissions — protected leave via InfiniView to avoid penalties.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Optional benefits',
            items: const [
              'Free scheduled tournaments — compete for recognition and bonuses.',
              'Stream key access — available for qualified TikTok creators when granted; not automatic.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost / pricing',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$0 — No hidden costs, no commissions on TikTok LIVE diamonds.',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Infinitum LIVE never takes a cut of your TikTok LIVE diamonds. 100% of your TikTok LIVE earnings stay with you. A minimum 30-day participation commitment applies after enrollment.',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - TikTok Shop Benefits Builder
  Widget _buildWhatWeDoTikTokShopBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum TikTok Shop agency benefits (United States creators only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          WhatWeDoBenefitSection(
            title: 'TikTok Shop partner benefits',
            items: const [
              'Assistance growing your revenue on TikTok Shop.',
              'Personalized strategies and product tagging support.',
              'Sales analytics guidance.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Violation appeals',
            items: const [
              'TikTok Shop LIVE violation help.',
              'TikTok Shop video violation help.',
              'Compliance education and fast manager support.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Coupon and viewer issues',
            items: const [
              'Coupon setup assistance.',
              'Viewer engagement strategies.',
              'Lower-viewer issue support.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Account support',
            items: const [
              'Unable to login help.',
              'Unable to withdraw commission assistance.',
              'Hacked account reports.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost / pricing',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flexible fee structure: choose 2%–50% of earnings based on your preference.',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Favorited Benefits Builder
  Widget _buildWhatWeDoFavoritedBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum Favorited LIVE agency benefits (United States and Canada)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Infinitum_US is an official Favorited agency partner. Services are 100% free.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          WhatWeDoBenefitSection(
            title: 'Exclusive event invitations',
            items: const [
              'Special event access: Favorited LIVE creator events.',
              'Visit Favorited HQ: elite strategy sessions and workshops.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Exclusive support',
            items: const [
              'Priority support: 8 AM–8 PM EST, Monday–Friday.',
              'Community growth strategies: build a loyal fanbase.',
              'Performance monitoring: regular LIVE feedback and evaluations.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Exclusive Infinitum agency tools',
            items: const [
              'InfiniView web: earnings, bonuses, and appeals dashboard.',
              'InfiniView for iOS: iPhone, iPad, and other Apple devices.',
              'InfiniView for Android: full mobile support.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Early access & special benefits',
            items: const [
              'Feature previews: be first to test Favorited updates when offered.',
              'Exclusive resources and updates.',
              'Favorited merchandise rewards.',
              '100% of Favorited earnings stay with you.',
              'LIVE access flexibility.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost / pricing',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$0 — No hidden costs, no commissions.',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Bigo Benefits Builder
  Widget _buildWhatWeDoBigoBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum Bigo LIVE agency benefits (United States and Canada)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          WhatWeDoBenefitSection(
            title: 'Exclusive event invitations',
            items: const [
              'Special event access: elite Bigo LIVE creator events.',
              'Visit Bigo HQ: strategy sessions for top creators.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Exclusive support',
            items: const [
              'Priority support: 8 AM–8 PM EST, Monday–Friday.',
              'Community growth strategies.',
              'Performance monitoring.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Exclusive Infinitum agency tools',
            items: const [
              'InfiniView web: bonuses, earnings, and LIVE data.',
              'InfiniView for iOS: iPhone, iPad, and other Apple devices.',
              'InfiniView for Android: full mobile support.',
            ],
            textTheme: textTheme,
          ),
          WhatWeDoBenefitSection(
            title: 'Early access & special benefits',
            items: const [
              'Feature previews.',
              'Exclusive resources and updates.',
              'Bigo merchandise rewards.',
              '100% of Bigo earnings stay with you.',
              'LIVE access flexibility.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost / pricing',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$0 — No hidden costs, no commissions.',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - FAQ Section Builder
  Widget _buildWhatWeDoFaqSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FAQ — Infinitum TikTok LIVE agency',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          WhatWeDoFaqItem(
            question: 'What is a TikTok LIVE Creator Network?',
            answer:
                'A TikTok LIVE Creator Network (agency) is an official partner program that helps creators grow, access exclusive TikTok campaigns, and get support with account issues, events, and bonuses.',
            textTheme: textTheme,
          ),
          const Divider(height: 32),
          WhatWeDoFaqItem(
            question: 'Does Infinitum take a cut of my TikTok diamonds?',
            answer:
                'No. Infinitum LIVE never takes a percentage of your LIVE diamonds — you keep 100% of your TikTok LIVE earnings.',
            textTheme: textTheme,
          ),
          const Divider(height: 32),
          WhatWeDoFaqItem(
            question: 'How do I join Infinitum LIVE?',
            answer:
                'Apply on infinitumlive.com or use the Join tab in this hub. If you are eligible, we email next steps including your TikTok invitation code. After TikTok approves you, complete InfiniView Finish setup. Currently accepting TikTok LIVE applications from the USA, Canada, UK, Australia, and New Zealand.',
            textTheme: textTheme,
          ),
          const Divider(height: 32),
          WhatWeDoFaqItem(
            question: 'What makes Infinitum different from other TikTok agencies?',
            answer:
                'Infinitum is free to join for TikTok LIVE. We provide coaching, InfiniView analytics, wellness resources, exclusive campaigns, and community recognition. We do not sell followers, bots, or guaranteed fame.',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Why Choose Infinitum Builder
  Widget _buildWhatWeDoWhyChooseSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum LIVE Creator Network — a leading TikTok LIVE agency',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Infinitum LIVE Creator Network is an official TikTok Creator Network partner. We combine a creator-first model that is free to join for TikTok LIVE with coaching, campaigns, and InfiniView tools.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Why creators choose Infinitum',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const WhatWeDoBulletPoint(
            'No fees or commissions on TikTok LIVE — creators keep 100% of their TikTok LIVE earnings.',
          ),
          const WhatWeDoBulletPoint(
            'Full support system — ban appeals, account recovery, and stream key access when qualified (not automatic).',
          ),
          const WhatWeDoBulletPoint(
            'Exclusive analytics & tools — InfiniView dashboard to track diamonds, bonuses, and LIVE performance.',
          ),
          const WhatWeDoBulletPoint(
            'One-on-one coaching — personalized training from managers who know TikTok LIVE.',
          ),
          const WhatWeDoBulletPoint(
            'Community & events — tournaments, incentive programs, exclusive competitions, and TikTok HQ opportunities for qualifying creators.',
          ),
          const SizedBox(height: 16),
          Text(
            'Infinitum\'s competitive edge',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Unlike agencies that take a LIVE cut, Infinitum is transparent and creator-led. Qualified TikTok LIVE creators can apply, join for free, and unlock:',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          const WhatWeDoBulletPoint(
            'Direct TikTok Creator Network integration for official resources.',
          ),
          const WhatWeDoBulletPoint(
            'Accessibility — open to creators at all levels who meet the public requirements.',
          ),
          const WhatWeDoBulletPoint(
            'Mental health advocacy & mentorship — a community that values creators beyond numbers.',
          ),
          const SizedBox(height: 16),
          Text(
            'Founded March 15, 2023 in Pittsburgh. Run by creators, for creators.',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// MARK: - Service Item Widget
class WhatWeDoServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const WhatWeDoServiceItem({
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

// MARK: - Benefit Section Widget
class WhatWeDoBenefitSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<String> items;
  final TextTheme textTheme;

  const WhatWeDoBenefitSection({
    super.key,
    required this.title,
    this.subtitle,
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
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
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

// MARK: - Bullet Point Widget
class WhatWeDoBulletPoint extends StatelessWidget {
  final String text;

  const WhatWeDoBulletPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: theme.textTheme.bodyMedium),
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

// MARK: - FAQ Item Widget
class WhatWeDoFaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final TextTheme textTheme;

  const WhatWeDoFaqItem({
    super.key,
    required this.question,
    required this.answer,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}

// Suggestions For Features and Additions Later:
// - Load live campaign floors from InfiniView Resources
// - Deep-link Join tab from the FAQ answer
// - Localize after legal review
