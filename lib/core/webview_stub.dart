/*
 * Filename: webview_stub.dart
 * Purpose: Stub file for WebView on web platform (webview_flutter doesn't support web)
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/widgets.dart
 * Platform Compatibility: Web only
 */

import 'package:flutter/widgets.dart';

// MARK: - WebView Stub Classes for Web
/// Stub class for WebViewController on web platform
class WebViewController {
  void setJavaScriptMode(JavaScriptMode mode) {
    // No-op on web
  }
  
  void setNavigationDelegate(NavigationDelegate delegate) {
    // No-op on web
  }
  
  void loadRequest(Uri uri) {
    // No-op on web
  }
  
  void reload() {
    // No-op on web
  }
}

/// Stub enum for JavaScriptMode on web platform
enum JavaScriptMode {
  disabled,
  unrestricted,
}

/// Stub class for NavigationDelegate on web platform
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

/// Stub class for NavigationRequest on web platform
class NavigationRequest {
  final Uri uri;
  
  NavigationRequest({required this.uri});
  
  String get url => uri.toString();
}

/// Stub enum for NavigationDecision on web platform
enum NavigationDecision {
  allow,
  prevent,
  navigate,
}

/// Stub class for WebResourceError on web platform
class WebResourceError {
  final String description;
  final int errorCode;
  
  WebResourceError({required this.description, required this.errorCode});
}

/// Stub class for WebViewWidget on web platform
class WebViewWidget extends StatelessWidget {
  final WebViewController controller;
  
  const WebViewWidget({super.key, required this.controller});
  
  @override
  Widget build(BuildContext context) {
    // Return empty widget on web since webview doesn't work on web
    return const SizedBox.shrink();
  }
}

// Suggestions For Features and Additions Later:
// - This is a stub file for web compatibility
// - No additional features needed as webview_flutter doesn't support web

