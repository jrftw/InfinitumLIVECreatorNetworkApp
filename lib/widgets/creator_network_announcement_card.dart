/*
 * Filename: creator_network_announcement_card.dart
 * Purpose: Shared public announcement card used on Home snapshot and Network feed
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, intl, announcement_model.dart, glass_card_widget.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/models/announcement_model.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:intl/intl.dart';

// MARK: - Announcement Card
class CreatorNetworkAnnouncementCard extends StatelessWidget {
  final AnnouncementModel announcement;
  final int contentMaxLines;
  final VoidCallback? onTapOverride;

  const CreatorNetworkAnnouncementCard({
    super.key,
    required this.announcement,
    this.contentMaxLines = 5,
    this.onTapOverride,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return RepaintBoundary(
      child: GlassCardWidget(
        onTap: onTapOverride ??
            (announcement.link != null
                ? () => _creatorNetworkAnnouncementCardOpenLink(context)
                : null),
        padding: const EdgeInsets.all(16),
        backgroundColor: announcement.isImportant
            ? theme.colorScheme.primary.withValues(alpha: 0.15)
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (announcement.isImportant)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      l10n.important,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (announcement.isImportant) const SizedBox(width: 8),
                if (announcement.date != null)
                  Text(
                    _creatorNetworkAnnouncementCardFormatDate(
                      l10n,
                      announcement.date!,
                    ),
                    style: theme.textTheme.bodySmall,
                  ),
                const Spacer(),
                if (announcement.link != null)
                  Icon(
                    Icons.open_in_new,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              announcement.title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              announcement.content,
              style: theme.textTheme.bodyMedium,
              maxLines: contentMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _creatorNetworkAnnouncementCardOpenLink(BuildContext context) {
    final String? link = announcement.link;
    if (link == null) {
      return;
    }
    Logger.logInfo(
      'Opening announcement link: $link',
      tag: 'CreatorNetworkAnnouncementCard',
    );
    UrlLauncherUtil.launchUrl(
      link,
      context: context,
      title: announcement.title,
    );
  }
}

// MARK: - Date Formatting
String _creatorNetworkAnnouncementCardFormatDate(
  AppLocalizations l10n,
  DateTime date,
) {
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(date);

  if (difference.inDays == 0) {
    return l10n.today;
  }
  if (difference.inDays == 1) {
    return l10n.yesterday;
  }
  if (difference.inDays < 7) {
    return l10n.daysAgo(difference.inDays);
  }
  return DateFormat(l10n.mmmDYyyy).format(date);
}

// Suggestions For Features and Additions Later:
// - Expand to a full-screen announcement detail route
// - Show InfiniCore imageUrl when native posts include artwork
