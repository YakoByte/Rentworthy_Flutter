import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
//     GMAP API KEY
    GMSServices.provideAPIKey("AIzaSyBLYt-XzvSOqiy1eWcTk4T4RaVs8ru4dA0")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
