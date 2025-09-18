import UIKit;
@_implementationOnly import AppLovinSDK


// Define a typealias for the Rust callback
typealias RustCallback = (Bool) -> Void

var adController: AdApplovinController?
var originalViewController: UIViewController?
var _window: UIWindow?
var displayAdEndCallback: RustCallback?


/// To call on application didFinishLaunchingWithOptions
@_cdecl("initialize_sdk")
func initialize_sdk()
{
    let application = UIApplication.shared;
    // Create the initialization configuration
    let initConfig = ALSdkInitializationConfiguration(sdkKey: "«SDK-key»") { builder in
        builder.mediationProvider = ALMediationProviderMAX
        // builder.adUnitIdentifiers = []
        // builder.testDeviceAdvertisingIdentifiers = []
    }

    let alsdk = ALSdk.shared();
      
    alsdk.settings.isVerboseLoggingEnabled = true;

    // Initialize the SDK with the configuration
    alsdk.initialize(with: initConfig) { sdkConfig in
        // Start loading ads
        // TODO: callback to Rust
    }
    _window = application.delegate?.window ?? nil
}

// Display ad function
func displayAd(adUnit: String?, callback: @escaping RustCallback) {
    print("{\(adUnit ?? "nil")}")
    
    displayAdEndCallback = callback
    adController?.showAd()
}

// Call this when ad finishes
func adDidFinish(success: Bool) {
    displayAdEndCallback?(success)
    displayAdEndCallback = nil
}
