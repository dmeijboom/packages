let name = "starship"
let version = "v1.6.3"
let makeSource = \(os: OS) -> \(arch: Arch) -> \(target: Text) ->
    {
        os = os,
        arch = arch,
        url = "https://github.com/${name}/${name}/releases/download/${version}/${name}-${target}"
    }
in {
    name = "${name}",
    version = "${version}",
    description = "The minimal, blazing-fast, and infinitely customizable prompt for any shell!",
    sources = [
        makeSource OS.Linux Arch.x86_64 "x86_64-unknown-linux-gnu.tar.gz",
        makeSource OS.MacOS Arch.x86_64 "x86_64-apple-darwin.tar.gz",
        makeSource OS.MacOS Arch.aarch64 "aarch64-apple-darwin.tar.gz",
        makeSource OS.Windows Arch.x86_64 "x86_64-pc-windows-msvc.zip",
        makeSource OS.Windows Arch.x86 "starship-i686-pc-windows-msvc.zip"
    ],
    install = ''
        PACKAGE sources/starship
        PUBLISH starship
    ''
}