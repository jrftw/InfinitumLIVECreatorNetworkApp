/*
 * Filename: banner_ad_widget.dart
 * Purpose: Reusable banner ad widget for displaying Google AdMob banner ads
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, google_mobile_ads.dart, platform_util.dart, app_config.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web (ads only show on mobile)
 */

import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:flutter/material.dart';
// Conditional import for AdMob - use stub on web, real package on mobile
import 'package:infinitum_live_creator_network/core/admob_stub.dart'
    if (dart.library.io) 'package:infinitum_live_creator_network/core/admob_mobile.dart';
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';

// MARK: - Banner Ad Widget
/// A reusable banner ad widget that displays Google AdMob banner ads
/// Automatically selects the correct ad unit ID based on platform (iOS/Android)
class BannerAdWidget extends StatefulWidget {
  final AdSize? adSize;
  final EdgeInsets? margin;
  final Alignment alignment;
  final bool showTestAds;
  
  const BannerAdWidget({
    super.key,
    this.adSize,
    this.margin,
    this.alignment = Alignment.center,
    this.showTestAds = false,
  });
  
  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  bool _isAdLoading = false;
  
  // MARK: - Lifecycle Methods
  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }
  
  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
  
  // MARK: - Ad Loading
  void _loadBannerAd() {
    // Don't load ads on web platform
    if (kIsWeb) {
      return;
    }
    
    // Check platform only if not on web
    if (!PlatformUtil.isMobile) {
      return;
    }
    
    if (_isAdLoading) return;
    
    try {
      setState(() {
        _isAdLoading = true;
      });
      
      // Get the appropriate ad unit ID based on platform
      final adUnitId = _getAdUnitId();
      
      // Dispose existing ad if any
      _bannerAd?.dispose();
      
      // Create new banner ad
      _bannerAd = BannerAd(
        adUnitId: adUnitId,
        size: widget.adSize ?? AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (_) {
            Logger.logInfo('Banner ad loaded successfully', tag: 'BannerAdWidget');
            if (mounted) {
              setState(() {
                _isAdLoaded = true;
                _isAdLoading = false;
              });
            }
          },
          onAdFailedToLoad: (ad, error) {
            Logger.logError(
              'Banner ad failed to load',
              error: error,
              tag: 'BannerAdWidget',
            );
            ad.dispose();
            if (mounted) {
              setState(() {
                _isAdLoaded = false;
                _isAdLoading = false;
              });
            }
          },
          onAdOpened: (_) {
            Logger.logInfo('Banner ad opened', tag: 'BannerAdWidget');
          },
          onAdClosed: (_) {
            Logger.logInfo('Banner ad closed', tag: 'BannerAdWidget');
          },
          onAdImpression: (_) {
            Logger.logInfo('Banner ad impression recorded', tag: 'BannerAdWidget');
          },
        ),
      );
      
      // Load the ad
      _bannerAd?.load();
    } catch (e, stackTrace) {
      Logger.logError(
        'Error loading banner ad',
        error: e,
        stackTrace: stackTrace,
        tag: 'BannerAdWidget',
      );
      if (mounted) {
        setState(() {
          _isAdLoaded = false;
          _isAdLoading = false;
        });
      }
    }
  }
  
  // MARK: - Helper Methods
  String _getAdUnitId() {
    // Use test ad unit ID if in debug mode or if showTestAds is explicitly true
    // kDebugMode is automatically false in release builds, ensuring production uses real ads
    if (widget.showTestAds || kDebugMode) {
      return AppConfig.testBannerAdUnitId;
    }
    
    // Don't check Platform on web - it will throw an error
    if (kIsWeb) {
      return AppConfig.testBannerAdUnitId;
    }
    
    // Return platform-specific ad unit ID (only on mobile, in release builds)
    if (PlatformUtil.isIOS) {
      return AppConfig.iosBannerAdUnitId;
    } else if (PlatformUtil.isAndroid) {
      return AppConfig.androidBannerAdUnitId;
    }
    
    // Fallback to test ad unit ID for other platforms
    return AppConfig.testBannerAdUnitId;
  }
  
  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    // Don't show ads on web platform
    if (kIsWeb) {
      return const SizedBox.shrink();
    }
    
    // Additional platform check
    if (!PlatformUtil.isMobile) {
      return const SizedBox.shrink();
    }
    
    // Show loading indicator while ad is loading
    if (_isAdLoading && !_isAdLoaded) {
      return Container(
        height: widget.adSize?.height.toDouble() ?? AdSize.banner.height.toDouble(),
        alignment: widget.alignment,
        margin: widget.margin,
        child: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    
    // Show ad if loaded
    if (_isAdLoaded && _bannerAd != null) {
      try {
        final adHeight = widget.adSize?.height.toDouble() ?? AdSize.banner.height.toDouble();
        final adWidth = widget.adSize?.width.toDouble() ?? AdSize.banner.width.toDouble();
        return Container(
          alignment: widget.alignment,
          margin: widget.margin,
          width: double.infinity,
          height: adHeight,
          child: SizedBox(
            width: adWidth,
            height: adHeight,
            child: AdWidget(ad: _bannerAd!),
          ),
        );
      } catch (e) {
        Logger.logError(
          'Error displaying banner ad',
          error: e,
          tag: 'BannerAdWidget',
        );
        return const SizedBox.shrink();
      }
    }
    
    // Return empty container if ad failed to load
    return const SizedBox.shrink();
  }
}

// MARK: - Banner Ad Container Widget
/// A container widget that wraps BannerAdWidget with consistent styling
class BannerAdContainer extends StatelessWidget {
  final AdSize? adSize;
  final EdgeInsets? margin;
  final Alignment alignment;
  final bool showTestAds;
  final Color? backgroundColor;
  
  const BannerAdContainer({
    super.key,
    this.adSize,
    this.margin,
    this.alignment = Alignment.center,
    this.showTestAds = false,
    this.backgroundColor,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final adHeight = adSize?.height.toDouble() ?? AdSize.banner.height.toDouble();
    
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: adHeight + 16, // Add padding height
      decoration: BoxDecoration(
        color: backgroundColor ?? 
            (isDark 
                ? Colors.white.withOpacity(0.05) 
                : Colors.black.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: BannerAdWidget(
          adSize: adSize,
          alignment: alignment,
          showTestAds: showTestAds,
          margin: EdgeInsets.zero, // Remove margin when inside container
        ),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add support for adaptive banner ads
// - Implement ad refresh functionality
// - Add ad placement analytics tracking
// - Create different ad sizes for different screen sizes
// - Add support for rewarded ads
// - Implement ad preloading for better performance
// - Add ad frequency capping
// - Create ad placement A/B testing

