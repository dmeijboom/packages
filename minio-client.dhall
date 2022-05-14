let name = "minio-client"
let version = "2022-05-09T04-08-26Z"
let makeUrl = \(target: Text) -> \(checksum: Text) ->
    {
        url = "https://dl.min.io/client/mc/release/${target}/mc.RELEASE.${version}",
        checksum = checksum
    }
in {
    name = "${name}",
    version = "${version}",
    description = "Modern alternative to UNIX commands like ls, cat, cp, etc. Supports filesystems and Amazon S3 compatible cloud storage",
    sources = {
        linux = {
            x86_64 = [makeUrl "linux-amd64" "032941682f0dad14ba756af0377bc1f517fd475c5c98e957a07cdedddb9b1d31"],
            aarch64 = [makeUrl "linux-arm64" "695d80ed00d1dceef6f9113daff1324dc0dc3f724d1d4aa702862c7ce8030818"],
            mips64 = [makeUrl "linux-mips64" "1cd49be45ab1f9e1fb18cc3a13e5c67d253de0828fb598c59f6a7fc6c1dd42a8"],
            powerpc64 = [makeUrl "linux-ppc64le" "0e7cbc395426be93b1e04cf69d929e1cd89d85fd68bd43e8037a775197621eac"],
            s390x = [makeUrl "linux-s390x" "07a91d7c6a746d147938230e62a30955aaf62ee02067754fc9798c68d1942ed4"]
        },
        macos = {
            x86_64 = [makeUrl "darwin-amd64" "2f27193facc4ba6a51e881158c6471df45eb761f8243e98819144893fbfd1ecf"],
            aarch64 = [makeUrl "darwin-arm64" "c7f4bfb0c75aa0cfd23326594572a7e106b01c730d10cbca0d9aed1749b4aad3"]
        },
        windows = {
            x86_64 = [makeUrl "windows-amd64" "3f09134e6175e3a8c03b3c56342ec95475ae8ef0030ffdea9b3401a94d723da0"]
        }
    },
    install = ''
        PACKAGE sources/mc.RELEASE.${version} AS mc
        PUBLISH mc
    ''
}