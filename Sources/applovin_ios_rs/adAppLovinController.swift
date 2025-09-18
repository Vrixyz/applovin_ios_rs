//
//  adAppLovinController.swift
//  applovin_ios_rs
//
//  Created by Thierry Berger on 18/09/2025.
//

import AppLovinSDK
import UIKit

class AdApplovinController: NSObject, MAAdDelegate {
    var interstitialAd: MAInterstitialAd?
    var retryAttempt: Int = 0

    func createInterstitialAd() {
        interstitialAd = MAInterstitialAd(adUnitIdentifier: "YOUR_AD_UNIT_ID")
        interstitialAd?.delegate = self
        interstitialAd?.load()
    }

    func showAd() {
        interstitialAd?.show()
    }

    // MARK: - MAAdDelegate
     func didLoad(_ ad: MAAd) {
         retryAttempt = 0
         // Call Rust callback if needed
         //didLoadAd()
     }

    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        retryAttempt += 1
        let delaySec = pow(2.0, Double(min(6, retryAttempt)))
        DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
            self.interstitialAd?.load()
        }
        //didFailToLoadAdForAdUnitIdentifier()
    }

    func didDisplay(_ ad: MAAd) {
        //didDisplayAd()
    }

    func didClick(_ ad: MAAd) {
        //didClickAd()
    }

    func didHide(_ ad: MAAd) {
        interstitialAd?.load()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            displayAdEndCallback?(true)
        }
    }

    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        interstitialAd?.load()
        displayAdEndCallback?(false)
    }
}
