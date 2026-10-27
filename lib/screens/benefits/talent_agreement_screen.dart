/*
 * Filename: talent_agreement_screen.dart
 * Purpose: Public summary of Infinitum TikTok LIVE invitation terms and talent agreement
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

// MARK: - Talent Agreement Screen
class TalentAgreementScreen extends StatelessWidget {
  const TalentAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Logger.logInfo(
      'Opened Talent Agreement screen (app ${AppConfig.appVersion} Build 1)',
      tag: 'TalentAgreementScreen',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.talentAgreement),
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
                  'Infinitum Talent Agreement — TikTok LIVE',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Infinitum — Invitation Terms and Agreements',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'TikTok LIVE applications are currently accepted from the United States, Canada, United Kingdom, Australia, and New Zealand. Infinitum_US, Infinitum_UK, Infinitum_AU, Infinitum_LATAM, and Infinitum_PH are Infinitum Imagery LLC network marks. This is a public summary of the invitation you accept on TikTok and with Infinitum; it is not a substitute for the invitation shown in TikTok.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildTalentAgreementInfiniViewSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementInvitationTermSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementWithdrawalSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementPoachingSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementSettlementSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementRelationshipSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementDipSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementConfidentialitySection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementNonCompeteSection(theme.textTheme),
          const SizedBox(height: 16),
          _buildTalentAgreementFinalAcceptanceSection(theme.textTheme),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // MARK: - InfiniView Membership Tools
  Widget _buildTalentAgreementInfiniViewSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'InfiniView after you join',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            'After TikTok accepts the network invitation, complete InfiniView Finish setup (view.infinitumlive.com or the InfiniView iOS/Android app). InfiniView is the member app for manager contact, bonuses, diamonds, hours, time-off, and appeals. This Creator Network hub does not sign you into InfiniView.',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  // MARK: - Invitation Term Section Builder
  Widget _buildTalentAgreementInvitationTermSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invitation term',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          TalentAgreementItem(
            title: 'Duration:',
            content:
                'Membership is valid for three (3) years from the date of acceptance.',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Withdrawal & Removal Policy Section Builder
  Widget _buildTalentAgreementWithdrawalSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Withdrawal & removal policy',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'First 15 days:',
            items: const [
              'Creators may request removal at any time during the first 15 days of joining.',
              'Requests submitted within this period will be processed promptly with no restrictions.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'After 15 days:',
            items: const [
              'Following the initial 15 days, creators may request removal by providing a 30-day notice period.',
              'A 60-day cooldown period will apply before the creator is eligible to join another agency network.',
              'Infinitum is not obligated to approve an early release beyond these agreed terms.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Diamond threshold restriction:',
            items: const [
              'Creators who have earned 200,000+ Diamonds within the past six months are ineligible to transfer to another network under TikTok\'s Creator Network onboarding guidelines.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: '90-day completion requirement:',
            items: const [
              'Our network operates under a structured withdrawal process designed to protect both creators and the community. This includes a 30-day notice period followed by a 60-day cooldown period, totaling 90 days.',
              'This process cannot be shortened or waived, even in cases of solicitation from another party. Creators are expected to complete the full 90-day requirement as outlined.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Agency removal rights:',
            items: const [
              'Infinitum reserves the right to remove a creator at any time, at its sole discretion. This may include blocking access to participation where necessary.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Poaching & Outside Influence Section Builder
  Widget _buildTalentAgreementPoachingSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Poaching & outside influence',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            'Infinitum does not release creators early under pressure or solicitation from outside parties.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          const TalentAgreementBulletPoint(
            'Attempts by other agencies, managers, or third parties to recruit our creators during their agreement will not change the terms of withdrawal or cooldown.',
          ),
          const TalentAgreementBulletPoint(
            'Creators are expected to wait out the full withdrawal period and cooldown as agreed.',
          ),
          const TalentAgreementBulletPoint(
            'Any use of threats, defamatory statements, or hostile behavior to force early release is considered a violation of this agreement and will not accelerate removal.',
          ),
          const TalentAgreementBulletPoint(
            'Infinitum encourages respectful communication and remains available to provide support during the transition process, but all removals must follow the agreed timeline.',
          ),
        ],
      ),
    );
  }

  // MARK: - Settlement of Expenses Section Builder
  Widget _buildTalentAgreementSettlementSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settlement of expenses and proceeds',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            'Any agreements regarding expenses or distribution of proceeds between the creator and Infinitum must be handled outside of TikTok.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'TikTok is not a party to these arrangements and will not mediate related disputes.',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  // MARK: - Relationship Terms Section Builder
  Widget _buildTalentAgreementRelationshipSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Relationship terms',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Talent Agreement:',
            items: const [
              'Creators enrolled in the Diamond Incentive Program (D.I.P.) are subject to all program rules and performance standards.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Network acceptance:',
            items: const [
              'By accepting this invitation, creators agree to the Network Relationship Rules, which may be updated periodically.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'TikTok disclaimer:',
            items: const [
              'TikTok is not responsible for disputes between creators and agencies and will not intervene.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Information sharing:',
            items: const [
              'TikTok may share performance metrics, account profile details, LIVE data, and other relevant information with Infinitum for the purpose of network management.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Compensation:',
            items: const [
              'Infinitum does not provide direct payments.',
              'All creator compensation comes exclusively from TikTok LIVE gifts, governed by TikTok\'s Virtual Items Policy.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 20),
          Text(
            'Rules for network relationships',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const TalentAgreementBulletPoint(
            'Eligibility restrictions: Hosts cannot join if banned, underage, or already affiliated with another network.',
          ),
          const TalentAgreementBulletPoint(
            'Transfer of relationships: Transfers between contractors are subject to TikTok\'s rules and Infinitum\'s approval.',
          ),
          const TalentAgreementBulletPoint(
            'Ending a relationship: A 30-day notice period applies after the first 15 days of joining. Cooldown restrictions also apply.',
          ),
        ],
      ),
    );
  }

  // MARK: - D.I.P. Bonus Section Builder
  Widget _buildTalentAgreementDipSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum — Talent Agreement & D.I.P. bonus',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Creator bonus campaign months:',
            items: const [
              'Announced through official Infinitum channels (Discord, Email, and InfiniView).',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Eligibility:',
            items: const [
              'Creators must complete required valid streaming days and hours (for example 12 valid days and 25+ hours per month) and meet diamond thresholds announced for that campaign. Apply-time commitment on the public pre-check is at least 8 valid days and 20 hours; D.I.P. and campaign qualification can require more.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Proof of performance:',
            items: const [
              'Creators must provide screenshots or ranking proof where required.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Compensation:',
            items: const [
              'All earnings are received directly through TikTok LIVE gifts.',
              'Infinitum does not issue direct payments; TikTok is the sole distributor of funds.',
              'Creators are responsible for reporting and paying any applicable taxes.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Performance standards:',
            items: const [
              'Compliance with TikTok\'s Community Guidelines is mandatory. This includes restrictions on smoking, vaping, excessive cursing, or inappropriate content during streams.',
              'Creators must maintain quality broadcasts, avoiding static camera images or non-interactive displays.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Confidentiality Section Builder
  Widget _buildTalentAgreementConfidentialitySection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum — Confidentiality & non-disclosure',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Confidentiality obligation:',
            items: const [
              'All Infinitum-provided information, resources, materials, and internal communications are confidential.',
              'Unauthorized distribution, screenshots, recordings, or sharing of this information is prohibited.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Exceptions:',
            items: const [
              'Publicly available information, previously known knowledge, or independently developed resources are not considered confidential.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          TalentAgreementSubsection(
            title: 'Non-disparagement:',
            items: const [
              'Creators agree not to publish or communicate negative or defamatory statements about Infinitum, its creators, or affiliates.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  // MARK: - Non-Compete Section Builder
  Widget _buildTalentAgreementNonCompeteSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum — Non-compete agreement',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            'Creators agree not to engage in or provide competitive services similar to Infinitum for a period of five (5) years following termination of this agreement.',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  // MARK: - Final Acceptance Section Builder
  Widget _buildTalentAgreementFinalAcceptanceSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Final acceptance',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            'By accepting this invitation, you acknowledge and agree to the terms above, which govern your participation in the Infinitum TikTok LIVE Creator Network. These terms are designed to ensure fairness, protect the stability of the network, and provide creators with a clear and consistent structure throughout their membership.',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// MARK: - Agreement Item Widget
class TalentAgreementItem extends StatelessWidget {
  final String title;
  final String content;
  final TextTheme textTheme;

  const TalentAgreementItem({
    super.key,
    required this.title,
    required this.content,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// MARK: - Agreement Subsection Widget
class TalentAgreementSubsection extends StatelessWidget {
  final String title;
  final List<String> items;
  final TextTheme textTheme;

  const TalentAgreementSubsection({
    super.key,
    required this.title,
    required this.items,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
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
    );
  }
}

// MARK: - Bullet Point Widget
class TalentAgreementBulletPoint extends StatelessWidget {
  final String text;

  const TalentAgreementBulletPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
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

// Suggestions For Features and Additions Later:
// - Link to the live TikTok invitation copy when TikTok exposes a public URL
// - Track which agreement version a creator accepted inside InfiniView only
// - Translate this public summary after legal review
