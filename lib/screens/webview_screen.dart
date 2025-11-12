/*
 * Filename: webview_screen.dart
 * Purpose: In-app webview screen for displaying web content without leaving the app
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-11-12
 * Dependencies: flutter/material.dart, webview_flutter, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:infinitum_live_creator_network/core/app_config.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';

// MARK: - WebView Screen
class WebViewScreen extends StatefulWidget {
  final String url;
  final String? title;
  
  const WebViewScreen({
    super.key,
    required this.url,
    this.title,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? _controller;
  bool _isLoading = true;
  String? _errorMessage;
  int _loadingProgress = 0;
  
  // MARK: - Lifecycle Methods
  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }
  
  // MARK: - WebView Initialization
  void _initializeWebView() {
    // Skip webview initialization on web platform
    if (kIsWeb) {
      return;
    }
    
    Logger.logInfo('Initializing WebView for URL: ${widget.url}', tag: 'WebViewScreen');
    
    setState(() {
      _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _errorMessage = null;
              _loadingProgress = 0;
            });
            Logger.logInfo('Page started loading: $url', tag: 'WebViewScreen');
          },
          onProgress: (int progress) {
            setState(() {
              _loadingProgress = progress;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
              _loadingProgress = 100;
            });
            Logger.logInfo('Page finished loading: $url', tag: 'WebViewScreen');
          },
          onWebResourceError: (WebResourceError error) {
            Logger.logError(
              'WebView error: ${error.description}',
              error: error,
              tag: 'WebViewScreen',
            );
            setState(() {
              _isLoading = false;
              _errorMessage = error.description.isNotEmpty 
                  ? error.description 
                  : 'Failed to load page. Please check your internet connection.';
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            // Validate URL to ensure it's from trusted domains
            final navigationUrl = request.url;
            final isAllowed = _isAllowedUrl(navigationUrl);
            
            if (!isAllowed) {
              Logger.logInfo(
                'Blocked navigation to untrusted URL: $navigationUrl',
                tag: 'WebViewScreen',
              );
              // Block navigation to untrusted domains for security
              // User can use "Open in Browser" button to open in external browser if needed
              return NavigationDecision.prevent;
            }
            
            // Allow navigation to trusted domains
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    });
  }
  
  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayTitle = widget.title ?? _getPageTitle();
    
    // On web platform, redirect to external browser since webview_flutter doesn't support web
    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openInExternalBrowser(context);
        Navigator.of(context).pop();
      });
      return Scaffold(
        appBar: AppBar(
          title: Text(displayTitle),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(displayTitle),
        actions: [
          // Reload button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Logger.logInfo('Reloading WebView', tag: 'WebViewScreen');
              _controller?.reload();
            },
            tooltip: 'Reload',
          ),
          // Open in external browser button
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: () => _openInExternalBrowser(context),
            tooltip: 'Open in Browser',
          ),
        ],
      ),
      body: Stack(
        children: [
          // WebView
          _errorMessage != null
              ? _buildErrorView(theme)
              : _controller != null
                  ? WebViewWidget(controller: _controller!)
                  : const Center(child: CircularProgressIndicator()),
          
          // Loading indicator
          if (_isLoading) _buildLoadingIndicator(theme),
        ],
      ),
    );
  }
  
  // MARK: - Loading Indicator
  Widget _buildLoadingIndicator(ThemeData theme) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            value: _loadingProgress < 100 ? _loadingProgress / 100 : null,
            valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
          ),
          const SizedBox(height: 16),
          if (_loadingProgress < 100)
            Text(
              'Loading... $_loadingProgress%',
              style: theme.textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }
  
  // MARK: - Error View
  Widget _buildErrorView(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to Load Page',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              _errorMessage ?? 'An error occurred while loading the page.',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _errorMessage = null;
                });
                _controller?.reload();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
  
  // MARK: - URL Validation
  /// Validates if a URL is from a trusted domain
  bool _isAllowedUrl(String url) {
    try {
      final uri = Uri.parse(url);
      final host = uri.host.toLowerCase();
      
      // List of allowed domains and subdomains
      final allowedDomains = [
        'infinitumlive.com',
        'www.infinitumlive.com',
        'infinitum-onboarding.web.app',
        'view.infinitumlive.com',
        'raw.githubusercontent.com', // For API endpoints
        'github.com', // For GitHub content
      ];
      
      // Check if host matches any allowed domain or is a subdomain
      for (final domain in allowedDomains) {
        if (host == domain || host.endsWith('.$domain')) {
          return true;
        }
      }
      
      // Allow same-origin navigation (same domain as initial URL)
      try {
        final initialUri = Uri.parse(widget.url);
        final initialHost = initialUri.host.toLowerCase();
        if (host == initialHost || host.endsWith('.$initialHost')) {
          return true;
        }
      } catch (e) {
        // If initial URL parsing fails, continue with domain check
      }
      
      return false;
    } catch (e) {
      Logger.logError('Error validating URL: $url', error: e, tag: 'WebViewScreen');
      // If URL parsing fails, allow navigation (fail open for user experience)
      return true;
    }
  }
  
  // MARK: - Helper Methods
  String _getPageTitle() {
    try {
      final uri = Uri.parse(widget.url);
      final host = uri.host;
      if (host.isNotEmpty) {
        return host.replaceFirst('www.', '');
      }
      return 'Web Page';
    } catch (e) {
      return 'Web Page';
    }
  }
  
  void _openInExternalBrowser(BuildContext context) async {
    try {
      final uri = Uri.parse(widget.url);
      if (await url_launcher.canLaunchUrl(uri)) {
        final launched = await url_launcher.launchUrl(
          uri,
          mode: url_launcher.LaunchMode.externalApplication,
        );
        if (!launched && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not open in external browser'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cannot open this URL'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      Logger.logError('Error opening in external browser', error: e, tag: 'WebViewScreen');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error opening link'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add back/forward navigation buttons
// - Implement bookmark functionality
// - Add share page functionality
// - Create history tracking
// - Add download support for files
// - Implement cookie management
// - Add zoom controls
// - Create print functionality

