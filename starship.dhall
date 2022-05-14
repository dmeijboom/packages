let name = "starship"
let version = "v1.6.3"
let makeUrl = \(target: Text) -> \(checksum: Text) ->
    {
        url = "https://github.com/${name}/${name}/releases/download/${version}/${name}-${target}",
        checksum = checksum
    }
in {
    name = "${name}",
    version = "${version}",
    description = "The minimal, blazing-fast, and infinitely customizable prompt for any shell!",
    sources = {
        linux = {
            x86_64 = [makeUrl "x86_64-unknown-linux-gnu.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"]
        },
        macos = {
            x86_64 = [makeUrl "x86_64-apple-darwin.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"],
            aarch64 = [makeUrl "aarch64-apple-darwin.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"]
        },
        windows = {
            x86_64 = [makeUrl "x86_64-pc-windows-msvc.zip" "1b7c20ecb7c2d320b78fb5059b9e2ce5f04dd320011ec9c56abf1dfffaecf996"],
            x86 = [makeUrl "i686-pc-windows-msvc.zip" "abb5dbfa3d1af9b167ef3d8ed3be884f4ecf0ae73ccb836f87d49286857472ab"]
        }
    },
    install = ''
        PACKAGE sources/starship
        PUBLISH starship
    ''
}