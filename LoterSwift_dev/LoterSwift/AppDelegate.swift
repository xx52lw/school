//
//  AppDelegate.swift
//  LoterSwift
//
//  Created by 张星星 on 2018/4/2.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit
import UserNotifications
import IQKeyboardManagerSwift

@UIApplicationMain
// =================================================================================================================================
// MARK: -  总代理
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //MARK: APP进入
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        setupApp() // 设置APP配置
        selectShowViewController() // 选择进入界面
        
        return true
    }
    
    //MARK: APP进入后台
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    //MARK: APP进入前台
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    //MARK: APP进入活跃
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    
}

// =================================================================================================================================
// MARK: -  总代理
extension AppDelegate {
    //MARK: 设置APP配置
    func setupApp() {
        // 设置键盘
        IQKeyboardManager.shared.enable = true
        LWListenNetworkTool.sharedInstance().beginListenNetworkChange()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: LWSelectIntoAppControllerNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(selectShowViewController), name: NSNotification.Name(rawValue: LWSelectIntoAppControllerNotification), object: nil)
        // 开启全局定时器
        LWTimerManageTool.sharedInstance().runGlobalTimer()
    }
    
    //MARK: 选择要展示的控制器
    @objc func selectShowViewController() {
        let oldVersion = UserDefaults.standard.string(forKey: LWSystemVersionKey)
        let currentVersion = Bundle.main.version
        if  oldVersion == nil || oldVersion?.compare(currentVersion) == .orderedAscending  {
            UserDefaults.standard.set(currentVersion, forKey: LWSystemVersionKey)
            window?.rootViewController = LWNewFeatureViewController()
        }
        else {
            window?.rootViewController = LWBaseTabBarController()
        }
        window?.makeKeyAndVisible()
    }
    //MARK: 设置APNS
    func setAppNotifyInformation() {
        if #available(iOS 10.0, *) {
            // 要导入import UserNotifications
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .carPlay, .sound], completionHandler: { (success, error) in
                print("授权 " + (success ? "成功" : "失败"))
            })
            
        }
        else {
            // 取得用户授权显示通知[上方的提示条/声音/BadgeNumber]  ios10以下
            let notifySettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(notifySettings)

        }
    }
}
