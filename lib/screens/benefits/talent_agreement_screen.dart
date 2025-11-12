/*
 * Filename: talent_agreement_screen.dart
 * Purpose: Screen displaying the Infinitum Talent Agreement details
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:infinitum_live_creator_network/l10n/app_localizations.dart';

// MARK: - Talent Agreement Screen
class TalentAgreementScreen extends StatelessWidget {
  const TalentAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
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
                  'Infinitum Talent Agreement – For TikTok LIVE',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Infinitum – Invitation Terms and Agreements',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  '(United States, Canada, United Kingdom & Australia)',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Invitation Term Section
          _buildInvitationTermSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Withdrawal & Removal Policy Section
          _buildWithdrawalRemovalSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Poaching & Outside Influence Section
          _buildPoachingSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Settlement of Expenses Section
          _buildSettlementSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Relationship Terms Section
          _buildRelationshipTermsSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - D.I.P. Bonus Section
          _buildDIPBonusSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Confidentiality Section
          _buildConfidentialitySection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Non-Compete Section
          _buildNonCompeteSection(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Final Acceptance Section
          _buildFinalAcceptanceSection(theme.textTheme),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }
  
  // MARK: - Invitation Term Section Builder
  Widget _buildInvitationTermSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invitation Term',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          _AgreementItem(
            title: 'Duration:',
            content: 'Membership is valid for three (3) years from the date of acceptance.',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Withdrawal & Removal Policy Section Builder
  Widget _buildWithdrawalRemovalSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Withdrawal & Removal Policy',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'First 15 Days:',
            items: [
              'Creators may request removal at any time during the first 15 days of joining.',
              'Requests submitted within this period will be processed promptly with no restrictions.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'After 15 Days:',
            items: [
              'Following the initial 15 days, creators may request removal by providing a 30-day notice period.',
              'A 60-day cooldown period will apply before the creator is eligible to join another agency network.',
              'Infinitum is not obligated to approve an early release beyond these agreed terms.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Diamond Threshold Restriction:',
            items: [
              'Creators who have earned 200,000+ Diamonds within the past six months are ineligible to transfer to another network under TikTok\'s Creator Network onboarding guidelines.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: '90-Day Completion Requirement:',
            items: [
              'Our network operates under a structured withdrawal process designed to protect both creators and the community. This includes a 30-day notice period followed by a 60-day cooldown period, totaling 90 days.',
              'This process cannot be shortened or waived, even in cases of solicitation from another party. Creators are expected to complete the full 90-day requirement as outlined.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Agency Removal Rights:',
            items: [
              'Infinitum reserves the right to remove a creator at any time, at its sole discretion. This may include blocking access to participation where necessary.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Poaching & Outside Influence Section Builder
  Widget _buildPoachingSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Poaching & Outside Influence',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            'Infinitum does not release creators early under pressure or solicitation from outside parties.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          _BulletPoint('Attempts by other agencies, managers, or third parties to recruit our creators during their agreement will not change the terms of withdrawal or cooldown.'),
          _BulletPoint('Creators are expected to wait out the full withdrawal period and cooldown as agreed.'),
          _BulletPoint('Any use of threats, defamatory statements, or hostile behavior to force early release is considered a violation of this agreement and will not accelerate removal.'),
          _BulletPoint('Infinitum encourages respectful communication and remains available to provide support during the transition process, but all removals must follow the agreed timeline.'),
        ],
      ),
    );
  }
  
  // MARK: - Settlement of Expenses Section Builder
  Widget _buildSettlementSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settlement of Expenses and Proceeds',
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
  Widget _buildRelationshipTermsSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Relationship Terms',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Talent Agreement:',
            items: [
              'Creators enrolled in the Diamond Incentive Program (D.I.P.) are subject to all program rules and performance standards.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Network Acceptance:',
            items: [
              'By accepting this invitation, creators agree to the Network Relationship Rules, which may be updated periodically.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'TikTok Disclaimer:',
            items: [
              'TikTok is not responsible for disputes between creators and agencies and will not intervene.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Information Sharing:',
            items: [
              'TikTok may share performance metrics, account profile details, LIVE data, and other relevant information with Infinitum for the purpose of network management.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Compensation:',
            items: [
              'Infinitum does not provide direct payments.',
              'All creator compensation comes exclusively from TikTok LIVE gifts, governed by TikTok\'s Virtual Items Policy.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 20),
          Text(
            'Rules for Network Relationships',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _BulletPoint('Eligibility Restrictions: Hosts cannot join if banned, underage, or already affiliated with another network.'),
          _BulletPoint('Transfer of Relationships: Transfers between contractors are subject to TikTok\'s rules and Infinitum\'s approval.'),
          _BulletPoint('Ending a Relationship: A 30-day notice period applies after the first 15 days of joining. Cooldown restrictions also apply.'),
        ],
      ),
    );
  }
  
  // MARK: - D.I.P. Bonus Section Builder
  Widget _buildDIPBonusSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum – Talent Agreement & D.I.P. Bonus',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Creator Bonus Campaign Months:',
            items: [
              'Announced through official Infinitum channels (Discord, Email).',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Eligibility:',
            items: [
              'Creators must complete required valid streaming days and hours (e.g., 12 valid days, 25+ hours per month) and meet diamond thresholds.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Proof of Performance:',
            items: [
              'Creators must provide screenshots or ranking proof where required.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Compensation:',
            items: [
              'All earnings are received directly through TikTok LIVE gifts.',
              'Infinitum does not issue direct payments; TikTok is the sole distributor of funds.',
              'Creators are responsible for reporting and paying any applicable taxes.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Performance Standards:',
            items: [
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
  Widget _buildConfidentialitySection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum – Confidentiality & Non-Disclosure',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Confidentiality Obligation:',
            items: [
              'All Infinitum-provided information, resources, materials, and internal communications are confidential.',
              'Unauthorized distribution, screenshots, recordings, or sharing of this information is prohibited.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Exceptions:',
            items: [
              'Publicly available information, previously known knowledge, or independently developed resources are not considered confidential.',
            ],
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _AgreementSubsection(
            title: 'Non-Disparagement:',
            items: [
              'Creators agree not to publish or communicate negative or defamatory statements about Infinitum, its creators, or affiliates.',
            ],
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Non-Compete Section Builder
  Widget _buildNonCompeteSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Infinitum – Non-Compete Agreement',
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
  Widget _buildFinalAcceptanceSection(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Final Acceptance',
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
class _AgreementItem extends StatelessWidget {
  final String title;
  final String content;
  final TextTheme textTheme;
  
  const _AgreementItem({
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
class _AgreementSubsection extends StatelessWidget {
  final String title;
  final List<String> items;
  final TextTheme textTheme;
  
  const _AgreementSubsection({
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
// - Add agreement acceptance checkbox functionality
// - Implement agreement version tracking
// - Add print/export agreement feature
// - Create agreement signature capture
// - Add agreement history/change log
// - Implement search functionality within agreement
// - Add bookmark feature for important sections

