let os = env:TARGET_OS_ALT as Text
let arch = env:TARGET_ARCH as Text
let vendor = env:TARGET_VENDOR as Text
let name = "starship"
let version = "v1.6.3"
in {
    name = "${name}",
    version = "${version}",
    description = "The minimal, blazing-fast, and infinitely customizable prompt for any shell!",
    source = ["https://github.com/${name}/${name}/releases/download/${version}/${name}-${arch}-${vendor}-${os}.tar.gz"],
    install = ''
        PACKAGE sources/starship
        PUBLISH starship
    ''
}