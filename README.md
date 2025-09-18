# applovin_ios_rs
<!-- 
[![crates.io](https://img.shields.io/crates/v/applovin_ios_rs.svg)](https://crates.io/crates/applovin_ios_rs)
[![docs.rs](https://docs.rs/applovin_ios_rs/badge.svg)](https://docs.rs/applovin_ios_rs)
-->

Rust crate and Swift Package Module for Applovin Ads on iOS.

<!-- TODO: Demo -->

## Features

* reads safe area on app start
* easy access via a resource
* noop on non-ios platforms (no `cfg`s needed in your app code)

## Instructions

1. Add to XCode: Add SPM (Swift Package Manager) dependency
2. Add Rust dependency
3. Add environment variables
4. Follow Applovin integration

### 1. Add to XCode

* Go to `File` -> `Add Package Dependencies` and paste `https://github.com/vrixyz/applovin_ios_rs.git` into the search bar on the top right.

### 2. Add Rust dependency

```sh
cargo add applovin_ios_rs
```

or

```toml
# always pin to the same exact version you also of the Swift package
applovin_ios_rs = { version = "=0.3.0" }
```

### 3. Add environment variables

We'll add our environment variables in Xcode:
copy the env_example.xcconfig in a release and debug variants and link them in your project's configurations for debug and release final target.

### 4. Follow Applovin integration

1. Follow iOS specific instructions that you have to do in Xcode files: https://developers.axon.ai/en/max/ios/overview/integration#skadnetwork
   1. Permissions
   2. Consent values
   3. ...?

## Troubleshooting

### symbol not found

- Did you add your Swift package dependency?

### library not found

Showing All Messages

```
Ld .../mobile.debug.dylib normal (in target 'mobile' from project 'mobile')

ld: library 'mobile' not found
clang: error: linker command failed with exit code 1 (use -v to see invocation)

Library 'mobile' not found

Linker command failed with exit code 1 (use -v to see invocation)
```

Make sure your `LIBRARY_SEARCH_PATHS` has the path to your mobile library:

```
  "$(SRCROOT)/../target/aarch64-apple-ios/debug" \
  "$(SRCROOT)/../target/x86_64-apple-ios/debug"
```

### Applovin not found

```
.../applovin_ios_rs/...: Unable to find module dependency: 'AppLovinSDK'
@_implementationOnly import AppLovinSDK
                            ^
```

- Did you add applovin to your cocoapod dependencies ?

Make sure your app target (the one using the Swift Package) has AppLovinSDK linked:

Check Build Phases → Link Binary With Libraries.

AppLovinSDK.framework (from Pods) should be there.


### No ads are shown

Check out documentation of th rust crate, make sure you call initialization functions when the app finishes launching, and that it's successful. Try verbose options and check logs!


# License

All code in this repository is dual-licensed under either:

- MIT License (LICENSE-MIT or <http://opensource.org/licenses/MIT>)
- Apache License, Version 2.0 (LICENSE-APACHE or <http://www.apache.org/licenses/LICENSE-2.0>)

at your option. This means you can select the license you prefer.

## Your contributions

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.
