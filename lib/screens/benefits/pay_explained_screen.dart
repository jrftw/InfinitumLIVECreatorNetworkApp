/*
 * Filename: pay_explained_screen.dart
 * Purpose: Screen displaying detailed information about TikTok LIVE Creator Network Pay Model
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - Pay Explained Screen
class PayExplainedScreen extends StatelessWidget {
  const PayExplainedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Explained'),
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
                Row(
                  children: [
                    const Text('🎥', style: TextStyle(fontSize: 32)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'TikTok LIVE Creator Network Pay Model',
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Complete Earnings Flow & Compensation Structure',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Creator Earnings Flow Section
          _buildCreatorEarningsFlow(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Visual Earnings Flow Section
          _buildVisualEarningsFlow(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Detailed Earnings Breakdown Section
          _buildEarningsBreakdown(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Important Clarifications Section
          _buildImportantClarifications(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Network Earnings Source Section
          _buildNetworkEarningsSource(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Network Payout Factors Section
          _buildNetworkPayoutFactors(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Manager & Director Compensation Section
          _buildManagerCompensation(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Network Events & Campaigns Section
          _buildNetworkEvents(theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Key Point Section
          _buildKeyPoint(theme.textTheme),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }
  
  // MARK: - Creator Earnings Flow Builder
  Widget _buildCreatorEarningsFlow(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('💰', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Creator Earnings Flow',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _FlowStep(
            number: '1',
            title: 'Creator Goes LIVE',
            description: 'The creator broadcasts live on TikTok and interacts with their audience in real-time.',
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _FlowStep(
            number: '2',
            title: 'Earnings from Gifts & Subscriptions',
            description: 'Viewers send virtual gifts and subscriptions, which convert into TikTok Diamonds (the in-app currency).',
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _FlowStep(
            number: '3',
            title: 'TikTok\'s Scalable Rewards System',
            description: 'TikTok calculates the creator\'s total earnings and applies its scalable reward system based on valid LIVE hours, engagement, and performance metrics.',
            textTheme: textTheme,
          ),
          const SizedBox(height: 16),
          _FlowStep(
            number: '4',
            title: 'Creator Payout',
            description: 'The creator receives up to 53% of their total TikTok LIVE earnings (diamonds, gifts, subs, etc.). TikTok retains the remaining percentage as their platform fee.',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Visual Earnings Flow Builder
  Widget _buildVisualEarningsFlow(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📊', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Visual Earnings Flow',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _VisualFlowItem(
            icon: '👥',
            label: 'Viewers',
            description: 'Send Gifts & Subscriptions',
            textTheme: textTheme,
          ),
          const SizedBox(height: 12),
          Center(
            child: Icon(
              Icons.arrow_downward,
              color: textTheme.bodyMedium?.color?.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 12),
          _VisualFlowItem(
            icon: '🎥',
            label: 'Creator',
            description: 'Receives up to 53% of total earnings',
            textTheme: textTheme,
          ),
          const SizedBox(height: 12),
          Center(
            child: Icon(
              Icons.arrow_downward,
              color: textTheme.bodyMedium?.color?.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 12),
          _VisualFlowItem(
            icon: '🏢',
            label: 'TikTok',
            description: 'Retains ~47% as platform fee',
            textTheme: textTheme,
          ),
          const SizedBox(height: 12),
          Center(
            child: Icon(
              Icons.arrow_downward,
              color: textTheme.bodyMedium?.color?.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 12),
          _VisualFlowItem(
            icon: '🌐',
            label: 'Creator Network',
            description: 'Receives portion of TikTok\'s retained share',
            textTheme: textTheme,
          ),
          const SizedBox(height: 12),
          Center(
            child: Icon(
              Icons.arrow_downward,
              color: textTheme.bodyMedium?.color?.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 12),
          _VisualFlowItem(
            icon: '👨‍💼',
            label: 'Managers & Directors',
            description: 'Paid from network\'s share',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Earnings Breakdown Builder
  Widget _buildEarningsBreakdown(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📈', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Detailed Earnings Breakdown',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _EarningsTableRow(
            level: 'Creator',
            source: 'Gifts, subs, diamonds',
            payoutBasis: 'TikTok scalable rewards',
            range: 'Up to 53% of total LIVE value',
            textTheme: textTheme,
          ),
          const Divider(height: 24),
          _EarningsTableRow(
            level: 'TikTok',
            source: 'Retained share of creator revenue',
            payoutBasis: 'Platform operations',
            range: 'Remainder (~47%)',
            textTheme: textTheme,
          ),
          const Divider(height: 24),
          _EarningsTableRow(
            level: 'Creator Network',
            source: 'Portion of TikTok\'s retained share',
            payoutBasis: 'Valid hours, creator volume, engagement',
            range: 'Varies by network agreement',
            textTheme: textTheme,
          ),
          const Divider(height: 24),
          _EarningsTableRow(
            level: 'Managers / Directors',
            source: 'Network\'s portion',
            payoutBasis: 'Creator performance, metrics, valid activity',
            range: '% of network\'s payout',
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Important Clarifications Builder
  Widget _buildImportantClarifications(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🔍', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Important Clarifications',
                style: textTheme.headlineSmall,
              ),
            ],
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
                Row(
                  children: [
                    const Text('✅', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Creator Network Does NOT Take a Cut',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'The Creator Network does not take a cut or percentage anywhere. Creators always keep their full up to 53% from TikTok. All payouts are handled directly by TikTok.',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // MARK: - Network Earnings Source Builder
  Widget _buildNetworkEarningsSource(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('💰', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Network Earnings Source',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'After TikTok pays the creator their portion, the creator network receives a separate payout from TikTok based on TikTok\'s retained share (the part TikTok keeps after paying creators).',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Network Payout Factors Builder
  Widget _buildNetworkPayoutFactors(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📊', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Network Payout Factors',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'The network\'s percentage depends on:',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          _BulletPoint('Valid LIVE hours and streaming days'),
          _BulletPoint('Overall performance of managed creators'),
          _BulletPoint('Retention and compliance with TikTok policies'),
          _BulletPoint('Network-wide engagement metrics'),
        ],
      ),
    );
  }
  
  // MARK: - Manager Compensation Builder
  Widget _buildManagerCompensation(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('👨‍💼', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Manager & Director Compensation',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Managers and directors are paid from the network\'s share, not directly from the creators. Each manager or director earns a percentage of the network\'s total payout, determined by the performance and activity of their assigned creators.',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Network Events Builder
  Widget _buildNetworkEvents(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🎉', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                'Network Events & Campaigns',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'The creator network hosts events and campaigns where creators can earn diamonds paid out by the Creator network. The creator network will never charge creators.',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
  
  // MARK: - Key Point Builder
  Widget _buildKeyPoint(TextTheme textTheme) {
    return GlassCardWidget(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: textTheme.bodyMedium?.color?.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: textTheme.bodyMedium?.color?.withOpacity(0.2) ?? Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('⚠️', style: TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Key Point',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Creator Network Does not take a cut or % anywhere. Creator always keeps their up to 53% from TikTok, payouts are all handled by TikTok',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: - Flow Step Widget
class _FlowStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final TextTheme textTheme;
  
  const _FlowStep({
    required this.number,
    required this.title,
    required this.description,
    required this.textTheme,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: textTheme.bodyMedium?.color?.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// MARK: - Visual Flow Item Widget
class _VisualFlowItem extends StatelessWidget {
  final String icon;
  final String label;
  final String description;
  final TextTheme textTheme;
  
  const _VisualFlowItem({
    required this.icon,
    required this.label,
    required this.description,
    required this.textTheme,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: textTheme.bodyMedium?.color?.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: textTheme.bodyMedium?.color?.withOpacity(0.1) ?? Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// MARK: - Earnings Table Row Widget
class _EarningsTableRow extends StatelessWidget {
  final String level;
  final String source;
  final String payoutBasis;
  final String range;
  final TextTheme textTheme;
  
  const _EarningsTableRow({
    required this.level,
    required this.source,
    required this.payoutBasis,
    required this.range,
    required this.textTheme,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          level,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _TableField(
          label: 'Source of Earnings:',
          value: source,
          textTheme: textTheme,
        ),
        const SizedBox(height: 6),
        _TableField(
          label: 'Payout Basis:',
          value: payoutBasis,
          textTheme: textTheme,
        ),
        const SizedBox(height: 6),
        _TableField(
          label: 'Approximate Range:',
          value: range,
          textTheme: textTheme,
        ),
      ],
    );
  }
}

// MARK: - Table Field Widget
class _TableField extends StatelessWidget {
  final String label;
  final String value;
  final TextTheme textTheme;
  
  const _TableField({
    required this.label,
    required this.value,
    required this.textTheme,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
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
// - Add interactive earnings calculator
// - Implement visual charts/graphs for earnings breakdown
// - Add comparison tool between different payout scenarios
// - Create FAQ section for common payment questions
// - Add print/export pay model information
// - Implement earnings estimator based on hours/engagement
// - Add historical payout data visualization

