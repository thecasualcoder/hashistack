job "http-echo"{
    datacenters = ["dc1"]
    group "http-echo"{
        count = "5"
        task "http-echo"{
            driver = "exec"
            config {
                command = "http-echo"
                args = [
                    "-text", "Hello from vagrant ${NOMAD_ALLOC_INDEX}",
                    "-listen", "${NOMAD_ADDR_http}"
                ]
            }

            resources {
                network {
                    port "http" {}
                }
            }
        }
    }
}