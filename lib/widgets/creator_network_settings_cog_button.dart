/*
 * Filename: creator_network_settings_cog_button.dart
 * Purpose: Shared top-right settings cog for theme, language, and ad tracking
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, language/theme/tracking services
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/l10n/generated/app_localizations.dart';
import 'package:infinitum_live_creator_network/services/language_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/theme_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/tracking_preferences_service.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
import 'package:infinitum_live_creator_network/utils/tracking_permission_util.dart';

// MARK: - Settings Cog
class CreatorNetworkSettingsCogButton extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final ValueChanged<Locale?>? onLocaleChanged;

  const CreatorNetworkSettingsCogButton({
    super.key,
    this.onThemeModeChanged,
    this.onLocaleChanged,
  });

  @override
  State<CreatorNetworkSettingsCogButton> createState() =>
      _CreatorNetworkSettingsCogButtonState();
}

class _CreatorNetworkSettingsCogButtonState
    extends State<CreatorNetworkSettingsCogButton> {
  // MARK: - Build
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMode currentThemeMode = ThemePreferencesService.themeMode;
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return PopupMenuButton<String>(
      icon: const Icon(Icons.settings),
      tooltip: l10n.settings,
      onSelected: (String value) {
        if (value.startsWith('theme_')) {
          final String modeString = value.replaceFirst('theme_', '');
          ThemeMode mode;
          switch (modeString) {
            case 'light':
              mode = ThemeMode.light;
              break;
            case 'dark':
              mode = ThemeMode.dark;
              break;
            case 'system':
            default:
              mode = ThemeMode.system;
              break;
          }
          widget.onThemeModeChanged?.call(mode);
          setState(() {});
          Logger.logInfo(
            'Theme mode set to $mode',
            tag: 'CreatorNetworkSettingsCogButton',
          );
        } else if (value == 'lang_selector') {
          _creatorNetworkSettingsShowLanguageSelector(context);
        } else if (value == 'toggle_tracking') {
          _creatorNetworkSettingsToggleAdTracking(context);
        }
      },
      itemBuilder: (BuildContext context) {
        final Locale? currentLocale = LanguagePreferencesService.locale;

        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            enabled: false,
            child: Text(
              l10n.themeMode,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            value: 'theme_system',
            child: Row(
              children: [
                const Icon(Icons.brightness_auto, size: 20),
                const SizedBox(width: 12),
                Text(l10n.auto),
                if (currentThemeMode == ThemeMode.system) const Spacer(),
                if (currentThemeMode == ThemeMode.system)
                  const Icon(Icons.check, size: 20),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'theme_light',
            child: Row(
              children: [
                const Icon(Icons.light_mode, size: 20),
                const SizedBox(width: 12),
                Text(l10n.light),
                if (currentThemeMode == ThemeMode.light) const Spacer(),
                if (currentThemeMode == ThemeMode.light)
                  const Icon(Icons.check, size: 20),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'theme_dark',
            child: Row(
              children: [
                const Icon(Icons.dark_mode, size: 20),
                const SizedBox(width: 12),
                Text(l10n.dark),
                if (currentThemeMode == ThemeMode.dark) const Spacer(),
                if (currentThemeMode == ThemeMode.dark)
                  const Icon(Icons.check, size: 20),
              ],
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            value: 'lang_selector',
            child: Row(
              children: [
                const Icon(Icons.language, size: 20),
                const SizedBox(width: 12),
                Expanded(child: Text(l10n.language)),
                const SizedBox(width: 8),
                Text(
                  _creatorNetworkSettingsLanguageDisplay(currentLocale, l10n),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ),
          if (PlatformUtil.isMobile) ...[
            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: 'toggle_tracking',
              child: Row(
                children: [
                  const Icon(Icons.ads_click, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(l10n.adTracking),
                        const SizedBox(height: 2),
                        Text(
                          l10n.adTrackingDescription,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Switch(
                    value:
                        TrackingPreferencesService.trackingEnabled ?? false,
                    onChanged: (bool value) {
                      _creatorNetworkSettingsToggleAdTracking(
                        context,
                        newValue: value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ];
      },
    );
  }

  // MARK: - Language
  String _creatorNetworkSettingsLanguageDisplay(
    Locale? locale,
    AppLocalizations l10n,
  ) {
    if (locale == null) {
      return l10n.auto;
    }
    final LanguageOption? option =
        LanguagePreferencesService.getLanguageOptionForLocale(locale);
    if (option != null) {
      return option.englishName;
    }
    return locale.languageCode.toUpperCase();
  }

  void _creatorNetworkSettingsShowLanguageSelector(BuildContext context) {
    final Locale? currentLocale = LanguagePreferencesService.locale;
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    final List<CreatorNetworkSettingsLanguageOption> allLanguages = [
      CreatorNetworkSettingsLanguageOption(
        locale: null,
        displayName: l10n.systemLanguage,
        englishName: l10n.auto,
      ),
      ...LanguagePreferencesService.commonLanguages.map(
        (LanguageOption lang) => CreatorNetworkSettingsLanguageOption(
          locale: lang.locale,
          displayName: lang.displayName,
          englishName: lang.englishName,
        ),
      ),
    ];

    int selectedIndex = 0;
    if (currentLocale != null) {
      for (int i = 0; i < allLanguages.length; i++) {
        final CreatorNetworkSettingsLanguageOption option = allLanguages[i];
        if (option.locale != null &&
            option.locale!.languageCode == currentLocale.languageCode &&
            (option.locale!.countryCode == null ||
                option.locale!.countryCode == currentLocale.countryCode)) {
          selectedIndex = i;
          break;
        }
      }
    }

    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Text(l10n.language),
              content: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonFormField<int>(
                  initialValue: selectedIndex,
                  decoration: InputDecoration(
                    labelText: l10n.language,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  items: allLanguages.asMap().entries.map(
                    (MapEntry<int, CreatorNetworkSettingsLanguageOption> entry) {
                      return DropdownMenuItem<int>(
                        value: entry.key,
                        child: Text(entry.value.displayName),
                      );
                    },
                  ).toList(),
                  onChanged: (int? newIndex) {
                    if (newIndex == null) {
                      return;
                    }
                    setDialogState(() {
                      selectedIndex = newIndex;
                    });
                    widget.onLocaleChanged?.call(allLanguages[newIndex].locale);
                    setState(() {});
                    Navigator.of(dialogContext).pop();
                    Logger.logInfo(
                      'Locale selected: ${allLanguages[newIndex].locale}',
                      tag: 'CreatorNetworkSettingsCogButton',
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: Text(l10n.close),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // MARK: - Ad Tracking
  Future<void> _creatorNetworkSettingsToggleAdTracking(
    BuildContext context, {
    bool? newValue,
  }) async {
    final bool currentValue =
        TrackingPreferencesService.trackingEnabled ?? false;
    final bool targetValue = newValue ?? !currentValue;

    await TrackingPreferencesService.setTrackingEnabled(targetValue);
    if (mounted) {
      setState(() {});
    }

    int? status;
    if (targetValue && PlatformUtil.isIOS) {
      status = await TrackingPermissionUtil.requestTrackingPermission();
      if (status != null) {
        if (status == 2) {
          await TrackingPreferencesService.setTrackingEnabled(false);
        } else if (status == 3) {
          await TrackingPreferencesService.setTrackingEnabled(true);
        }
        if (mounted) {
          setState(() {});
        }
      }
    }

    if (!mounted) {
      return;
    }

    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final bool enabledNow =
        TrackingPreferencesService.trackingEnabled ?? false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          enabledNow ? l10n.adTrackingEnabled : l10n.adTrackingDisabled,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: enabledNow
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
      ),
    );

    Logger.logInfo(
      'Ad tracking preference updated to: $targetValue (status=$status)',
      tag: 'CreatorNetworkSettingsCogButton',
    );
  }
}

// MARK: - Language Option
class CreatorNetworkSettingsLanguageOption {
  final Locale? locale;
  final String displayName;
  final String englishName;

  CreatorNetworkSettingsLanguageOption({
    required this.locale,
    required this.displayName,
    required this.englishName,
  });
}

// Suggestions For Features and Additions Later:
// - Move theme/language into a full Settings page if the menu grows
// - Persist last-opened settings section
