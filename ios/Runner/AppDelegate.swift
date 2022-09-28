import UIKit
import Flutter
import google_mobile_ads

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      let listTileFactory = ListTileNativeAdFactory()
          FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
              self, factoryId: "listTile", nativeAdFactory: listTileFactory)
      
      
      GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "e469cb6d54f68dd5c5e569cf4dc66139" ]

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
