let name = "minio-client"
let version = "2022-05-09T04-08-26Z"
let makeSource = \(os: OS) -> \(arch: Arch) -> \(target: Text) ->
    {
        os = os,
        arch = arch,
        url = "https://dl.min.io/client/mc/release/${target}/mc.RELEASE.${version}"
    }
in {
    name = "${name}",
    version = "${version}",
    description = "Modern alternative to UNIX commands like ls, cat, cp, etc. Supports filesystems and Amazon S3 compatible cloud storage",
    sources = [
        makeSource OS.Linux Arch.x86_64 "linux-amd64",
        makeSource OS.Linux Arch.aarch64 "linux-arm64",
        makeSource OS.Linux Arch.mips64 "linux-mips64",
        makeSource OS.Linux Arch.powerpc64 "linux-ppc64le",
        makeSource OS.Linux Arch.s390x "linux-s390x",
        makeSource OS.MacOS Arch.x86_64 "darwin-amd64",
        makeSource OS.MacOS Arch.aarch64 "darwin-arm64",
        makeSource OS.Windows Arch.x86_64 "windows-amd64"
    ],
    install = ''
        PACKAGE sources/mc.RELEASE.${version} AS mc
        PUBLISH mc
    ''
}