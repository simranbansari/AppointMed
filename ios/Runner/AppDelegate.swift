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

    GMSServices.provideAPIkey("AIzaSyB2aYJ-dH5JsXonx8OQJxKUk_Adqtc5KMA")


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
