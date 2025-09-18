import UIKit;
@_implementationOnly import AppLovinSDK
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // Create the initialization configuration
  let initConfig = ALSdkInitializationConfiguration(sdkKey: "«SDK-key»") { builder in
    builder.mediationProvider = ALMediationProviderMAX
  }

  // Initialize the SDK with the configuration
  ALSdk.shared().initialize(with: initConfig) { sdkConfig in
    // Start loading ads
  }
  return true
}


