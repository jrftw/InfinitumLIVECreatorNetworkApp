/*
 * Filename: banner_ad_widget_stub.dart
 * Purpose: Stub file for google_mobile_ads on web platform
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart
 * Platform Compatibility: Web only
 */

import 'package:flutter/material.dart';

// Stub classes for web platform
class AdSize {
  static const AdSize banner = AdSize._(width: 320, height: 50);
  final int width;
  final int height;
  const AdSize._({required this.width, required this.height});
  
  double get widthDouble => width.toDouble();
  double get heightDouble => height.toDouble();
}

class AdRequest {
  const AdRequest();
}

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
  
  void load() {}
  void dispose() {}
}

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

class LoadAdError {
  final String message;
  LoadAdError(this.message);
}

class AdWidget extends StatelessWidget {
  final BannerAd ad;
  const AdWidget({super.key, required this.ad});
  
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
