/*
 * Filename: terms_acceptance_screen.dart
 * Purpose: Screen for users to accept Terms of Service and Privacy Policy on first launch
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, url_launcher, terms_acceptance_service.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/l10n/app_localizations.dart';
import 'package:infinitum_live_creator_network/services/terms_acceptance_service.dart';
import 'package:infinitum_live_creator_network/utils/url_launcher_util.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';

// MARK: - Terms Acceptance Screen
class TermsAcceptanceScreen extends StatefulWidget {
  final VoidCallback onTermsAccepted;

  const TermsAcceptanceScreen({
    super.key,
    required this.onTermsAccepted,
  });

  @override
  State<TermsAcceptanceScreen> createState() => _TermsAcceptanceScreenState();
}

class _TermsAcceptanceScreenState extends State<TermsAcceptanceScreen> {
  bool _termsAccepted = false;
  bool _privacyAccepted = false;
  bool _isLoading = false;

  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final canProceed = _termsAccepted && _privacyAccepted;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // Logo
              Center(
                child: Image.asset(
                  'assets/images/splash_logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const AppLogoWidget(
                      size: 200,
                      showShadow: true,
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              // Title
              Text(
                l10n.welcomeToInfinitum,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                l10n.termsAcceptanceDescription,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Terms of Service Checkbox
              _buildCheckboxTile(
                theme: theme,
                l10n: l10n,
                value: _termsAccepted,
                title: l10n.termsOfService,
                onChanged: (value) {
                  setState(() {
                    _termsAccepted = value ?? false;
                  });
                },
                onLinkTap: () => _openTermsOfService(context),
              ),
              const SizedBox(height: 16),
              // Privacy Policy Checkbox
              _buildCheckboxTile(
                theme: theme,
                l10n: l10n,
                value: _privacyAccepted,
                title: l10n.privacyPolicy,
                onChanged: (value) {
                  setState(() {
                    _privacyAccepted = value ?? false;
                  });
                },
                onLinkTap: () => _openPrivacyPolicy(context),
              ),
              const SizedBox(height: 40),
              // Accept Button
              ElevatedButton(
                onPressed: canProceed && !_isLoading ? _handleAccept : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        l10n.acceptAndContinue,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              // View Links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => _openTermsOfService(context),
                    child: Text(l10n.viewTermsOfService),
                  ),
                  Text(
                    ' • ',
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => _openPrivacyPolicy(context),
                    child: Text(l10n.viewPrivacyPolicy),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // MARK: - Checkbox Tile Widget
  Widget _buildCheckboxTile({
    required ThemeData theme,
    required AppLocalizations l10n,
    required bool value,
    required String title,
    required ValueChanged<bool?> onChanged,
    required VoidCallback onLinkTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Row(
          children: [
            Expanded(
              child: Text(
                l10n.iAgreeTo,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            TextButton(
              onPressed: onLinkTap,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }

  // MARK: - URL Opening Methods
  Future<void> _openTermsOfService(BuildContext context) async {
    try {
      const url = 'https://infinitumlive.com/terms/';
      final opened = await UrlLauncherUtil.launchUrl(
        url,
        context: context,
        title: AppLocalizations.of(context)!.termsOfService,
      );
      if (!opened && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.couldNotOpenUrl),
          ),
        );
      }
    } catch (e) {
      Logger.logError(
        'Error opening Terms of Service',
        error: e,
        tag: 'TermsAcceptanceScreen',
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.anErrorOccurred),
          ),
        );
      }
    }
  }

  Future<void> _openPrivacyPolicy(BuildContext context) async {
    try {
      const url = 'https://infinitumlive.com/privacy-policy/';
      final opened = await UrlLauncherUtil.launchUrl(
        url,
        context: context,
        title: AppLocalizations.of(context)!.privacyPolicy,
      );
      if (!opened && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.couldNotOpenUrl),
          ),
        );
      }
    } catch (e) {
      Logger.logError(
        'Error opening Privacy Policy',
        error: e,
        tag: 'TermsAcceptanceScreen',
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.anErrorOccurred),
          ),
        );
      }
    }
  }

  // MARK: - Accept Handler
  Future<void> _handleAccept() async {
    if (!_termsAccepted || !_privacyAccepted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await TermsAcceptanceService.acceptTerms();
      Logger.logInfo('Terms accepted by user', tag: 'TermsAcceptanceScreen');

      if (mounted) {
        widget.onTermsAccepted();
      }
    } catch (e) {
      Logger.logError(
        'Error accepting terms',
        error: e,
        tag: 'TermsAcceptanceScreen',
      );
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.anErrorOccurred),
          ),
        );
      }
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add scrollable terms preview within the app
// - Implement terms version display
// - Add "Read more" expandable sections
// - Create terms acceptance analytics
// - Add ability to decline terms (with explanation)
// - Implement terms acceptance reminder for updates

