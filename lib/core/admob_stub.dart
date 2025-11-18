/*
 * Filename: admob_stub.dart
 * Purpose: Stub implementation of AdMob for web platform compatibility
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/widgets.dart
 * Platform Compatibility: Web only
 */

import 'package:flutter/widgets.dart';

// MARK: - Stub MobileAds Class for Web
/// Stub implementation that does nothing on web platform
class MobileAds {
  static final MobileAds _instance = MobileAds._internal();
  factory MobileAds() => _instance;
  MobileAds._internal();
  
  static MobileAds get instance => _instance;
  
  /// Stub initialization - does nothing on web
  Future<InitializationStatus> initialize() async {
    return InitializationStatus(
      adapterStatuses: <String, AdapterStatus>{},
    );
  }
}

// MARK: - Stub InitializationStatus
class InitializationStatus {
  final Map<String, AdapterStatus> adapterStatuses;
  
  InitializationStatus({required this.adapterStatuses});
}

// MARK: - Stub AdapterStatus
class AdapterStatus {
  final AdapterInitializationState initializationState;
  final String? description;
  final int? latency;
  
  AdapterStatus({
    required this.initializationState,
    this.description,
    this.latency,
  });
}

// MARK: - Stub AdapterInitializationState
enum AdapterInitializationState {
  notReady,
  ready,
}

// MARK: - Stub AdSize
class AdSize {
  static const AdSize banner = AdSize._(width: 320, height: 50);
  static const AdSize largeBanner = AdSize._(width: 320, height: 100);
  static const AdSize mediumRectangle = AdSize._(width: 300, height: 250);
  static const AdSize fullBanner = AdSize._(width: 468, height: 60);
  static const AdSize leaderboard = AdSize._(width: 728, height: 90);
  
  final int _width;
  final int _height;
  
  const AdSize._({required int width, required int height})
      : _width = width,
        _height = height;
  
  double get width => _width.toDouble();
  double get height => _height.toDouble();
}

// MARK: - Stub AdRequest
class AdRequest {
  const AdRequest();
}

// MARK: - Stub BannerAd
class BannerAd {
  final String adUnitId;
  final AdSize size;
  final AdRequest request;
  final BannerAdListener listener;
  
  BannerAd({
    required this.adUnitId,
    required this.size,
    required this.request,
    required this.listener,
  });
  
  void load() {
    // Stub - does nothing on web
  }
  
  void dispose() {
    // Stub - does nothing on web
  }
}

// MARK: - Stub BannerAdListener
class BannerAdListener {
  final void Function(BannerAd ad)? onAdLoaded;
  final void Function(BannerAd ad, LoadAdError error)? onAdFailedToLoad;
  final void Function(BannerAd ad)? onAdOpened;
  final void Function(BannerAd ad)? onAdClosed;
  final void Function(BannerAd ad)? onAdImpression;
  
  BannerAdListener({
    this.onAdLoaded,
    this.onAdFailedToLoad,
    this.onAdOpened,
    this.onAdClosed,
    this.onAdImpression,
  });
}

// MARK: - Stub LoadAdError
class LoadAdError {
  final int code;
  final String message;
  final String domain;
  final String? responseInfo;
  
  LoadAdError({
    required this.code,
    required this.message,
    required this.domain,
    this.responseInfo,
  });
}

// MARK: - Stub AdWidget
class AdWidget extends StatelessWidget {
  final BannerAd ad;
  
  const AdWidget({super.key, required this.ad});
  
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

// Suggestions For Features and Additions Later:
// - This is a stub file for web compatibility only
// - No actual functionality needed here as ads don't show on web
