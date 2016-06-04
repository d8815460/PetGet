//
//  AppDelegate.swift
//  PetGet
//
//  Created by 駿逸 陳 on 2016/6/4.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Parse
import ParseCrashReporting
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK: - UIApplicationDelegate
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        // Fabric
        Fabric.with([Crashlytics.self])
        // ****************************************************************************
        // Parse initialization
        // FIXME: CrashReporting currently query to cydia://        
        ParseCrashReporting.enable()
        Parse.setApplicationId("vvyRK6XFXbYnc7vaHd8O5j5x7j8fIHkJhQUmNF4P", clientKey: "HuggZTGwHpiV87ISpCm1xJ6a2YYGS3E6RVjtaA9p")
        // PFFacebookUtils.initializeFacebook()
        // TODO: V4      
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        // ****************************************************************************
        
        // Track app open.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        // 將Badge歸零
        if application.applicationIconBadgeNumber != 0 {
            application.applicationIconBadgeNumber = 0
            PFInstallation.currentInstallation().saveInBackground()
        }
        
        // 自動產生一個用戶
        PFUser.enableAutomaticUser()
        
        let defaultACL = PFACL()
        // If you would like all objects to be private by default, remove this line.
        defaultACL.setReadAccess(true, forUser: PFUser.currentUser()!)
        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser: true)
        
        if (application.applicationState != UIApplicationState.Background) {
            // Track an app open here if we launch with a push, unless
            // "content_available" was used to trigger a background push (introduced in iOS 7).
            // In that case, we skip tracking here to avoid double counting the app-open.
//            BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
//            BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
//            BOOL noPushPayload = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
//            if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
//                [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
//            }
            PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        }
        
        // Register for Push Notitications
        let userNotificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Badge, UIUserNotificationType.Sound]
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

