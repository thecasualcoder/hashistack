job "http-echo"{
    datacenters = ["dc1"]
    group "http-echo"{
        count = "2"
        task "http-echo"{
            driver = "exec"
            config {
                command = "http-echo"
                args = [
                    "-text", "<h1>Hello from vagrant ${NOMAD_ALLOC_INDEX}. The password is ${PASSWORD}</h1>",
                    "-listen", "${NOMAD_ADDR_http}"
                ]
            }
            resources {
                memory = 100
                network {
                    port "http" {}
                }
            }

            vault {
                policies = ["http-echo"]
            }

            template {
                data = <<EOH
PASSWORD="{{with secret "secret/data/http-echo"}}{{.Data.data.PASSWORD}}{{end}}"
EOH
                destination = "secrets/file.env"
                env = true
            }
        }
    }
}