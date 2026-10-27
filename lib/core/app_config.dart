/*
 * Filename: app_config.dart
 * Purpose: Centralized application configuration for the public Creator Network hub
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/foundation.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart';

// MARK: - Application Configuration
class AppConfig {
  // MARK: App Information
  static const String appName = 'Infinitum LIVE Creator Network';
  static const String appVersion = '1.0.1';
  static const String appBuildNumber = '1';
  static const String companyName = 'Infinitum Imagery LLC';
  static const String companyDBA = 'Infinitum LIVE Creator Network';

  // MARK: Live Public APIs
  /// InfiniCore network-wide announcements (unauthenticated).
  static const String infinicorePublicAnnouncementsUrl =
      'https://us-central1-infiniviewv3.cloudfunctions.net/InfiniCoreAPI/public/announcements';

  /// InfiniView marketing network stats (unauthenticated).
  static const String infiniviewPublicNetworkStatsUrl =
      'https://us-central1-infiniviewv3.cloudfunctions.net/api/public/network-stats';

  /// Last-resort GitHub announcements JSON if InfiniCore is unreachable.
  static const String githubLegacyAnnouncementsUrl =
      'https://raw.githubusercontent.com/jrftw/InfiniView-Announcements/main/Announcements.json';

  // MARK: External Links
  static const String websiteUrl = 'https://infinitumlive.com/';
  static const String viewAppUrl = 'https://view.infinitumlive.com/';
  /// Onboarding now lives inside InfiniView (web or the InfiniView app).
  static const String onboardingUrl = 'https://view.infinitumlive.com/';
  static const String infiniviewAppStoreUrl =
      'https://apps.apple.com/us/app/infiniview-by-infinitum-live/id6739147518';
  static const String infiniviewPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.InfiniumImageryLLC.InfiniView';
  static const String supportEmail = 'support@infinitumlive.com';
  static const String officialAccount = '@infinitumcreatornetwork';
  static const String statusPageUrl = 'https://infinitum-down-detector.web.app/';

  // MARK: Tools & Services Links
  static const String merchUrl = 'https://infinitumlive.com/apparel/';
  static const String estimateEarningsUrl =
      'https://iview.infinitumlive.com/tiktok-live-diamonds-earning-calculator/';
  static const String shadowBanCheckerUrl =
      'https://infinitumlive.com/shadow-ban-checker/';

  // MARK: Application Links
  static const String howToApplyUrl = 'https://infinitumlive.com/how-to-apply/';
  static const String creatorPreCheckUrl =
      'https://infinitumlive.com/creator-pre-check/';
  static const String tiktokShopUrl = 'https://infinitumlive.com/tiktok-shop/';
  static const String favoritedLiveApplyUrl =
      'https://infinitumlive.com/apply-as-favorited-live-creator/';

  // MARK: Community Links
  static const String discordCommunityUrl = 'https://discord.gg/tMCg9WqDT9';

  // MARK: Legal & Compliance Links
  static const String privacyPolicyUrl =
      'https://infinitumlive.com/privacy-policy/';
  static const String termsOfServiceUrl = 'https://infinitumlive.com/terms';
  static const String cookiePolicyUrl = 'https://infinitumlive.com/cookies';

  // MARK: Company Information
  static const String foundedDate = 'March 15, 2023';
  static const String founderHandle = '@jrftw';
  static const String location = 'Pittsburgh, Pennsylvania, United States';
  static const String builtByInfinitumPittsburgh = 'Built by Infinitum Pittsburgh';

  // MARK: Service Regions
  static const List<String> serviceRegions = [
    'United States of America',
    'Canada',
    'United Kingdom',
    'Australia',
    'New Zealand',
    'LATAM',
    'Philippines',
  ];

  // MARK: Business Hours
  static const String businessHours = '8 AM – 8 PM EST, Monday to Friday';

  // MARK: Platform Partners
  static const List<String> platformPartners = [
    'TikTok',
    'Favorited',
    'Bigo',
    'YouTube',
    'Instagram',
    'Neptune',
    'Clapper',
    'RedNote',
  ];

  // MARK: Debug Settings
  static bool get enableDebugLogging => kDebugMode;

  // MARK: API Timeout
  static const Duration apiTimeout = Duration(seconds: 30);

  // MARK: AdMob Configuration
  static const String iosAdMobAppId = 'ca-app-pub-6815311336585204~1076958732';
  static const String iosBannerAdUnitId =
      'ca-app-pub-6815311336585204/8867533430';
  static const String androidAdMobAppId =
      'ca-app-pub-6815311336585204~8763877068';
  static const String androidBannerAdUnitId =
      'ca-app-pub-6815311336585204/4928288422';
  static const String testBannerAdUnitId =
      'ca-app-pub-3940256099942544/6300978111';
}

// Suggestions For Features and Additions Later:
// - Add environment-specific API hosts for local InfiniCore/View development
// - Surface a public status endpoint instead of a separate Hosting page
// - Add feature flags for seasonal apply programs without a store resubmit
// - Drive currently-accepting countries from a public config feed instead of AppConfig lists
