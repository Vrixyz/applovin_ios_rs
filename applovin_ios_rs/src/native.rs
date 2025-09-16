#[allow(unused_imports)]
pub use ffi::*;

fn ad_did_finish() {
    println!("Rust ad did finish function called...");
}

#[swift_bridge::bridge]
mod ffi {
    extern "Rust" {
        fn ad_did_finish();
    }

    extern "Swift" {
        fn swift_show_ad();
    }
}
