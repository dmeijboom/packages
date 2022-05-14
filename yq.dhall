let name = "yq"
let version = "v4.25.1"
let makeUrl = \(target: Text) -> \(checksum: Text) ->
    {
        url = "https://github.com/mikefarah/yq/releases/download/${version}/${name}_${target}",
        checksum = checksum
    }
in {
    name = "${name}",
    version = "${version}",
    description = "A portable command-line YAML, JSON and XML processor",
    sources = {
        linux = {
            x86 = [makeUrl "linux_386" "af48a7622b045937087918b2b2a8b4b51c564dad9b97833390593b68ff88ac15"],
            x86_64 = [makeUrl "linux_amd64" "57b6247bc2406c20a887aee3594399e081759601fd2f8ae9df21938499d76c81"],
            arm = [makeUrl "linux_arm" "2ee16477b3d24fd591558dfeb2ba41a202e1eed469f8d3f9fd7fa56c4d64b61a"],
            aarch64 = [makeUrl "linux_arm64" "ebc38f45e915e01fa950a50f170945fa052c7931b2af11861577c939e62a3cd3"],
            mips = [makeUrl "linux_mips" "75291d82174db787aed1415f9531e903747d042a13a095959aa8397b2a61b0b9"],
            mips64 = [makeUrl "linux_mips64" "6d42d15b5fe912311b4e6ed7bbdcc5aba26ca2f5bcd10b5e9a357f9b48a2ecb8"],
            powerpc64 = [makeUrl "linux_ppc64" "50e23687d420cd7239596e491912c7d53182c9a96eda60752e6aead06c1efd58"],
            s390x = [makeUrl "linux_s390x" "fd1354773c5dc84f65f4feed6b93e7fb8b007f2cb87fc4786e9bb1f02cb1e1af"]
        },
        freebsd = {
            arm = [makeUrl "freebsd_arm" "ffdf6a68c8dfff51fa4897f42ace627e450f32d2def90a581eab09d3ce902bcd"],
            x86 = [makeUrl "freebsd_386" "49d3a1501cef7f614c364071714a7213ed3262f0520b140b3f9d5be499e0b435"]
        },
        netbsd = {
            arm = [makeUrl "netbsd_arm" "2d354d9f8dd990be032846db22e2b65f318b394a7e0f16c4e0eed0676b25bd25"],
            x86 = [makeUrl "netbsd_386" "a619a271ec35dd875f5000a369e2c5a6cb2f6522a0677ce36bc3b865aae5c5a0"],
            x86_64 = [makeUrl "netbsd_arm" "CHECKSUM"]
        },
        openbsd = {
            x86_64 = [makeUrl "openbsd_amd64" "9dda9ec185641f8a2269174e38d3bed29939adfc56a04f2556f92f91fd5ef2d0"],
            x86 = [makeUrl "openbsd_386" "5783bc70ac081232a6249e85eb15fc758fc9831e42be7ae4ec81c943727ee9fe"]
        },
        macos = {
            x86_64 = [makeUrl "darwin_amd64" "e0665487ebd131ca1af7a796db16ecbabf04f8bfec8ecab890c5a013f96ff13a"],
            aarch64 = [makeUrl "darwin_arm64" "2e3dc822cf184c997573f95b4b9b05e1936695d151d673f95e25b4fdcf34868b"]
        },
        windows = {
            x86_64 = [makeUrl "windows_amd64.exe" "f26bf0f977163524fe181a597cb27e1798d326a4e85afdd2ba176ffd4c3579b6"],
            x86 = [makeUrl "windows_386.exe" "39546d622539f31306588f23b030989de321eaea27144492d2f7cd3a2a66195e"]
        }
    },
    install = ''
        PACKAGE sources/yq_* AS yq
        PUBLISH yq
    ''
}
