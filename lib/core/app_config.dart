/*
 * Filename: app_config.dart
 * Purpose: Centralized application configuration constants
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-11-12
 * Dependencies: None
 * Platform Compatibility: iOS, Android, Web
 */

// MARK: - Application Configuration
class AppConfig {
  // App Information
  static const String appName = 'Infinitum LIVE Creator Network';
  static const String appVersion = '1.0.0';
  static const String companyName = 'Infinitum Imagery LLC';
  static const String companyDBA = 'Infinitum LIVE Creator Network';
  
  // API Endpoints
  static const String announcementsUrl = 
      'https://raw.githubusercontent.com/jrftw/InfiniView-Announcements/main/Announcements.json';
  static const String creatorStatsUrl = 
      'https://raw.githubusercontent.com/jrftw/TTCreatorsAMT/main/TTCreatorAMT.json';
  
  // External Links
  static const String websiteUrl = 'https://infinitumlive.com/';
  static const String onboardingUrl = 'https://infinitum-onboarding.web.app/';
  static const String viewAppUrl = 'https://view.infinitumlive.com/';
  static const String supportEmail = 'support@infinitumlive.com';
  static const String officialAccount = '@infinitumcreatornetwork';
  
  // Tools & Services Links
  static const String merchUrl = 'https://infinitumlive.com/apparel/#!/';
  static const String estimateEarningsUrl = 'https://infinitumlive.com/estimated-earnings/';
  static const String shadowBanCheckerUrl = 'https://infinitumlive.com/shadow-ban-checker/';
  
  // Application Links
  static const String howToApplyUrl = 'https://infinitumlive.com/how-to-apply/';
  static const String creatorPreCheckUrl = 'https://infinitumlive.com/creator-pre-check/';
  static const String tiktokShopUrl = 'https://infinitumlive.com/tiktok-shop/';
  static const String favoritedLiveApplyUrl = 'https://infinitumlive.com/apply-as-favorited-live-creator/';
  
  // Community Links
  static const String discordCommunityUrl = 'https://discord.gg/tMCg9WqDT9';
  
  // Legal & Compliance Links
  static const String privacyPolicyUrl = 'https://infinitumlive.com/privacy';
  static const String termsOfServiceUrl = 'https://infinitumlive.com/terms';
  static const String cookiePolicyUrl = 'https://infinitumlive.com/cookies';
  
  // Company Information
  static const String foundedDate = 'March 15, 2023';
  static const String founderHandle = '@jrftw';
  static const String location = 'Pittsburgh, Pennsylvania, United States';
  
  // Service Regions
  static const List<String> serviceRegions = [
    'United States of America',
    'Canada',
    'United Kingdom',
    'Australia',
    'New Zealand',
    'LATAM',
    'Philippines',
  ];
  
  // Business Hours
  static const String businessHours = '8 AM – 8 PM EST, Monday to Friday';
  
  // Platform Partners
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
  
  // Debug Settings
  static const bool enableDebugLogging = true;
  
  // API Timeout
  static const Duration apiTimeout = Duration(seconds: 30);
}

// Suggestions For Features and Additions Later:
// - Add environment-specific configurations (dev, staging, production)
// - Implement feature flags for gradual rollouts
// - Add API rate limiting configuration
// - Create configuration for analytics endpoints
// - Add support for multiple API versions
// - Implement configuration hot-reload capability

