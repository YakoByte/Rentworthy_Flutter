import UIKit
import Flutter
import GoogleMaps
import Firebase


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate{
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GMSServices.provideAPIKey("AIzaSyBLYt-XzvSOqiy1eWcTk4T4RaVs8ru4dA0")
      GeneratedPluginRegistrant.register(withRegistry: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


}
