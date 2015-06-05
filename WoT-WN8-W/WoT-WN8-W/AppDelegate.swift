//
//  AppDelegate.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 26/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        prepareKingfisher()
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

extension AppDelegate {
    
    func prepareKingfisher() {
        
        let downloader = KingfisherManager.sharedManager.downloader
        //downloader.trustedHosts = Set(["i.scdn.co"])
        
        // Download process will timeout after 5 seconds. Default is 15.
        downloader.downloadTimeout = 5
        
        let cache = KingfisherManager.sharedManager.cache
        
        // Set max disk cache to 50 mb. Default is no limit.
        //let mb : UInt = 50
        //cache.maxDiskCacheSize = mb * 1024 * 1024
        
        // Set max disk cache to duration to 365 days, Default is 1 week.
        //let days : NSTimeInterval = 365
        //cache.maxCachePeriodInSecond = 60 * 60 * 24 * days
        
        cache.calculateDiskCacheSizeWithCompletionHandler { (size) -> () in
            println("disk size in bytes: \(size)")
        }
        
    }
    
}

