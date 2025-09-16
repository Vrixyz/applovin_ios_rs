//
//  ads.swift
//
//  Created by Thierry Berger on 15/09/2025.
//

public func swift_show_ad() {
    print("Calling into rust rust_did_show_ad")
    rust_did_show_ad();
    print("swift is done.")
}