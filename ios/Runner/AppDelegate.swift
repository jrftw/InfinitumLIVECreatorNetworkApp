/*
 * Filename: AppDelegate.swift
 * Purpose: Main app delegate for iOS app initialization and tracking permission management
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2025-01-27
 * Dependencies: Flutter, UIKit, AppTrackingTransparency
 * Platform Compatibility: iOS 14.5+
 */

import Flutter
import UIKit
import AppTrackingTransparency

// MARK: - App Delegate
@main
@objc class AppDelegate: FlutterAppDelegate {
  
  // MARK: - Lifecycle Methods
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Set up method channel for tracking permission requests after window is ready
    DispatchQueue.main.async {
      if let controller = self.window?.rootViewController as? FlutterViewController {
        let trackingChannel = FlutterMethodChannel(
          name: "com.infinitumimageryllc.infinitumlive/tracking",
          binaryMessenger: controller.binaryMessenger
        )
        
        trackingChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
          if call.method == "requestTrackingPermission" {
            if #available(iOS 14.5, *) {
              self?.requestTrackingPermission(completion: { status in
                result(status.rawValue)
              })
            } else {
              // iOS < 14.5, tracking is allowed by default
              // AuthorizationStatus.authorized.rawValue = 3
              result(3)
            }
          } else if call.method == "getTrackingStatus" {
            if #available(iOS 14.5, *) {
              let status = ATTrackingManager.trackingAuthorizationStatus
              result(status.rawValue)
            } else {
              result(3) // authorized for iOS < 14.5
            }
          } else {
            result(FlutterMethodNotImplemented)
          }
        }
      }
    }
    
    // Request tracking permission immediately when app launches
    // This must happen BEFORE any ad SDK initialization to comply with Apple's requirements
    // The prompt will appear automatically on first launch when status is .notDetermined
    // Works on both iPhone and iPad (iPadOS 14.5+)
    DispatchQueue.main.async {
      // Small delay to ensure UI is ready, but request immediately
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        self.requestTrackingPermissionIfNeeded()
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // MARK: - Tracking Permission Management
  /// Requests tracking permission if status is not determined
  /// This ensures the ATT prompt appears on first launch before any tracking occurs
  /// Works on both iPhone and iPad (iPadOS 14.5+)
  /// Apple requires this to appear BEFORE any ad SDK initialization
  private func requestTrackingPermissionIfNeeded() {
    // Check if iOS 14.5+ is available (required for App Tracking Transparency)
    if #available(iOS 14.5, *) {
      let trackingStatus = ATTrackingManager.trackingAuthorizationStatus
      
      // Only request if status is .notDetermined (first launch)
      // This ensures the prompt appears exactly once per app installation
      if trackingStatus == .notDetermined {
        print("Requesting App Tracking Transparency permission (first launch)")
        
        // Request tracking authorization
        // This will show the system prompt with NSUserTrackingUsageDescription
        ATTrackingManager.requestTrackingAuthorization { status in
          // Mark that we've requested permission (for logging purposes)
          UserDefaults.standard.set(true, forKey: "hasRequestedTrackingPermission")
          UserDefaults.standard.synchronize()
          
          // Update the user preference based on the result
          // This is used by Flutter code to know if tracking is allowed
          if status == .denied {
            UserDefaults.standard.set(false, forKey: "flutter.ad_tracking_enabled")
            UserDefaults.standard.synchronize()
            print("Tracking permission denied by user")
          } else if status == .authorized {
            UserDefaults.standard.set(true, forKey: "flutter.ad_tracking_enabled")
            UserDefaults.standard.synchronize()
            print("Tracking permission authorized by user")
          } else if status == .restricted {
            UserDefaults.standard.set(false, forKey: "flutter.ad_tracking_enabled")
            UserDefaults.standard.synchronize()
            print("Tracking permission restricted (parental controls)")
          }
          
          // Notify Flutter that ATT status has been determined
          // This allows Flutter to initialize AdMob after permission is granted/denied
          DispatchQueue.main.async {
            NotificationCenter.default.post(
              name: NSNotification.Name("ATTrackingAuthorizationStatusChanged"),
              object: nil,
              userInfo: ["status": status.rawValue]
            )
          }
        }
      } else {
        // Permission already determined (not first launch)
        // Update preference based on current status
        if trackingStatus == .authorized {
          UserDefaults.standard.set(true, forKey: "flutter.ad_tracking_enabled")
        } else {
          UserDefaults.standard.set(false, forKey: "flutter.ad_tracking_enabled")
        }
        UserDefaults.standard.synchronize()
        print("Tracking permission already determined. Status: \(trackingStatus.rawValue)")
      }
    } else {
      // iOS version doesn't support App Tracking Transparency
      // On iOS < 14.5, tracking is allowed by default
      UserDefaults.standard.set(true, forKey: "flutter.ad_tracking_enabled")
      UserDefaults.standard.synchronize()
      print("iOS version < 14.5, App Tracking Transparency not available")
    }
  }
  
  // MARK: - Direct Tracking Permission Request
  /// Requests tracking permission directly (called from Flutter via method channel)
  @available(iOS 14.5, *)
  private func requestTrackingPermission(completion: @escaping (ATTrackingManager.AuthorizationStatus) -> Void) {
    if #available(iOS 14.5, *) {
      let trackingStatus = ATTrackingManager.trackingAuthorizationStatus
      
      if trackingStatus == .notDetermined {
        ATTrackingManager.requestTrackingAuthorization { status in
          // Update the user preference based on the result
          if status == .denied {
            UserDefaults.standard.set(false, forKey: "flutter.ad_tracking_enabled")
            UserDefaults.standard.synchronize()
          } else if status == .authorized {
            UserDefaults.standard.set(true, forKey: "flutter.ad_tracking_enabled")
            UserDefaults.standard.synchronize()
          }
          
          DispatchQueue.main.async {
            completion(status)
          }
        }
      } else {
        completion(trackingStatus)
      }
    } else {
      // iOS < 14.5, tracking is allowed by default
      completion(.authorized)
    }
  }
}

// Suggestions For Features and Additions Later:
// - Add analytics tracking for permission grant/deny rates
// - Implement fallback ad behavior when tracking is denied
// - Add user preference screen to manually request permission again
// - Create detailed logging for tracking permission flow
// - Add support for iOS 15+ enhanced privacy features
