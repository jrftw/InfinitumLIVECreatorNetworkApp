/*
 * Filename: about_screen.dart
 * Purpose: Screen displaying company information and details
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, app_config.dart, url_launcher
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/core/version_manager.dart';
import 'package:infinitum_live_creator_network/services/theme_preferences_service.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';
import 'package:infinitum_live_creator_network/screens/benefits/what_we_do_screen.dart';
import 'package:infinitum_live_creator_network/screens/benefits/what_is_your_role_screen.dart';
import 'package:infinitum_live_creator_network/screens/benefits/what_we_do_not_do_screen.dart';
import 'package:infinitum_live_creator_network/screens/benefits/talent_agreement_screen.dart';
import 'package:infinitum_live_creator_network/screens/benefits/requirements_screen.dart';
import 'package:infinitum_live_creator_network/screens/benefits/pay_explained_screen.dart';
import 'package:infinitum_live_creator_network/l10n/app_localizations.dart';
import 'package:infinitum_live_creator_network/services/language_preferences_service.dart';
import 'package:infinitum_live_creator_network/services/tracking_preferences_service.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';
import 'package:infinitum_live_creator_network/utils/tracking_permission_util.dart';

// MARK: - About Screen
class AboutScreen extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final ValueChanged<Locale?>? onLocaleChanged;
  
  const AboutScreen({super.key, this.onThemeModeChanged, this.onLocaleChanged});
  
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  
  @override
  void initState() {
    super.initState();
    // Initialize tracking preferences service if not already initialized
    TrackingPreferencesService.initialize();
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentThemeMode = ThemePreferencesService.themeMode;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about),
        actions: [
          // Settings menu with language and theme options
          PopupMenuButton<String>(
            icon: const Icon(Icons.settings),
            tooltip: AppLocalizations.of(context)!.settings,
            onSelected: (String value) {
              // Handle selection
              if (value.startsWith('theme_')) {
                final modeString = value.replaceFirst('theme_', '');
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
              } else if (value == 'lang_selector') {
                // Show language selector dialog
                _showLanguageSelector(context);
              } else if (value == 'toggle_tracking') {
                // Toggle ad tracking
                _toggleAdTracking(context);
              }
            },
            itemBuilder: (BuildContext context) {
              final currentLocale = LanguagePreferencesService.locale;
              final l10n = AppLocalizations.of(context)!;
              
              return <PopupMenuEntry<String>>[
                // Theme section header (moved to top)
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
                // Theme options
                PopupMenuItem<String>(
                  value: 'theme_system',
                  child: Row(
                    children: [
                      const Icon(Icons.brightness_auto, size: 20),
                      const SizedBox(width: 12),
                      Text(l10n.auto),
                      if (currentThemeMode == ThemeMode.system)
                        const Spacer(),
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
                      if (currentThemeMode == ThemeMode.light)
                        const Spacer(),
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
                      if (currentThemeMode == ThemeMode.dark)
                        const Spacer(),
                      if (currentThemeMode == ThemeMode.dark)
                        const Icon(Icons.check, size: 20),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                // Language selector (opens dialog)
                PopupMenuItem<String>(
                  value: 'lang_selector',
                  child: Row(
                    children: [
                      const Icon(Icons.language, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(l10n.language),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _getCurrentLanguageDisplay(currentLocale, l10n),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
                // Ad Tracking toggle (only on mobile platforms)
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
                          value: TrackingPreferencesService.trackingEnabled ?? false,
                          onChanged: (value) {
                            _toggleAdTracking(context, newValue: value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ];
            },
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          // MARK: - Company Header
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                children: [
                  const AppLogoWidget(
                    size: 120,
                    showShadow: true,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppConfig.companyDBA,
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppConfig.companyName,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - About Section
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.aboutInfinitum,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.yourPremierDestination,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.aboutInfinitumDescription(AppConfig.founderHandle),
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.aboutInfinitumDescription2,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.aboutInfinitumDescription3(AppConfig.platformPartners.join(', ')),
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.aboutInfinitumDescription4(AppConfig.location),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Benefits Section
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.benefits,
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                _BenefitsCard(
                  icon: Icons.info_outline,
                  title: AppLocalizations.of(context)!.whatWeDo,
                  description: AppLocalizations.of(context)!.whatWeDoDescription,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WhatWeDoScreen(),
                      ),
                    );
                    Logger.logInfo('Navigated to What We Do screen', tag: 'AboutScreen');
                  },
                  theme: theme.textTheme,
                ),
                const SizedBox(height: 12),
                _BenefitsCard(
                  icon: Icons.person_outline,
                  title: AppLocalizations.of(context)!.whatIsYourRole,
                  description: AppLocalizations.of(context)!.whatIsYourRoleDescription,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WhatIsYourRoleScreen(),
                      ),
                    );
                    Logger.logInfo('Navigated to What Is Your Role screen', tag: 'AboutScreen');
                  },
                  theme: theme.textTheme,
                ),
                const SizedBox(height: 12),
                _BenefitsCard(
                  icon: Icons.block,
                  title: AppLocalizations.of(context)!.whatWeDoNotDo,
                  description: AppLocalizations.of(context)!.whatWeDoNotDoDescription,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WhatWeDoNotDoScreen(),
                      ),
                    );
                    Logger.logInfo('Navigated to What We Do Not Do screen', tag: 'AboutScreen');
                  },
                  theme: theme.textTheme,
                ),
                const SizedBox(height: 12),
                _BenefitsCard(
                  icon: Icons.description_outlined,
                  title: AppLocalizations.of(context)!.talentAgreement,
                  description: AppLocalizations.of(context)!.talentAgreementDescription,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TalentAgreementScreen(),
                      ),
                    );
                    Logger.logInfo('Navigated to Talent Agreement screen', tag: 'AboutScreen');
                  },
                  theme: theme.textTheme,
                ),
                const SizedBox(height: 12),
                _BenefitsCard(
                  icon: Icons.checklist_outlined,
                  title: AppLocalizations.of(context)!.requirements,
                  description: AppLocalizations.of(context)!.requirementsDescription,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RequirementsScreen(),
                      ),
                    );
                    Logger.logInfo('Navigated to Requirements screen', tag: 'AboutScreen');
                  },
                  theme: theme.textTheme,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Pay Explained Section
          _PayExplainedCard(theme: theme.textTheme),
          
          const SizedBox(height: 16),
          
          // MARK: - Service Regions
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.serviceRegions,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  ...AppConfig.serviceRegions.map((region) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(region, style: theme.textTheme.bodyMedium),
                      ],
                    ),
                  )),
                ],
              ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Contact Information
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.contactInformation,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _ContactItem(
                    icon: Icons.email,
                    label: AppLocalizations.of(context)!.supportEmailLabel,
                    value: AppConfig.supportEmail,
                    onTap: () => _launchEmail(context, AppConfig.supportEmail),
                  ),
                  const Divider(),
                  _ContactItem(
                    icon: Icons.account_circle,
                    label: AppLocalizations.of(context)!.officialAccountLabel,
                    value: AppConfig.officialAccount,
                  ),
                  const Divider(),
                  _ContactItem(
                    icon: Icons.access_time,
                    label: AppLocalizations.of(context)!.businessHoursLabel,
                    value: AppConfig.businessHours,
                  ),
                ],
              ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Quick Links
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.quickLinks,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _LinkItem(
                    icon: Icons.language,
                    label: AppLocalizations.of(context)!.website,
                    url: AppConfig.websiteUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.person_add,
                    label: AppLocalizations.of(context)!.onboarding,
                    url: AppConfig.onboardingUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.dashboard,
                    label: AppLocalizations.of(context)!.creatorDashboard,
                    url: AppConfig.viewAppUrl,
                  ),
                ],
              ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Legal & Privacy
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.legalPrivacy,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _LinkItem(
                    icon: Icons.privacy_tip,
                    label: AppLocalizations.of(context)!.privacyPolicy,
                    url: AppConfig.privacyPolicyUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.description,
                    label: AppLocalizations.of(context)!.termsOfService,
                    url: AppConfig.termsOfServiceUrl,
                  ),
                  const Divider(),
                  _LinkItem(
                    icon: Icons.cookie,
                    label: AppLocalizations.of(context)!.cookiePolicy,
                    url: AppConfig.cookiePolicyUrl,
                  ),
                ],
              ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - Third-Party Acknowledgments
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.thirdPartyAcknowledgments,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.tiktokPartnership,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.tiktokPartnershipDescription,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.tiktokTrademark,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
          ),
          
          const SizedBox(height: 16),
          
          // MARK: - App Information
          GlassCardWidget(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.appInformation,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  _InfoRow(
                    label: AppLocalizations.of(context)!.version,
                    value: VersionManager.getDisplayVersion(),
                  ),
                  const Divider(),
                  _InfoRow(
                    label: AppLocalizations.of(context)!.themeModeLabel,
                    value: ThemePreferencesService.getThemeModeLabel(currentThemeMode),
                  ),
                  const Divider(),
                  _InfoRow(
                    label: AppLocalizations.of(context)!.company,
                    value: AppConfig.companyName,
                  ),
                  const Divider(),
                  _InfoRow(
                    label: AppLocalizations.of(context)!.founded,
                    value: AppConfig.foundedDate,
                  ),
                ],
              ),
          ),
          
          const SizedBox(height: 24),
          
          // MARK: - Footer
          Center(
            child: Text(
              '© ${DateTime.now().year} ${AppConfig.companyName}',
              style: theme.textTheme.bodySmall,
            ),
          ),
          
          const SizedBox(height: 16),
        ],
      ),
    );
  }
  
  String _getCurrentLanguageDisplay(Locale? locale, AppLocalizations l10n) {
    if (locale == null) {
      return l10n.auto;
    }
    final option = LanguagePreferencesService.getLanguageOptionForLocale(locale);
    if (option != null) {
      return option.englishName;
    }
    return locale.languageCode.toUpperCase();
  }
  
  void _showLanguageSelector(BuildContext context) {
    final currentLocale = LanguagePreferencesService.locale;
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    // Create list of all language options including "Auto"
    final allLanguages = [
      _LanguageSelectorOption(
        locale: null,
        displayName: l10n.systemLanguage,
        englishName: l10n.auto,
      ),
      ...LanguagePreferencesService.commonLanguages.map((lang) => 
        _LanguageSelectorOption(
          locale: lang.locale,
          displayName: lang.displayName,
          englishName: lang.englishName,
        ),
      ),
    ];
    
    // Find current selection index
    int selectedIndex = 0;
    if (currentLocale != null) {
      for (int i = 0; i < allLanguages.length; i++) {
        final option = allLanguages[i];
        if (option.locale != null &&
            option.locale!.languageCode == currentLocale.languageCode &&
            (option.locale!.countryCode == null ||
                option.locale!.countryCode == currentLocale.countryCode)) {
          selectedIndex = i;
          break;
        }
      }
    }
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Text(l10n.language),
              content: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonFormField<int>(
                  value: selectedIndex,
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
                  items: allLanguages.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    return DropdownMenuItem<int>(
                      value: index,
                      child: Text(option.displayName),
                    );
                  }).toList(),
                  onChanged: (int? newIndex) {
                    if (newIndex != null) {
                      setDialogState(() {
                        selectedIndex = newIndex;
                      });
                      
                      final selectedOption = allLanguages[newIndex];
                      Locale? newLocale = selectedOption.locale;
                      
                      widget.onLocaleChanged?.call(newLocale);
                      setState(() {});
                      
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n.close),
                ),
              ],
            );
          },
        );
      },
    );
  }
  
  // MARK: - Ad Tracking Toggle
  void _toggleAdTracking(BuildContext context, {bool? newValue}) async {
    final currentValue = TrackingPreferencesService.trackingEnabled ?? false;
    final targetValue = newValue ?? !currentValue;
    
    // Update the preference
    await TrackingPreferencesService.setTrackingEnabled(targetValue);
    
    // Update UI
    setState(() {});
    
    // On iOS, if enabling tracking, request permission immediately
    if (targetValue && PlatformUtil.isIOS) {
      // Request tracking permission
      final status = await TrackingPermissionUtil.requestTrackingPermission();
      
      // Update preference based on permission result
      if (status != null) {
        // Status: 0=notDetermined, 1=restricted, 2=denied, 3=authorized
        if (status == 2) {
          // User denied, update preference to false
          await TrackingPreferencesService.setTrackingEnabled(false);
          setState(() {});
        } else if (status == 3) {
          // User authorized, keep preference as true
          await TrackingPreferencesService.setTrackingEnabled(true);
          setState(() {});
        }
      }
      
      // Show info message
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              status == 3 ? l10n.adTrackingEnabled : l10n.adTrackingDisabled,
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: status == 3 
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
        );
      }
    } else if (!targetValue) {
      // Show info that tracking is disabled
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.adTrackingDisabled,
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
      }
    }
    
    Logger.logInfo(
      'Ad tracking preference updated to: $targetValue',
      tag: 'AboutScreen',
    );
  }
  
  void _launchEmail(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.contactEmail),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.emailAddress),
            const SizedBox(height: 8),
            SelectableText(
              email,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.pleaseUseEmailClient,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
      ),
    );
    Logger.logInfo('Showed email info: $email', tag: 'AboutScreen');
  }
}

// MARK: - Contact Item Widget
class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: onTap != null
                          ? theme.colorScheme.primary
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}

// MARK: - Link Item Widget
class _LinkItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  
  const _LinkItem({
    required this.icon,
    required this.label,
    required this.url,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: () => _openLink(context, url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
  
  void _openLink(BuildContext context, String url) {
    Logger.logInfo('Opening link: $url', tag: 'AboutScreen');
    UrlLauncherUtil.launchUrl(
      url,
      context: context,
      title: label,
    );
  }
}

// MARK: - Info Row Widget
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  
  const _InfoRow({
    required this.label,
    required this.value,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// MARK: - Pay Explained Card Widget
class _PayExplainedCard extends StatefulWidget {
  final TextTheme theme;
  
  const _PayExplainedCard({
    required this.theme,
  });
  
  @override
  State<_PayExplainedCard> createState() => _PayExplainedCardState();
}

class _PayExplainedCardState extends State<_PayExplainedCard> {
  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PayExplainedScreen(),
                ),
              );
              Logger.logInfo('Navigated to Pay Explained screen', tag: 'AboutScreen');
            },
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.payments_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.payExplained,
                          style: widget.theme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLocalizations.of(context)!.payExplainedDescription,
                          style: widget.theme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: widget.theme.bodyMedium?.color?.withOpacity(0.5),
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

// MARK: - Language Selector Option Helper
class _LanguageSelectorOption {
  final Locale? locale;
  final String displayName;
  final String englishName;
  
  _LanguageSelectorOption({
    required this.locale,
    required this.displayName,
    required this.englishName,
  });
}

// MARK: - Benefits Card Widget
class _BenefitsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final TextTheme theme;
  
  const _BenefitsCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.theme,
  });
  
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.bodyMedium?.color?.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.bodyMedium?.color?.withOpacity(0.1) ?? Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: colorScheme.primary,
                size: 24,
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
                    style: theme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: theme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: theme.bodyMedium?.color?.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add team member profiles
// - Implement company timeline/history
// - Add testimonials section
// - Create FAQ section
// - Add social media links
// - Implement newsletter signup
// - Add press kit and media resources
// - Create accessibility information

