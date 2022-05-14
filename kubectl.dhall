let name = "kubectl"
let version = "v1.24.0"
let makeUrl = \(target: Text) -> \(checksum: Text) ->
    {
        url = "https://dl.k8s.io/release/${version}/bin/${target}",
        checksum = checksum
    }
in {
    name = "${name}",
    version = "${version}",
    description = "A command line tool for communicating with a Kubernetes cluster's control plane, using the Kubernetes API",
    sources = {
        linux = {
            x86_64 = [makeUrl "linux/amd64/${name}" "94d686bb6772f6fb59e3a32beff908ab406b79acdfb2427abdc4ac3ce1bb98d7"],
            aarch64 = [makeUrl "linux/arm64/${name}" "449278789de283648e4076ade46816da249714f96e71567e035e9d17e1fff06d"]
        },
        macos = {
            x86_64 = [makeUrl "darwin/amd64/${name}" "a4f011cc45666a8cc7857699e8d3609597f7364ffcf5dff089fc48c1704fd3b0"],
            aarch64 = [makeUrl "darwin/arm64/${name}" "46ad59a907f73e438a23e83dbb8da97b33690b7efd55aa65f4f43141e0b18cb9"]
        },
        windows = {
            x86_64 = [makeUrl "windows/amd64/${name}.exe" "451828659fef8636bd75fc26720c1d8ba7e20c11916954bec913d78c19f4dd4c"],
            aarch64 = [makeUrl "windows/arm64/${name}.exe" "ee51de96e4ba44d61e9e8ded2d1914f10d6f8abd6fd329bd0de43ec472fa489b"]
        }
    },
    install = ''
        PACKAGE sources/kubectl
        PUBLISH kubectl
    ''
}
