/*
 * Filename: splash_screen.dart
 * Purpose: Loading/splash screen displayed when app starts
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: flutter/material.dart, home_screen.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/core/logger.dart';
import 'package:infinitum_live_creator_network/screens/home_screen.dart';
import 'package:infinitum_live_creator_network/screens/terms_acceptance_screen.dart';
import 'package:infinitum_live_creator_network/services/terms_acceptance_service.dart';
import 'package:infinitum_live_creator_network/widgets/app_logo_widget.dart';
import 'package:infinitum_live_creator_network/widgets/glass_card_widget.dart';

// MARK: - Splash Screen
class SplashScreen extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final ValueChanged<Locale?>? onLocaleChanged;
  
  const SplashScreen({super.key, this.onThemeModeChanged, this.onLocaleChanged});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  
  // MARK: - Lifecycle Methods
  @override
  void initState() {
    super.initState();
    
    // Setup animations - faster for instant feel
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));
    
    _animationController.forward();
    
    // Navigate to home screen after delay
    _navigateToHome();
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
  // MARK: - Navigation
  void _navigateToHome() {
    // Check if terms are accepted first
    Future.microtask(() async {
      // Wait a moment for services to initialize
      await Future.delayed(const Duration(milliseconds: 100));
      
      if (!mounted) return;
      
      final termsAccepted = TermsAcceptanceService.termsAccepted;
      
      if (!termsAccepted) {
        // Show terms acceptance screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => TermsAcceptanceScreen(
              onTermsAccepted: () {
                // After terms are accepted, navigate to home
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      onThemeModeChanged: widget.onThemeModeChanged,
                      onLocaleChanged: widget.onLocaleChanged,
                    ),
                  ),
                );
                Logger.logInfo('Navigated to home screen after terms acceptance', tag: 'SplashScreen');
              },
            ),
          ),
        );
        Logger.logInfo('Navigated to terms acceptance screen', tag: 'SplashScreen');
      } else {
        // Terms already accepted, go directly to home
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              onThemeModeChanged: widget.onThemeModeChanged,
              onLocaleChanged: widget.onLocaleChanged,
            ),
          ),
        );
        Logger.logInfo('Navigated to home screen', tag: 'SplashScreen');
      }
    });
  }
  
  // MARK: - Build Method
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    theme.colorScheme.primary.withOpacity(0.15),
                    theme.colorScheme.secondary.withOpacity(0.1),
                    theme.scaffoldBackgroundColor,
                  ]
                : [
                    theme.colorScheme.primary.withOpacity(0.08),
                    theme.colorScheme.secondary.withOpacity(0.05),
                    theme.scaffoldBackgroundColor,
                  ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: GlassCardWidget(
                      padding: const EdgeInsets.all(48),
                      borderRadius: BorderRadius.circular(32),
                      blurIntensity: 25.0,
                      opacity: 0.2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Transparent logo for splash screen
                          Image.asset(
                            'assets/images/splash_logo.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback to AppLogoWidget if transparent logo not found
                              return const AppLogoWidget(
                                size: 200,
                                showShadow: true,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Add version number display on splash screen
// - Implement app update check during splash
// - Add network connectivity check
// - Create animated logo effects
// - Add skip button for returning users
// - Implement onboarding flow after splash
// - Add background image or pattern
// - Create different splash screens for different app states

