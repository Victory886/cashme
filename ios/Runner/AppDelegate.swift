import UIKit
import Flutter
import AdSupport
import AppTrackingTransparency


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
//        var preferredStatusBarStyle: UIStatusBarStyle {
//            return .lightContent // 你可以根据需要返回.lightContent或.default
//        }
        UIApplication.shared.statusBarStyle = .default // 你可以根据需要设置.lightContent或.default
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in

//                if status == .authorized {
//
//                    Settings.shared.isAdvertiserTrackingEnabled = true
//
//                    IndexMgr.shared.trackInfo = [
//                        "idfv": UIDevice.current.identifierForVendor?.uuidString ?? "",
//                        "idfa": ASIdentifierManager.shared().advertisingIdentifier.uuidString
//                    ]
//
//                } else {
//
//                    Settings.shared.isAdvertiserTrackingEnabled = false
//                }
            }
        } else {

//            if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
//
//                Settings.shared.isAdvertiserTrackingEnabled = true
//
//                IndexMgr.shared.trackInfo = [
//                    "idfv": UIDevice.current.identifierForVendor?.uuidString ?? "",
//                    "idfa": ASIdentifierManager.shared().advertisingIdentifier.uuidString
//                ]
//
//            } else {
//
//                Settings.shared.isAdvertiserTrackingEnabled = false
//            }
        }
    }
}


/**
 
 官网:   www.cashmeperaph.com
 api:   houd.cashmeperaph.com
 H5:   hfive.cashmeperaph.com
 */
