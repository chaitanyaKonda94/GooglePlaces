//
//  AppDelegate.swift
//  GooglePlacesDemo
//
//  Created by SMSCountry Networks Pvt. Ltd on 03/10/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var selectedStoryboard : UIStoryboard!
    var navigationcontorObj = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         L102Localizer.DoTheMagic()
        
        
        GMSPlacesClient.provideAPIKey("AIzaSyD1BZFO7auG1NIoh0YAOpL3hi1kQdbfxUk")
        GMSServices.provideAPIKey("AIzaSyD1BZFO7auG1NIoh0YAOpL3hi1kQdbfxUk")
        
         selectedStoryboard =  UIStoryboard.init(name: "Main", bundle: nil)
        
        
        let rootViewController = self.window!.rootViewController as! UINavigationController
        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let langVC : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "LanguageSelectionViewController") as! LanguageSelectionViewController
       // rootViewController.pushViewController(langVC, animated: true)
      navigationcontorObj = UINavigationController.init(rootViewController: langVC)
        navigationcontorObj.isNavigationBarHidden = false
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navigationcontorObj
        //navigationController.showDetailViewController(langVC, sender: Any?.self)
        
//        if UserDefaultStore.isAppLauncedFirstTime == nil {
//            UserDefaultStore.isAppLauncedFirstTime = "1"
//        }
        
//        if UserDefaultStore.isAppLauncedFirstTime == "1"{
//            UserDefaultStore.isAppLauncedFirstTime = "0"
//        let langVC = selectedStoryboard.instantiateViewController(withIdentifier: "LanguageSelectionViewController") as! LanguageSelectionViewController
//        navigationcontorObj = UINavigationController.init(rootViewController: langVC)
//        } else{
//                let aboutVC = selectedStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//                navigationcontorObj = UINavigationController.init(rootViewController: aboutVC)
//        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

