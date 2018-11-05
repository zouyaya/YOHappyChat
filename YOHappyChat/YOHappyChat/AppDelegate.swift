//
//  AppDelegate.swift
//  YOHappyChat
//
//  Created by yangou on 2018/11/5.
//  Copyright © 2018 hello. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Bmob.register(withAppKey: "cf09d0602345e103aac1d9263464b5ee")
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let rootVC = RootViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        
        save()
        return true
    }
    
    func save() {
        
        let gameScore :BmobObject = BmobObject(className: "GameScore")
        gameScore.setObject("杨广", forKey: "playerName")
        gameScore.setObject("90", forKey: "score")
        gameScore.saveInBackground { (isSuccessful, Error) in
            
            if Error != nil{
                print("error is \(Error!.localizedDescription)")
            }else{
                print("保存成功");
            }
            
        }
        
        
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

