//
//  SideMenuSwiftUIApp.swift
//  SideMenuSwiftUI

//

import SwiftUI
import UserNotifications

@main
struct SideMenuSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainTabbedView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //START my previous code
        registerForNotification()
        //END
        //MPF_START
        // Initialize MFPPush
        print("Initalising ....")
    

        // Initialize challenge handler
       //I have commented as of now  _ = UserLoginChallengeHandler()

        // Check if application was opened from a notification
//        if let userInfo = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
//            //handle your notification
//            print("Received Notification in didFinishLaunchingWithOptions \(userInfo)")
//
//        }
        //MFP_END
        return true
    }
    
    func registerForNotification(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
            if granted{
                print("granted..... ")
                DispatchQueue.main.async {
                                   UIApplication.shared.registerForRemoteNotifications()
                                   print("Registered: \(UIApplication.shared.isRegisteredForRemoteNotifications)")
                               }
            }
            
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.hexString
        print(deviceTokenString)
        print("STORING DEVICE TOKEN \(deviceTokenString) ")
        //MFP_START Registers device token with server.
      
        //MFP_END
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("the eror", error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        print("Received Notification in didReceiveRemoteNotification \(userInfo)")

        // display the alert body
        if let notification = userInfo["aps"] as? NSDictionary,
            let alert = notification["alert"] as? NSDictionary,
            let body = alert["body"] as? String {
//            .alert(isPresented: self.$showsAlert) {
//                        Alert(title: Text("Hello"))
//                    }
        }
    }
    
   
}
extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}
