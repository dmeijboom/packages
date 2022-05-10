let os = env:TARGET_OS_ALT as Text
let arch = env:TARGET_ARCH_ALT as Text
let name = "kubectl"
let version = "v1.24.0"
in {
    name = "${name}",
    version = "${version}",
    description = "A command line tool for communicating with a Kubernetes cluster's control plane, using the Kubernetes API",
    source = ["https://dl.k8s.io/release/${version}/bin/${os}/${arch}/${name}"],
    install = ''
        PACKAGE sources/kubectl
        PUBLISH kubectl
    ''
}
