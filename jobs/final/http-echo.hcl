job "http-echo" {
    datacenters = ["dc1"]
    type = "service"
    update {
        max_parallel = 1
    }

    group "http-echo" {
        count = 2
        task "http-echo" {
            driver = "exec"
            config {
                command = "http-echo"
                args = [
                    "-text",
                    "Instance: ${NOMAD_ALLOC_INDEX} IP: ${NOMAD_ADDR_http} VERSION: ${NOMAD_META_VERSION} PASSWORD: ${PASSWORD}",
                    "-listen",
                    "0.0.0.0:${NOMAD_PORT_http}"
                ]
            }

            resources {
                memory = 200
                network {
                    port "http" {}
                }
            }

			service {
				port = "http"
				name = "http-echo"

				tags = [
					"urlprefix-http-echo.service.consul/"
					"urlprefix-/http-echo",
				]

				check {
					type = "http"
					path = "/health"
					interval = "10s"
					timeout = "2s"
				}
			}

			vault {
				policies = ["http-echo"]
			}

			template {
  				data = <<EOH
# Lines starting with a # are ignored

# Empty lines are also ignored
PASSWORD="{{with secret "secret/data/http-echo"}}{{.Data.data.PASSWORD}}{{end}}"
EOH

  				destination = "secrets/file.env"
  				env         = true
}
        }
    }
}
