import UIKit
import Flutter

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
    
}
