# build-rust.sh

#!/bin/bash

set -e

THISDIR=$(dirname $0)
cd $THISDIR

touch ./src/lib.rs
cargo build --target aarch64-apple-ios
cargo build --target x86_64-apple-ios
# TODO: enable once https://github.com/rust-lang/rust-bindgen/issues/3181 is released
# cargo build --target aarch64-apple-ios-sim

mkdir -p ./target/universal-ios/debug

# TODO: add back sim target
lipo -create \
    "./target/aarch64-apple-ios/debug/libapplovin_ios_rs.a" \
    "./target/x86_64-apple-ios/debug/libapplovin_ios_rs.a" \
    -output ./target/universal-ios/debug/libapplovin_ios_rs.a