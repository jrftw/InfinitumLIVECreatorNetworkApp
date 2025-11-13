# App Store Review Response Guide
**App Name:** Infinitum LIVE Creator Network  
**Bundle ID:** com.infinitumimageryllc.infinitum_live_creator_network  
**Date:** January 27, 2025

---

## Issue 1: App Tracking Transparency (ATT) - Guideline 2.1

### Apple's Concern
"The app uses the AppTrackingTransparency framework, but we are unable to locate the App Tracking Transparency permission request when reviewed on iPadOS 26.1."

### Response

**Where to Find the ATT Permission Request:**

The App Tracking Transparency permission request appears automatically on first app launch, approximately 0.5 seconds after the app finishes launching. The prompt is triggered in the app delegate and will appear when:

1. The app is launched for the first time (fresh install)
2. The tracking authorization status is `.notDetermined` (not yet requested)
3. The device is running iOS/iPadOS 14.5 or later

**Testing Instructions for iPadOS 26.1:**

To see the ATT prompt during review:

1. Delete the app completely from the test device (if previously installed)
2. Launch the app for the first time
3. Within 1 second of launch, the ATT permission dialog will appear with the message: "This app uses tracking to show you personalized banner ads through Google AdMob. We only use tracking for ad personalization and do not share your data with third parties for tracking purposes. You can choose to allow or deny this permission at any time in Settings."

**Implementation Details:**

- The ATT request is made in `ios/Runner/AppDelegate.swift` in the `application(_:didFinishLaunchingWithOptions:)` method
- The request happens BEFORE any ad SDK (AdMob) initialization, ensuring compliance with Apple's requirements
- The implementation works on both iPhone and iPad, including iPadOS 18/26.1
- No conditions block the prompt from appearing on first launch
- The prompt appears exactly once per app installation

**Why Tracking is Used:**

This app uses Google AdMob to display banner ads. AdMob may use the Identifier for Advertisers (IDFA) for ad personalization when the user grants ATT permission. The app does not track users for any other purpose.

**Note:** If the app has been installed before, the ATT status will already be determined and the prompt will not appear again. You must delete and reinstall the app to see the prompt.

---

## Issue 2: Guideline 5.1.1 - Data Collection / Phone Number Requirement

### Apple's Concern
"The app requires users to provide personal information that is not directly relevant to the app's core functionality."

### Response

**This app does NOT require users to provide any personal information, including phone numbers, email addresses, or any other data.**

**App Declaration in Info.plist:**

We have explicitly declared in the app's `Info.plist` file that:
- This app is a central hub/portal application
- The app does NOT collect user data
- The app does NOT require account creation or login
- The app does NOT store personal information
- The app does NOT request phone numbers or email addresses
- The app does NOT have any forms or data input fields

**No Forms or Data Collection:**

- The app does not have any sign-up or login functionality
- The app does not collect any user information (name, email, phone, etc.)
- The app does not require any account creation
- The app does not have any text input fields for user data
- All application processes happen on external websites (infinitumlive.com), not within the app

**App Functionality:**

The app serves as an informational hub and navigation tool. Users can:
- Browse announcements and statistics (publicly available information)
- Access links to external tools (merch store, earnings calculator, etc.)
- View information about the creator network
- Navigate to external websites for application processes

All of these features are accessible without providing any personal information.

**Where to Verify:**

1. **Info.plist Key `NSAppDescription`:** Contains explicit declaration that the app does not collect data or require accounts
2. **Info.plist Key `CFBundleGetInfoString`:** States the app is a hub/portal that does not collect user data
3. **Info.plist Key `NSContactsUsageDescription`:** Specifically states the app does not collect phone numbers
4. **Info.plist Key `NSLocalNetworkUsageDescription`:** Clarifies the app does not collect or store user data
5. **Runner.entitlements:** Contains comments documenting that the app does not collect data

**If Apple is referring to external websites:**

Any data collection that occurs happens on external websites (infinitumlive.com) that users navigate to via links in the app. These external websites are not part of the app itself and are governed by their own privacy policies and terms of service. The app itself is purely a navigation/informational hub.

---

## Issue 3: Guideline 2.1 - Full Access / Demo Account

### Apple's Concern
"We are unable to successfully access all or part of the app. In order to continue the review, we need to have a way to verify all app features and functionality for all account types."

### Response

**This app is 100% accessible without any account, login, demo mode, or authentication required.**

**App Declaration:**

We have explicitly declared in the app's configuration files that:
- This app does NOT require account creation
- This app does NOT have any login functionality
- This app does NOT store user data
- This app is 100% accessible without authentication

**Full Access Available:**

The app is designed to be fully accessible to everyone. There are no login requirements, no account creation, and no access restrictions. All features are available immediately upon opening the app:

1. **Home Screen:** Displays links to tools, services, and external websites
2. **Statistics Screen:** Shows publicly available creator network statistics
3. **Announcements Screen:** Displays publicly available network announcements
4. **About Screen:** Contains information about the company and creator network

**No Account Types or Storage:**

This app does not have:
- Different account types or user roles
- Any account creation functionality
- Any login or authentication system
- Any user data storage
- Any member-only content or features

All users see the same content and have access to all features. There is no "creator network member" vs "public user" distinction within the app itself.

**Sensitive Data Protection:**

While some data may be protected on external websites (infinitumlive.com), within the app itself, all content is publicly accessible. The app does not display any sensitive or member-only information that would require authentication.

**Testing Instructions:**

To test all app functionality:

1. Launch the app (no login required, no account needed)
2. Navigate through all four main tabs:
   - Home (default tab)
   - Statistics
   - Announcements
   - About
3. Tap on any link to verify external navigation works
4. All features are immediately accessible without any authentication

**Where to Verify:**

- **Info.plist Key `NSAppDescription`:** Explicitly states no account creation required
- **Info.plist Key `CFBundleGetInfoString`:** Declares the app does not require account creation
- **Runner.entitlements:** Documents that the app is 100% accessible without authentication

**Note:** Some links in the app navigate to external websites (infinitumlive.com) where users may need to create accounts or log in. However, the app itself does not require any authentication, and all app features are fully accessible for review. The app is purely a navigation/informational hub.

---

## Summary

1. **ATT Implementation:** Fixed and verified. The ATT prompt appears on first launch on all devices including iPadOS 26.1. See `ATT_Review_Notes.md` for detailed implementation notes.

2. **Data Collection:** The app does not collect or require any personal information. All features are accessible without providing any data.

3. **Full Access:** The app is 100% accessible without any account or login. All features are available immediately upon launch.

---

## Additional Information

For detailed technical information about the ATT implementation, please refer to `ATT_Review_Notes.md` in the project repository.

If you have any questions or need clarification on any of these points, please let me know.

Best regards,  
Kevin Doyle Jr. / Infinitum Imagery LLC

