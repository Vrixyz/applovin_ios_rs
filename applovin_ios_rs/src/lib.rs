#![doc = include_str!("../README.md")]

#[cfg(target_os = "ios")]
mod native;

pub fn initialize_sdk() {
    #[cfg(target_os = "ios")]
    unsafe {
        native::initialize_sdk();
    }
}
