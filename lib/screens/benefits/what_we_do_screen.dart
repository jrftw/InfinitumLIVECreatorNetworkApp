/*
 * Filename: what_we_do_screen.dart
 * Purpose: Screen displaying detailed information about what Infinitum does
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// MARK: - What We Do Screen
class WhatWeDoScreen extends StatelessWidget {
  const WhatWeDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
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
                  'What We Do',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'Infinitum_US, Infinitum_UK, Infinitum_AU – United States, Canada, United Kingdom, Australia, New Zealand, LATAM, Philippines',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('🚀', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Proudly founded & thriving in the USA! 🇺🇸📍',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Pittsburgh, Pennsylvania, USA 🎉',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Established: 3/15/2022',
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
                  'We offer services to the following which you can view by section:',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                _ServiceItem(icon: '🎥', title: 'TikTok LIVE'),
                _ServiceItem(icon: '🛒', title: 'TikTok Shop'),
                _ServiceItem(icon: '⭐', title: 'Favorited'),
                _ServiceItem(icon: '🔥', title: 'Bigo'),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - TikTok LIVE Benefits
          _buildTikTokLiveBenefits(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - TikTok Shop Benefits
          _buildTikTokShopBenefits(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Favorited Benefits
          _buildFavoritedBenefits(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Bigo Benefits
          _buildBigoBenefits(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Final Summary
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🎯 Final Summary',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                Text(
                  'At Infinitum, whether you\'re on TikTok LIVE, TikTok Shop, Favorited LIVE, or Bigo LIVE, you gain:',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                _BulletPoint('Full coaching and strategic support.'),
                _BulletPoint('Fast problem resolution.'),
                _BulletPoint('Exclusive tools and tracking apps.'),
                _BulletPoint('Top earning potential (100% of your earnings).'),
                _BulletPoint('Invitations to elite events and HQ visits.'),
                const SizedBox(height: 16),
                Text(
                  '💥 Join Infinitum and take your content, earnings, and growth to the next level!',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - FAQ Section
          _buildFAQSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Why Choose Infinitum
          _buildWhyChooseInfinitum(theme.textTheme),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }
  
  // MARK: - TikTok LIVE Benefits Builder
  Widget _buildTikTokLiveBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎥 Infinitum TikTok LIVE Creator Network & Agency Benefits',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            '(Infinitum_US – USA/Canada | Infinitum_UK – United Kingdom | Infinitum_AU – Australia)',
            style: textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Infinitum LIVE is a top TikTok LIVE Creator Network and TikTok agency helping creators across the USA, Canada, United Kingdom, Australia, and New Zealand.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            'We provide coaching, strategic guidance, account support, and exclusive campaigns to help creators grow faster, earn more, and unlock opportunities like TikTok HQ visits, red carpet events, and agency-only bonuses.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          _BenefitSection(
            title: '🧑‍🏫 Coaching & Strategic Guidance',
            items: [
              'Video Calls & Training – Schedule private coaching sessions with your TikTok LIVE manager.',
              'Game Plan Creation – Personalized content roadmaps with follow-up check-ins.',
              'Profile Optimization – Reviews to boost visibility, retention, and TikTok growth.',
              'Low Viewer/Traffic Support – Strategies to grow engagement and build consistent viewership.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🔐 Account & Safety Support',
            items: [
              'Login & Access Issues – Fast help with TikTok account access problems.',
              'Commission Withdrawal Issues – Support for payout and commission delays.',
              'Hacked Account Recovery – Escalation and assistance if your account is compromised.',
              'Doxxing Protection – Support if personal information is leaked.',
              'Violation & Ban Appeals – Guidance and support with false flags or LIVE bans.',
              'Safety Training – Education on handling trolls, stalkers, and harassment.',
              'Copyright & Strike Guidance – Protect content, avoid muted streams, and file takedowns.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🎨 TikTok Content Support & Optimization',
            items: [
              'Hashtag & SEO Strategy – Trending keywords, captions, and TikTok search optimization.',
              'Thumbnail & Title Guidance – Improve LIVE click-through with optimized covers.',
              'Content Calendar Templates – Pre-built schedules to stay organized and consistent.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '📊 Analytics & Performance Tracking',
            items: [
              'Monthly Performance Reviews – Analyze diamonds, hours, and engagement growth.',
              'Goal Tracking – Personalized milestone setting with progress checkpoints.',
              'Custom Reports – Benchmark your results against regional and national averages.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '👥 Community & Group Benefits',
            items: [
              'Group Meetings – Regular strategy sessions with managers and peers.',
              'Peer Collaboration Groups – Smaller teams for sharing strategies and support.',
              'Shoutouts & Promotions – Featured on Infinitum TikTok, Instagram, and Facebook.',
              'Recognition Awards – Monthly and quarterly creator spotlights.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🎉 Exclusive TikTok Event Invitations',
            subtitle: '(Top-performing creators only)',
            items: [
              'Special Access – Red Carpet, BeautyCon, Fashion Week, and other TikTok events.',
              'TikTok HQ Visits – Invites to Los Angeles or New York HQ for elite creators.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '💰 Additional Earning Opportunities',
            items: [
              'Agency-Only Promotions – Exclusive bonus campaigns.',
              'Weekly Rewards – CN rankings, LIVE matches, and battle opportunities.',
              'Monthly Bonuses – Extra milestone-based payouts (restrictions apply).',
              'Recruiting Bonuses – Earn when referred creators hit milestones.',
              'Brand Partnership Guidance – Prep for sponsorships and partnerships.',
              'Cross-Platform Growth – Expand audiences across TikTok, YouTube, and Instagram.',
              'Seasonal Campaigns – Holiday/trending campaigns with extra rewards.',
              'Free Gifts – Exclusive creator rewards through Infinitum\'s Diamond Incentive Program.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🌍 International & Regional LIVE Matches',
            items: [
              'Global Matches – Compete worldwide.',
              'Speed Networking – Collaborate with Infinitum creators across regions.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '💎 Exclusive TikTok Campaign Access',
            items: [
              'Diamond Incentive Program (D.I.P.) – Earn payouts for valid days, diamonds, and LIVE hours.',
              'TikTok Tier Graduation – Swag and promotion for milestone achievements.',
              'Brawls Campaigns – Weekly 2v2 battle campaigns.',
              'Diamond Drive Challenges – Large-scale competitions with top-tier rewards.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🛠️ Technical & Streaming Support',
            items: [
              'Device & Setup Recommendations – Affordable gear, lights, and mics.',
              'TikTok LIVE Studio / OBS Support – Streaming software setup and troubleshooting.',
              'Exclusive Support – Online Chat Support (8 AM–8 PM EST, Mon–Fri: Phone, Text, Discord DMs, Email, WhatsApp).',
              'Community Growth Support for audience building.',
              'LIVE Monitoring & Feedback with real-time insights.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '📱 Exclusive Infinitum Creator Tools',
            items: [
              'iVIEW / InfiniVIEW Web Tool – Track bonuses, diamonds, hours, and appeals.',
              'InfiniVIEW iOS App – Manage performance on iPhone/iPad.',
              'InfiniVIEW Android App – Full mobile support for Android devices.',
              'Web Preview Access – Limited access for non-members.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🌟 Early Access & Special Perks',
            items: [
              'Early TikTok Feature Access – Test new platform features first.',
              'Key Information First – Priority updates on TikTok news and Infinitum campaigns.',
              'Exclusive Swag – TikTok & Infinitum merchandise rewards.',
              '100% Earnings – Keep all your TikTok LIVE diamonds (we take no cut).',
              'Early LIVE Access – Go LIVE even with fewer than 1,000 followers.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🧘 Creator Wellness & Support',
            items: [
              'Mental Health Resources – Burnout prevention and wellness guidance.',
              'Time Management Support – Balance TikTok content with personal life.',
              'Time-Off Submissions – Protected leave via iView to avoid penalties.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: '🏆 Optional Benefits',
            items: [
              'Free Scheduled Tournaments – Compete for recognition and bonuses.',
              'Stream Key Access – Available for qualified TikTok creators.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💵 Cost / Pricing',
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
                const SizedBox(height: 8),
                Text(
                  'Infinitum LIVE never takes a cut of your TikTok LIVE diamonds. 100% of your TikTok earnings stay with you.',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🎯 Final Word',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'At Infinitum LIVE, creators unlock:',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                _BulletPoint('Coaching & growth strategies'),
                _BulletPoint('Fast account & safety support'),
                _BulletPoint('TikTok content & analytics tools'),
                _BulletPoint('Exclusive bonuses, campaigns, and rewards'),
                _BulletPoint('Elite & High follower creator event invitations'),
                _BulletPoint('100% TikTok LIVE earnings'),
                const SizedBox(height: 8),
                Text(
                  '💥 Join Infinitum today and take your content, community, and growth to the next level!',
                  style: textTheme.bodyMedium?.copyWith(
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
  
  // MARK: - TikTok Shop Benefits Builder
  Widget _buildTikTokShopBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🛒 Infinitum TikTok Shop Agency Benefits (USA Creators Only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _BenefitSection(
            title: 'TikTok Shop Partner Benefits',
            items: [
              'Revenue Growth Assistance:',
              '  • Personalized Strategies',
              '  • Optimized Content Creation',
              '  • Product Tagging Support',
              '  • Sales Analytics Guidance',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Violation Appeals:',
            items: [
              'LIVE and Video Violation Help',
              'Compliance Education',
              'Fast Manager Support',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Coupon and Viewer Issues:',
            items: [
              'Coupon Setup Assistance',
              'Viewer Engagement Strategies',
              'Viewer Retention Techniques',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Account Support:',
            items: [
              'Login Help',
              'Commission Withdrawal Assistance',
              'Hacked Account Recovery',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost/Pricing',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flexible Fee Structure: Choose 2%–50% of earnings based on your preference.',
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
  Widget _buildFavoritedBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '⭐ Infinitum Favorited LIVE Agency Benefits (USA Creators Only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _BenefitSection(
            title: 'Exclusive Event Invitations',
            items: [
              'Special Event Access: Favorited LIVE creator events.',
              'Visit Favorited HQ: Elite strategy sessions and workshops.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Exclusive Support',
            items: [
              'Priority Support: 8 AM–8 PM EST, Monday–Friday.',
              'Community Growth Strategies: Build a loyal fanbase.',
              'Performance Monitoring: Regular LIVE feedback and evaluations.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Exclusive Infinitum Agency Tools',
            items: [
              'iVIEW/InfiniVIEW Web Tool: Earnings, bonuses, and appeals dashboard.',
              'InfiniVIEW iOS App: Download for iOS',
              'InfiniVIEW Android App: Download for Android',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Early Access & Special Benefits',
            items: [
              'Feature Previews: Be first to test Favorited updates.',
              'Exclusive Resources and Updates',
              'Favorited Merchandise Rewards',
              '100% Earnings',
              'LIVE Access Flexibility',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost/Pricing',
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
  Widget _buildBigoBenefits(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🔥 Infinitum Bigo LIVE Agency Benefits (USA Creators Only)',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _BenefitSection(
            title: 'Exclusive Event Invitations',
            items: [
              'Special Event Access: Elite Bigo LIVE creator events.',
              'Visit Bigo HQ: Strategy sessions for top creators.',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Exclusive Support',
            items: [
              'Priority Support: 8 AM–8 PM EST, Monday–Friday.',
              'Community Growth Strategies',
              'Performance Monitoring',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Exclusive Infinitum Agency Tools',
            items: [
              'iVIEW/InfiniVIEW Web Tool: Bonuses, earnings, and LIVE data.',
              'InfiniVIEW iOS App: Download for iOS',
              'InfiniVIEW Android App: Download for Android',
            ],
            textTheme: textTheme,
          ),
          _BenefitSection(
            title: 'Early Access & Special Benefits',
            items: [
              'Feature Previews',
              'Exclusive Resources and Updates',
              'Bigo Merchandise Rewards',
              '100% Earnings',
              'LIVE Access Flexibility',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: textTheme.bodyMedium?.color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cost/Pricing',
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
  Widget _buildFAQSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '❓ FAQ – Infinitum TikTok LIVE Agency',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _FAQItem(
            question: 'What is a TikTok LIVE Creator Network?',
            answer: 'A TikTok LIVE Creator Network (agency) is an official partner program that helps creators grow, access exclusive TikTok campaigns, and get support with account issues, events, and bonuses.',
            textTheme: textTheme,
          ),
          const Divider(height: 32),
          _FAQItem(
            question: 'Does Infinitum take a cut of my TikTok diamonds?',
            answer: 'No. Infinitum LIVE never takes a percentage of your LIVE diamonds — you keep 100% of your TikTok LIVE earnings.',
            textTheme: textTheme,
          ),
          const Divider(height: 32),
          _FAQItem(
            question: 'How do I join Infinitum LIVE?',
            answer: 'You can apply directly through our official our website or with an Infinitum manager. Creators from the USA, Canada, UK, Australia, and New Zealand are eligible.',
            textTheme: textTheme,
          ),
          const Divider(height: 32),
          _FAQItem(
            question: 'What makes Infinitum different from other TikTok agencies?',
            answer: 'Infinitum offers more than just onboarding — we provide coaching, analytics, wellness support, exclusive campaigns, and real community recognition to help creators grow long-term.',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Why Choose Infinitum Builder
  Widget _buildWhyChooseInfinitum(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum LIVE Creator Network – The #1 TikTok LIVE Agency',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Infinitum LIVE Creator Network (Infinitum_US) is recognized as one of, if not the best TikTok LIVE agencies worldwide, serving creators across the United States, Canada, United Kingdom, Australia, and New Zealand. As an official TikTok Creator Network partner, Infinitum combines authenticity, innovation, and a creator-first model that is 100% free to join.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Why Creators Choose Infinitum',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Infinitum has quickly become a leading TikTok LIVE Creator Network by offering unmatched benefits, including:',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          _BulletPoint('No fees or commissions – creators always keep 100% of their TikTok LIVE earnings.'),
          _BulletPoint('Full support system – ban appeals, account recovery, and official stream key access.'),
          _BulletPoint('Exclusive analytics & tools – InfiniVIEW dashboard to track diamonds, bonuses, and LIVE performance in real time.'),
          _BulletPoint('One-on-one coaching – personalized training from real creators who know how to succeed on TikTok LIVE.'),
          _BulletPoint('Community & events – weekly tournaments, incentive programs, exclusive competitions, and TikTok HQ opportunities.'),
          const SizedBox(height: 12),
          Text(
            'This makes Infinitum more than just a TikTok agency—it is a complete ecosystem built for creator success.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Infinitum\'s Competitive Edge',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Unlike other agencies, Infinitum stands out because of its transparent, free, and creator-led approach. Any qualified TikTok LIVE creator can apply, join for free, and instantly unlock:',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          _BulletPoint('Direct TikTok integration for faster support and official resources.'),
          _BulletPoint('Accessibility – open to creators at all levels, from rookies to top performers.'),
          _BulletPoint('Mental health advocacy & mentorship – a supportive community that values creators beyond just numbers.'),
          const SizedBox(height: 12),
          Text(
            'Infinitum\'s unique positioning as a network "run by creators, for creators" ensures authenticity and trust.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Why Infinitum Dominates TikTok LIVE SEO',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'When searching for TikTok LIVE Agency USA, TikTok LIVE Creator Network, or Best TikTok Agency, Infinitum consistently ranks at the top thanks to:',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          _BulletPoint('Rapid growth – from 0 to nearly 2,000 creators in its first year.'),
          _BulletPoint('Strong brand identity – Infinitum_US name, ♾️ infinity symbol, and the "Infinite Potential" mission.'),
          _BulletPoint('Positive testimonials – creators across TikTok and Reddit call Infinitum one of the most supportive agencies.'),
          _BulletPoint('Proven success stories – members achieving milestones, growing audiences, and maximizing diamond earnings.'),
        ],
      ),
    );
  }
}

// MARK: - Service Item Widget
class _ServiceItem extends StatelessWidget {
  final String icon;
  final String title;
  
  const _ServiceItem({
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

// MARK: - Benefit Section Widget
class _BenefitSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<String> items;
  final TextTheme textTheme;
  
  const _BenefitSection({
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
          ...items.map((item) => Padding(
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
          )),
        ],
      ),
    );
  }
}

// MARK: - Bullet Point Widget
class _BulletPoint extends StatelessWidget {
  final String text;
  
  const _BulletPoint(this.text);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('✅ ', style: theme.textTheme.bodyMedium),
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
class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final TextTheme textTheme;
  
  const _FAQItem({
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
// - Add search functionality for benefits
// - Implement expandable sections for better navigation
// - Add bookmark/favorite benefits feature
// - Create comparison table between different platforms
// - Add video testimonials section
// - Implement sharing functionality for specific benefits
// - Add print/export benefits to PDF feature

