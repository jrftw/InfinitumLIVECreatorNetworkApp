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
          } else {
            result(FlutterMethodNotImplemented)
          }
        }
      }
    }
    
    // Request tracking permission after a short delay to ensure app is fully initialized
    // This ensures the permission dialog appears at the right time
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      self.requestTrackingPermissionIfNeeded()
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // MARK: - Tracking Permission Management
  /// Requests tracking permission only once if not already determined
  /// This ensures the user sees the permission dialog only once
  /// Only requests if user has enabled tracking in app settings
  private func requestTrackingPermissionIfNeeded() {
    // Check if iOS 14.5+ is available (required for App Tracking Transparency)
    if #available(iOS 14.5, *) {
      // Check if we've already requested permission before
      let hasRequestedBefore = UserDefaults.standard.bool(forKey: "hasRequestedTrackingPermission")
      
      // Check user's tracking preference from SharedPreferences
      // SharedPreferences uses "flutter." prefix on iOS
      let trackingEnabled = UserDefaults.standard.object(forKey: "flutter.ad_tracking_enabled") as? Bool ?? nil
      
      // Only request if:
      // 1. We haven't requested before
      // 2. Status is not determined
      // 3. User has enabled tracking (or preference is not set, default to requesting)
      let trackingStatus = ATTrackingManager.trackingAuthorizationStatus
      
      let shouldRequest = !hasRequestedBefore && 
                         trackingStatus == .notDetermined &&
                         (trackingEnabled == nil || trackingEnabled == true)
      
      if shouldRequest {
        // Request tracking authorization
        ATTrackingManager.requestTrackingAuthorization { status in
          // Mark that we've requested permission
          UserDefaults.standard.set(true, forKey: "hasRequestedTrackingPermission")
          UserDefaults.standard.synchronize()
          
          // Update the user preference based on the result
          // If user denied, set preference to false
          if status == .denied {
            UserDefaults.standard.set(false, forKey: "flutter.ad_tracking_enabled")
            UserDefaults.standard.synchronize()
          } else if status == .authorized {
            UserDefaults.standard.set(true, forKey: "flutter.ad_tracking_enabled")
            UserDefaults.standard.synchronize()
          }
          
          // Log the result (for debugging purposes)
          switch status {
          case .authorized:
            print("Tracking permission authorized")
          case .denied:
            print("Tracking permission denied")
          case .restricted:
            print("Tracking permission restricted")
          case .notDetermined:
            print("Tracking permission not determined")
          @unknown default:
            print("Unknown tracking permission status")
          }
        }
      } else {
        // Permission already requested or determined, or user disabled tracking
        if trackingEnabled == false {
          print("Tracking permission request skipped - user disabled tracking in settings")
        } else {
          print("Tracking permission already requested or determined. Status: \(trackingStatus.rawValue)")
        }
      }
    } else {
      // iOS version doesn't support App Tracking Transparency
      // On iOS < 14.5, tracking is allowed by default
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
