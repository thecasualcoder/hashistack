job "fabio" {
  datacenters = ["dc1"]
  type = "system"
  
	update {
    stagger = "5s"
    max_parallel = 1
  }

  group "fabio" {
    
		task "fabio" {
      
			driver = "exec"

      config {
        command = "./fabio"
        
				args = [
					"-proxy.addr",
          "${NOMAD_ADDR_proxy}",
					"-ui.addr",
					"${NOMAD_ADDR_ui}",
					"-registry.consul.register.enabled=false"
				]
			}

			artifact {
				source = "https://github.com/fabiolb/fabio/releases/download/v1.5.10/fabio-1.5.10-go1.11.1-linux_amd64"
				destination = "./fabio"
				mode = "file"
			}

			service {
				name = "fabio"
				port = "proxy"

				check {
					port = "ui"
					type = "http"
					path = "/health"
					timeout = "2s"
					interval = "10s"
				}
			}

			resources {
				network {
					port "proxy" {
						static = 8080
					}
          
					port "ui" {
						static = 9998
					}
				}
			}
		}
	}
}