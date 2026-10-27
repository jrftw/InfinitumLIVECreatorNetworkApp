/*
 * Filename: join_hub_screen.dart
 * Purpose: Public apply hub for creators who want to join Infinitum LIVE
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, app_config.dart, hub link card
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
import 'package:infinitum_live_creator_network/widgets/banner_ad_widget.dart';
import 'package:infinitum_live_creator_network/widgets/creator_network_hub_link_card.dart';

// MARK: - Join Hub Screen
class JoinHubScreen extends StatelessWidget {
  final Widget? settingsAction;
  final VoidCallback? onOpenInfiniView;

  const JoinHubScreen({
    super.key,
    this.settingsAction,
    this.onOpenInfiniView,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.joinTab),
        actions: [
          if (settingsAction != null) settingsAction!,
        ],
      ),
      body: ListView(
        physics: PlatformUtil.creatorNetworkScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            l10n.joinTheNetwork,
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.joinHubIntro,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          CreatorNetworkHubLinkCard(
            title: l10n.howToApply,
            subtitle: l10n.howToApplySubtitle,
            icon: Icons.how_to_reg,
            url: AppConfig.howToApplyUrl,
          ),
          const SizedBox(height: 12),
          CreatorNetworkHubLinkCard(
            title: l10n.applyTikTokLive,
            subtitle: l10n.applyTikTokLiveSubtitle,
            icon: Icons.videocam,
            url: AppConfig.creatorPreCheckUrl,
          ),
          const SizedBox(height: 12),
          CreatorNetworkHubLinkCard(
            title: l10n.applyTikTokShop,
            subtitle: l10n.applyTikTokShopSubtitle,
            icon: Icons.store,
            url: AppConfig.tiktokShopUrl,
          ),
          const SizedBox(height: 12),
          CreatorNetworkHubLinkCard(
            title: l10n.applyFavoritedLive,
            subtitle: l10n.applyFavoritedLiveSubtitle,
            icon: Icons.favorite,
            url: AppConfig.favoritedLiveApplyUrl,
          ),
          const SizedBox(height: 12),
          CreatorNetworkHubLinkCard(
            title: l10n.onboarding,
            subtitle: l10n.onboardingSubtitle,
            icon: Icons.dashboard,
            url: onOpenInfiniView == null ? AppConfig.viewAppUrl : null,
            onTap: onOpenInfiniView,
          ),
          const SizedBox(height: 12),
          CreatorNetworkHubLinkCard(
            title: l10n.website,
            subtitle: l10n.websiteSubtitle,
            icon: Icons.language,
            url: AppConfig.websiteUrl,
          ),
          const BannerAdContainer(
            margin: EdgeInsets.symmetric(vertical: 24),
          ),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add a short eligibility checklist before opening the LIVE pre-check form
// - Deep-link InfiniView guest apply only after a public unauthenticated path exists
