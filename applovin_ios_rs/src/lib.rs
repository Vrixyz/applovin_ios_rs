mod native;

pub fn swift_show_ad() {
    println!("Calling into Swift to show an ad...");
    native::swift_show_ad();
}
