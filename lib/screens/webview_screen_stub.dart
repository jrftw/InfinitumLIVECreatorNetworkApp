/*
 * Filename: webview_screen_stub.dart
 * Purpose: Stub file for webview_flutter on web platform
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart
 * Platform Compatibility: Web only
 */

import 'package:flutter/material.dart';

// Stub classes for webview_flutter on web
enum JavaScriptMode {
  unrestricted,
  restricted,
}

class WebViewController {
  void setJavaScriptMode(JavaScriptMode mode) {}
  void setNavigationDelegate(NavigationDelegate delegate) {}
  void loadRequest(Uri uri) {}
  void reload() {}
}

class NavigationDelegate {
  final void Function(String url)? onPageStarted;
  final void Function(int progress)? onProgress;
  final void Function(String url)? onPageFinished;
  final void Function(WebResourceError error)? onWebResourceError;
  final NavigationDecision Function(NavigationRequest request)? onNavigationRequest;
  
  NavigationDelegate({
    this.onPageStarted,
    this.onProgress,
    this.onPageFinished,
    this.onWebResourceError,
    this.onNavigationRequest,
  });
}

class NavigationRequest {
  final String url;
  NavigationRequest(this.url);
}

enum NavigationDecision {
  navigate,
  prevent,
}

class WebResourceError {
  final String description;
  WebResourceError(this.description);
}

class WebViewWidget extends StatelessWidget {
  final WebViewController controller;
  const WebViewWidget({super.key, required this.controller});
  
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
