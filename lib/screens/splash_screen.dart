/*
 * Filename: splash_screen.dart
 * Purpose: Epic loading/splash screen displayed when app starts - matches web version
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

// MARK: - Splash Screen
class SplashScreen extends StatefulWidget {
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final ValueChanged<Locale?>? onLocaleChanged;
  
  const SplashScreen({super.key, this.onThemeModeChanged, this.onLocaleChanged});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late AnimationController _logoSpinController;
  late AnimationController _logoSpinReverseController;
  late AnimationController _fadeController;
  late AnimationController _progressController;
  
  late Animation<double> _gradientAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _progressAnimation;
  
  // MARK: - Lifecycle Methods
  @override
  void initState() {
    super.initState();
    
    // Gradient animation (8 second loop)
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
    
    // Logo spinning animations
    _logoSpinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    
    _logoSpinReverseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
    
    // Fade in animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    
    // Progress bar animation (2 second loop)
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    
    _gradientAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _gradientController,
      curve: Curves.linear,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));
    
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));
    
    _fadeController.forward();
    
    // Navigate to home screen after delay
    _navigateToHome();
  }
  
  @override
  void dispose() {
    _gradientController.dispose();
    _logoSpinController.dispose();
    _logoSpinReverseController.dispose();
    _fadeController.dispose();
    _progressController.dispose();
    super.dispose();
  }
  
  // MARK: - Navigation
  void _navigateToHome() {
    // Check if terms are accepted first
    Future.microtask(() async {
      // Wait for services to initialize properly
      // Keep checking until initialized or timeout after 3 seconds
      int attempts = 0;
      while (!TermsAcceptanceService.isInitialized && attempts < 30) {
        await Future.delayed(const Duration(milliseconds: 100));
        attempts++;
      }
      
      // Ensure TermsAcceptanceService is initialized
      if (!TermsAcceptanceService.isInitialized) {
        await TermsAcceptanceService.initialize();
      }
      
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
    
    // Gradient colors matching web version
    final darkGradientColors = [
      const Color(0xFF0F172A), // Dark slate
      const Color(0xFF1E293B), // Slate
      const Color(0xFF0F172A), // Dark slate
    ];
    
    final lightGradientColors = [
      const Color(0xFFF8FAFC), // Light gray
      const Color(0xFFE2E8F0), // Gray
      const Color(0xFFF8FAFC), // Light gray
    ];
    
    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientAnimation,
        builder: (context, child) {
          // Calculate gradient position for animation
          final gradientPosition = _gradientAnimation.value;
          
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark ? darkGradientColors : lightGradientColors,
                stops: [
                  0.0 + (gradientPosition * 0.5),
                  0.5 + (gradientPosition * 0.5),
                  1.0 + (gradientPosition * 0.5),
                ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
                tileMode: TileMode.clamp,
              ),
            ),
            child: Stack(
              children: [
                // Pulsing radial gradient overlay
                AnimatedBuilder(
                  animation: _gradientController,
                  builder: (context, child) {
                    final pulseValue = (0.3 + (0.3 * (0.5 + 0.5 * (1 - (_gradientController.value * 2 % 1).abs()))));
                    return Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.5,
                          colors: [
                            const Color(0xFF6366F1).withOpacity(pulseValue),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Main content
                SafeArea(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _fadeAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _fadeAnimation.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Logo container with spinning circles
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // Outer spinning circle
                                    AnimatedBuilder(
                                      animation: _logoSpinController,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle: _logoSpinController.value * 2 * 3.14159,
                                          child: SizedBox(
                                            width: 120,
                                            height: 120,
                                            child: CustomPaint(
                                              painter: _CirclePainter(
                                                color: const Color(0xFF6366F1),
                                                strokeWidth: 3,
                                                startAngle: 0,
                                                sweepAngle: 270,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    // Inner reverse spinning circle
                                    AnimatedBuilder(
                                      animation: _logoSpinReverseController,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle: -_logoSpinReverseController.value * 2 * 3.14159,
                                          child: SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: CustomPaint(
                                              painter: _CirclePainter(
                                                color: const Color(0xFF8B5CF6),
                                                strokeWidth: 3,
                                                startAngle: 0,
                                                sweepAngle: 270,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    // Transparent logo in center
                                    Image.asset(
                                      'assets/images/splash_logo.png',
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        // Fallback to AppLogoWidget if transparent logo not found
                                        return const AppLogoWidget(
                                          size: 80,
                                          showShadow: false,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Title with gradient text
                              ShaderMask(
                                shaderCallback: (bounds) => const LinearGradient(
                                  colors: [
                                    Color(0xFF6366F1), // Indigo
                                    Color(0xFF8B5CF6), // Purple
                                    Color(0xFFEC4899), // Pink
                                  ],
                                ).createShader(bounds),
                                child: const Text(
                                  'INFINITUM LIVE',
                                  style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 4,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Subtitle
                              Text(
                                'Creator Network',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color(0xFF8B5CF6),
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Progress bar
                              SizedBox(
                                width: 300,
                                child: AnimatedBuilder(
                                  animation: _progressAnimation,
                                  builder: (context, child) {
                                    final progress = _progressAnimation.value < 0.5
                                        ? _progressAnimation.value * 2 * 0.7
                                        : 0.7 + ((_progressAnimation.value - 0.5) * 2 * 0.3);
                                    
                                    return Container(
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFF6366F1).withOpacity(0.2),
                                      ),
                                      child: Stack(
                                        children: [
                                          FractionallySizedBox(
                                            widthFactor: progress,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xFF6366F1),
                                                    Color(0xFF8B5CF6),
                                                    Color(0xFFEC4899),
                                                  ],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color(0xFF6366F1).withOpacity(0.6),
                                                    blurRadius: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// MARK: - Custom Circle Painter for Spinning Circles
class _CirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;
  
  _CirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.startAngle,
    required this.sweepAngle,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawArc(
      rect,
      startAngle * 3.14159 / 180,
      sweepAngle * 3.14159 / 180,
      false,
      paint,
    );
  }
  
  @override
  bool shouldRepaint(_CirclePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.startAngle != startAngle ||
        oldDelegate.sweepAngle != sweepAngle;
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

