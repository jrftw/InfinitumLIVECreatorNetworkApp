# App Tracking Transparency (ATT) Implementation Notes
**App Name:** Infinitum LIVE Creator Network  
**Bundle ID:** com.infinitumimageryllc.infinitum_live_creator_network  
**Date:** January 27, 2025

---

## Summary

This app uses Google AdMob for displaying banner ads, which requires App Tracking Transparency (ATT) permission on iOS/iPadOS 14.5+. The ATT permission request has been properly implemented and will appear automatically on first launch before any tracking occurs.

---

## Does This App Track Users?

**Yes, for advertising purposes only.** The app uses Google AdMob SDK to display banner ads. AdMob may use the Identifier for Advertisers (IDFA) for ad personalization when the user grants ATT permission. The app does not track users across apps or websites for any other purpose.

---

## When and How the ATT Prompt Appears

### Timing
The ATT permission request appears **automatically on first app launch**, approximately 0.5 seconds after the app finishes launching. This happens **before** any ad SDK initialization, ensuring full compliance with Apple's requirement that ATT must be requested before any tracking occurs.

### Implementation Details
1. **Location:** The ATT request is triggered in `ios/Runner/AppDelegate.swift` in the `application(_:didFinishLaunchingWithOptions:)` method
2. **Condition:** The prompt only appears when `ATTrackingManager.trackingAuthorizationStatus == .notDetermined` (first launch)
3. **Platform Support:** Works on both iPhone and iPad (iPadOS 14.5+), including iPadOS 18/26.1
4. **No Blocking Conditions:** The request is not gated behind any user preferences, settings, or conditions that would prevent it from appearing

### Code Flow
1. App launches → `AppDelegate.application(_:didFinishLaunchingWithOptions:)` is called
2. After 0.5 second delay (to ensure UI is ready), `requestTrackingPermissionIfNeeded()` is called
3. If status is `.notDetermined`, `ATTrackingManager.requestTrackingAuthorization()` is called
4. System shows the ATT prompt with the message from `NSUserTrackingUsageDescription` in Info.plist
5. User responds (Allow/Ask App Not to Track)
6. AdMob SDK is initialized only after ATT status is determined

---

## Info.plist Configuration

The `NSUserTrackingUsageDescription` in `ios/Runner/Info.plist` contains:

```
This app uses tracking to show you personalized banner ads through Google AdMob. We only use tracking for ad personalization and do not share your data with third parties for tracking purposes. You can choose to allow or deny this permission at any time in Settings.
```

---

## Testing on iPadOS 26.1

To verify the ATT prompt appears on iPadOS 26.1:

1. **Fresh Install:** Delete the app completely from the device
2. **Reset ATT Status (if needed):** Go to Settings → Privacy & Security → Tracking, and ensure the app is not listed (or reset all tracking permissions)
3. **Launch App:** Open the app for the first time
4. **Expected Behavior:** Within 1 second of launch, the ATT permission dialog should appear with the message from `NSUserTrackingUsageDescription`

**Note:** If the app has been installed before, the ATT status will already be determined and the prompt will not appear again. You must delete and reinstall the app to see the prompt.

---

## App Store Review Response Template

Use the following text when responding to Apple's App Review team:

---

**Subject: App Tracking Transparency Implementation - Infinitum LIVE Creator Network**

Dear App Review Team,

Thank you for your feedback regarding the App Tracking Transparency (ATT) permission request. I have verified and fixed the implementation to ensure the ATT prompt appears correctly on all devices, including iPadOS 26.1.

**Where to Find the ATT Permission Request:**

The App Tracking Transparency permission request appears automatically on first app launch, approximately 0.5 seconds after the app finishes launching. The prompt is triggered in the app delegate (`AppDelegate.swift`) and will appear when:

1. The app is launched for the first time (fresh install)
2. The tracking authorization status is `.notDetermined` (not yet requested)
3. The device is running iOS/iPadOS 14.5 or later

**Testing Instructions:**

To see the ATT prompt during review:

1. Delete the app completely from the test device
2. Launch the app for the first time
3. Within 1 second of launch, the ATT permission dialog will appear with the message: "This app uses tracking to show you personalized banner ads through Google AdMob..."

**Implementation Details:**

- The ATT request is made in `ios/Runner/AppDelegate.swift` in the `application(_:didFinishLaunchingWithOptions:)` method
- The request happens BEFORE any ad SDK (AdMob) initialization, ensuring compliance with Apple's requirements
- The implementation works on both iPhone and iPad, including iPadOS 18/26.1
- No conditions block the prompt from appearing on first launch

**Why Tracking is Used:**

This app uses Google AdMob to display banner ads. AdMob may use the Identifier for Advertisers (IDFA) for ad personalization when the user grants ATT permission. The app does not track users for any other purpose.

If you have any questions or need additional information, please let me know.

Best regards,  
[Your Name]

---

## Additional Notes

- The app respects the user's ATT choice: if denied, AdMob will still function but without personalized ads
- Users can change their ATT preference at any time in Settings → Privacy & Security → Tracking
- The ATT status is checked before initializing AdMob to ensure compliance
- All tracking-related code respects the user's authorization status

---

## Files Modified

1. `ios/Runner/AppDelegate.swift` - Fixed ATT request logic to ensure it appears on first launch
2. `lib/main.dart` - Updated to wait for ATT status before initializing AdMob
3. `ios/Runner/Info.plist` - Updated `NSUserTrackingUsageDescription` for clarity

---

## Compliance Status

✅ ATT request appears on first launch  
✅ ATT request appears before any tracking/ad SDK initialization  
✅ Works on both iPhone and iPad (including iPadOS 18/26.1)  
✅ No blocking conditions prevent the prompt from appearing  
✅ Info.plist contains proper `NSUserTrackingUsageDescription`  
✅ AdMob initialization respects ATT status  

