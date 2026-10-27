/*
 * Filename: creator_network_hub_link_card.dart
 * Purpose: Shared glass link card for hub destinations, tools, and apply paths
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, glass_card_widget.dart, logger.dart, url_launcher_util.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - Hub Link Card
class CreatorNetworkHubLinkCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? url;
  final VoidCallback? onTap;

  const CreatorNetworkHubLinkCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.url,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return RepaintBoundary(
      child: GlassCardWidget(
        onTap: () => creatorNetworkHubOpenLink(
          context: context,
          title: title,
          url: url,
          onTap: onTap,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.22),
                    theme.colorScheme.secondary.withValues(alpha: 0.16),
                  ],
                ),
                borderRadius: BorderRadius.circular(
                  PlatformUtil.isAndroid ? 16 : 14,
                ),
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              PlatformUtil.isIOS
                  ? CupertinoIcons.chevron_forward
                  : PlatformUtil.isWeb
                      ? Icons.north_east
                      : Icons.arrow_forward,
              size: PlatformUtil.isIOS ? 18 : 20,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: - Open Link Helper
Future<void> creatorNetworkHubOpenLink({
  required BuildContext context,
  required String title,
  String? url,
  VoidCallback? onTap,
}) async {
  if (onTap != null) {
    Logger.logInfo('Hub card action: $title', tag: 'CreatorNetworkHubLinkCard');
    onTap();
    return;
  }

  if (url == null || url.isEmpty) {
    Logger.logError('Hub card missing URL: $title', tag: 'CreatorNetworkHubLinkCard');
    return;
  }

  Logger.logInfo('Opening hub URL: $url', tag: 'CreatorNetworkHubLinkCard');
  final bool launched = await UrlLauncherUtil.launchUrl(
    url,
    context: context,
    title: title,
  );
  if (!launched && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.couldNotOpen(title)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add optional badge text for seasonal apply programs
// - Support a compact density for dense tool lists
