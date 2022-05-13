let name = "kubectl"
let version = "v1.24.0"
let makeSource = \(os: OS) -> \(arch: Arch) -> \(target: Text) ->
    {
        os = os,
        arch = arch,
        url = "https://dl.k8s.io/release/${version}/bin/${target}/${name}"
    }
in {
    name = "${name}",
    version = "${version}",
    description = "A command line tool for communicating with a Kubernetes cluster's control plane, using the Kubernetes API",
    sources = [
        makeSource OS.Linux Arch.x86_64 "linux/amd64",
        makeSource OS.Linux Arch.aarch64 "linux/arm64",
        makeSource OS.MacOS Arch.x86_64 "darwin/amd64",
        makeSource OS.MacOS Arch.aarch64 "darwin/arm64",
        makeSource OS.Windows Arch.x86_64 "windows/amd64",
        makeSource OS.Windows Arch.aarch64 "windows/arm64"
    ],
    install = ''
        PACKAGE sources/kubectl
        PUBLISH kubectl
    ''
}
