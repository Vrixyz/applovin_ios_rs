#![doc = include_str!("../README.md")]

#[cfg(target_os = "ios")]
mod native;

#[cfg(target_os = "ios")]
pub fn call_swift_custom() {
    unsafe {
        native::swift_custom();
    }
}
