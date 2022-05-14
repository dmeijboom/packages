let name = "caddy"
let base_version = "2.5.1"
let version = "v${base_version}"
let makeUrl = \(target: Text) -> \(checksum: Text) ->
    {
        url = "https://github.com/caddyserver/${name}/releases/download/${version}/${name}_${base_version}_${target}",
        checksum = checksum
    }
in {
    name = "${name}",
    version = "${version}",
    description = "Fast, multi-platform web server with automatic HTTPS",
    sources = {
        linux = {
            x86_64 = [makeUrl "linux_amd64.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"],
            aarch64 = [makeUrl "linux_arm64.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"],
            powerpc64 = [makeUrl "linux_ppc64le.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"],
            s390x = [makeUrl "linux_s390x.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"]
        },
        freebsd = {
            x86_64 = [makeUrl "freebsd_amd64.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"],
            aarch64 = [makeUrl "freebsd_arm64.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"]
        },
        macos = {
            x86_64 = [makeUrl "mac_amd64.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"],
            aarch64 = [makeUrl "mac_arm64.tar.gz" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"]
        },
        windows = {
            x86_64 = [makeUrl "windows_amd64.zip" "d9fa651f80b5ea02b68dd9f2cff30d194b2d8cbaf9c0ff345ea57551f5a27927"],
            aarch64 = [makeUrl "windows_arm64.zip" "46c698913da4961e545679d1253fc23a48ae8eb5d4cb78b7a377c0287033a6c9"]
        }
    },
    install = ''
        PACKAGE sources/caddy
        PUBLISH caddy
    ''
}
