# Xcode Setup Guide

## Quick Start for Xcode

After cloning from GitHub, follow these steps to run in Xcode:

### 1. Install Flutter Dependencies
```bash
flutter pub get
```

### 2. Install iOS CocoaPods Dependencies
```bash
cd ios
pod install
cd ..
```

**Important:** Always use `Runner.xcworkspace` (not `Runner.xcodeproj`) when opening in Xcode, as CocoaPods requires the workspace file.

### 3. Open in Xcode
```bash
open ios/Runner.xcworkspace
```

Or manually:
- Navigate to `ios/` folder
- Double-click `Runner.xcworkspace` (NOT `Runner.xcodeproj`)

### 4. Configure Signing & Capabilities

In Xcode:

1. **Select the Runner target** in the project navigator
2. **Go to "Signing & Capabilities" tab**
3. **Select your Development Team:**
   - Currently configured: `AD7SJSPX55`
   - Update if this doesn't match your Apple Developer account
4. **Verify Bundle Identifier:**
   - Should be: `com.infinitumimageryllc.infinitumLiveCreatorNetwork`
5. **Xcode will automatically:**
   - Generate provisioning profiles
   - Configure code signing

### 5. Select a Device/Simulator

- Choose an iOS Simulator (iPhone 14, iPhone 15, etc.)
- Or connect a physical iOS device

### 6. Build and Run

- Press `Cmd + R` or click the Play button
- Xcode will build and launch the app

## ✅ Pre-Configured Settings

The following are already configured and ready:

- ✅ **AdMob App ID** - Configured in `Info.plist` (`GADApplicationIdentifier`)
- ✅ **Minimum iOS Version** - iOS 12.0+ (set in Podfile)
- ✅ **Bundle Identifier** - `com.infinitumimageryllc.infinitumLiveCreatorNetwork`
- ✅ **App Display Name** - "Infinitum LIVE Creator Network"
- ✅ **Privacy Permissions** - All configured in `Info.plist`
- ✅ **URL Schemes** - `infinitumlive://` configured
- ✅ **App Icons** - All sizes present
- ✅ **Launch Screen** - Configured

## 🔧 Troubleshooting

### "No such module 'google_mobile_ads'"
**Solution:** Run `pod install` in the `ios/` directory

### "Command PhaseScriptExecution failed"
**Solution:** 
1. Clean build folder: `Product > Clean Build Folder` (Shift + Cmd + K)
2. Delete `ios/Pods` folder
3. Run `pod install` again
4. Restart Xcode

### "Signing for Runner requires a development team"
**Solution:**
1. Go to `Signing & Capabilities` tab
2. Select your Apple Developer team
3. Xcode will automatically create provisioning profiles

### "Failed to register bundle identifier"
**Solution:**
- The bundle ID might already be taken
- Change it in Xcode under `Signing & Capabilities` > `Bundle Identifier`
- Or use a different bundle ID that you own

### Pod Install Issues
```bash
# If pod install fails, try:
cd ios
rm -rf Pods Podfile.lock
pod cache clean --all
pod install
cd ..
```

## 📱 Building for App Store

When ready to submit to App Store:

1. **Change Build Configuration:**
   - In Xcode: `Product > Scheme > Edit Scheme`
   - Set Build Configuration to `Release`

2. **Archive the App:**
   - `Product > Archive`
   - Wait for archive to complete

3. **Distribute:**
   - Click "Distribute App"
   - Follow App Store Connect upload process

## 🔐 Code Signing Notes

- **Development:** Uses automatic signing (configured in Xcode)
- **Distribution:** Requires App Store distribution certificate
- **Team ID:** Currently set to `AD7SJSPX55` - verify this matches your account

## 📦 Dependencies Installed via CocoaPods

- `google_mobile_ads` - AdMob SDK for iOS
- Flutter plugins and their native iOS dependencies

## ✅ Verification Checklist

Before running in Xcode, verify:

- [ ] `flutter pub get` completed successfully
- [ ] `pod install` completed successfully
- [ ] Opening `Runner.xcworkspace` (not `.xcodeproj`)
- [ ] Development team selected in Signing & Capabilities
- [ ] Bundle identifier is correct
- [ ] iOS deployment target is 12.0+

## 🚀 Ready to Run!

Once all steps are complete, you can:
- Run directly from Xcode (`Cmd + R`)
- Or use Flutter CLI: `flutter run -d ios`

The app will automatically:
- Initialize AdMob on iOS
- Load banner ads (if on iOS device/simulator)
- Handle all platform-specific features

---

**Note:** The first build may take several minutes as Xcode downloads dependencies and compiles. Subsequent builds will be faster.

