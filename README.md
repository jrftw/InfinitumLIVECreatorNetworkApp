# Infinitum LIVE Creator Network

<div align="center">

![Infinitum LIVE](https://img.shields.io/badge/Infinitum-LIVE-6366F1?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android%20%7C%20Web-lightgrey?style=for-the-badge)

**Your Premier Destination for LIVE Talent**

Official mobile and web application for the Infinitum LIVE Creator Network

[Features](#-features) • [Installation](#-installation) • [Platforms](#-platforms) • [Links](#-links)

</div>

---

## 📱 About

Infinitum LIVE Creator Network is the official app for iOS, Android, and Web, providing creators with access to tools, resources, and personalized guidance. Built with Flutter for a seamless cross-platform experience.

**Company:** Infinitum Imagery LLC  
**Founded:** March 15, 2023  
**Location:** Pittsburgh, Pennsylvania, United States

## ✨ Features

### 🛠️ Tools & Services
- **Merch Store** - Shop Infinitum LIVE apparel and merchandise
- **Earnings Calculator** - Estimate your potential earnings as a creator
- **Shadow Ban Checker** - Check if your account is shadow banned

### 🔗 Quick Links
- **Creator Dashboard** - Access your personalized creator dashboard
- **Onboarding** - Join the Infinitum LIVE Creator Network
- **Website** - Visit infinitumlive.com

### 📊 Additional Features
- **Announcements** - Stay updated with the latest network announcements
- **Statistics** - View creator network statistics and analytics
- **About** - Learn about Infinitum LIVE and company information

### 🎨 User Experience
- **Light/Dark/Auto Theme** - Full theme mode support with system preference detection
- **Version Management** - Automatic Dev/Beta/Production environment detection
- **Responsive Design** - Optimized for all screen sizes and devices
- **App Store Ready** - Fully compliant with Apple App Store and Google Play Store requirements

## 🚀 Installation

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- iOS: Xcode 14+ (for iOS builds)
- Android: Android Studio with Android SDK (for Android builds)
- Chrome (for web development)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/jrftw/InfinitumLIVECreatorNetworkApp.git
   cd InfinitumLIVECreatorNetworkApp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Web
   flutter run -d chrome
   
   # iOS (requires Mac)
   flutter run -d ios
   
   # Android
   flutter run -d android
   ```

### Build for Production

```bash
# Web
flutter build web

# iOS
flutter build ios

# Android
flutter build apk --release
# or
flutter build appbundle --release
```

## 📱 Platforms

### ✅ Supported Platforms
- **iOS** - iOS 12.0+
- **Android** - Android 5.0+ (API 21+)
- **Web** - Modern browsers (Chrome, Firefox, Safari, Edge)

### 🌐 Browser Compatibility
- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## 📦 Dependencies

### Core Dependencies
- `flutter` - Flutter SDK
- `http` - HTTP client for API calls
- `url_launcher` - Launch external URLs
- `shared_preferences` - Local storage for preferences
- `package_info_plus` - App version information

### UI Dependencies
- `cached_network_image` - Image caching
- `shimmer` - Loading placeholders
- `flutter_svg` - SVG support

See [pubspec.yaml](pubspec.yaml) for the complete list.

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── app_config.dart          # App configuration constants
│   ├── logger.dart              # Centralized logging system
│   └── version_manager.dart     # Version & environment management
├── models/
│   ├── announcement_model.dart  # Announcement data model
│   └── creator_stats_model.dart # Creator statistics model
├── screens/
│   ├── about_screen.dart        # About/Info screen
│   ├── announcements_screen.dart # Announcements feed
│   ├── apply_screen.dart        # Application screen
│   ├── home_screen.dart         # Main home screen
│   ├── splash_screen.dart       # Splash/loading screen
│   └── statistics_screen.dart   # Statistics display
├── services/
│   ├── api_service.dart         # API service
│   └── theme_preferences_service.dart # Theme preferences
├── theme/
│   └── app_theme.dart           # App theme configuration
├── utils/
│   ├── responsive_util.dart     # Responsive design utilities
│   └── url_launcher_util.dart   # URL launcher utilities
└── widgets/
    ├── app_logo_widget.dart     # App logo widget
    └── stat_card_widget.dart    # Statistics card widget
```

## 🔧 Configuration

### Environment Detection
The app automatically detects the environment:
- **Development** - Debug builds show "Dev" badge
- **Beta** - TestFlight/beta builds show "Beta" badge
- **Production** - Release builds show no badge

### Theme Modes
- **Light** - Light theme
- **Dark** - Dark theme
- **Auto** - Follows system preference (default)

## 📄 App Store Compliance

### ✅ Compliance Features
- Privacy policy links
- Terms of service links
- Cookie policy links
- Proper metadata and descriptions
- Security configurations
- Platform-specific requirements met

### 📱 App Store Requirements
- **Apple App Store** - Ready for submission
- **Google Play Store** - Ready for submission
- **Web** - PWA compliant

## 🔗 Links

### Official Links
- **Website:** [infinitumlive.com](https://infinitumlive.com/)
- **Onboarding:** [infinitum-onboarding.web.app](https://infinitum-onboarding.web.app/)
- **Creator Dashboard:** [view.infinitumlive.com](https://view.infinitumlive.com/)

### Tools & Services
- **Merch Store:** [infinitumlive.com/apparel](https://infinitumlive.com/apparel/#!/)
- **Earnings Calculator:** [infinitumlive.com/estimated-earnings](https://infinitumlive.com/estimated-earnings/)
- **Shadow Ban Checker:** [infinitumlive.com/shadow-ban-checker](https://infinitumlive.com/shadow-ban-checker/)

### Legal
- **Privacy Policy:** [infinitumlive.com/privacy](https://infinitumlive.com/privacy)
- **Terms of Service:** [infinitumlive.com/terms](https://infinitumlive.com/terms)
- **Cookie Policy:** [infinitumlive.com/cookies](https://infinitumlive.com/cookies)

## 👥 Contact

- **Support Email:** support@infinitumlive.com
- **Official Account:** @infinitumcreatornetwork
- **Business Hours:** 8 AM – 8 PM EST, Monday to Friday

## 🌍 Service Regions

- United States of America
- Canada
- United Kingdom
- Australia
- New Zealand

## 🤝 Platform Partners

TikTok • Favorited • Bigo • YouTube • Instagram • Neptune • Clapper • RedNote

## ⚠️ PROPRIETARY SOFTWARE - RESTRICTED USE

**THIS SOFTWARE IS PROPRIETARY AND CONFIDENTIAL**

Copyright © 2025 Infinitum Imagery LLC. All rights reserved.

### ⛔ RESTRICTIONS

**THIS SOFTWARE IS NOT FREE SOFTWARE AND CANNOT BE USED OR COPIED WITHOUT EXPRESS WRITTEN PERMISSION.**

- ❌ **DO NOT** copy, modify, distribute, or use this software without authorization
- ❌ **DO NOT** reverse engineer, decompile, or disassemble this software
- ❌ **DO NOT** create derivative works based on this software
- ❌ **DO NOT** remove or alter any copyright, trademark, or proprietary notices

### ✅ AUTHORIZED USE

**ONLY** the following entities are authorized to use this software:

- ✅ **Infinitum Imagery LLC** (the copyright owner)
- ✅ **Authorized Partners** of Infinitum Imagery LLC (with written agreement)

### 📜 LICENSE TERMS

This software and associated documentation files (the "Software") are the proprietary and confidential property of Infinitum Imagery LLC. Unauthorized copying, modification, distribution, or use of this Software, via any medium, is strictly prohibited without the express written permission of Infinitum Imagery LLC.

**For licensing inquiries, contact:** support@infinitumlive.com

---

**Violation of these terms may result in legal action.**

## 👨‍💻 Author

**Kevin Doyle Jr.** / Infinitum Imagery LLC

---

<div align="center">

**Built with ❤️ by Infinitum Imagery LLC**

[Website](https://infinitumlive.com/) • [GitHub](https://github.com/jrftw/InfinitumLIVECreatorNetworkApp)

</div>
