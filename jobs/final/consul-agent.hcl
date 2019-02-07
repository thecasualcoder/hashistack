job "consul-agent" {
	datacenters = ["dc1"]
	type = "system"
	group "consul-agent" {
		task "consul-agent" {
			driver = "exec"
			config {
				command = "consul"
				args = [
					"agent",
					"-join",
					"192.168.1.200",
					"-data-dir",
					"/tmp/consul",
					"-bind=${NOMAD_IP_http}"
				]
			}

			resources {
				memory = 128
				network {
					port "http" {
						static = 8500
					}

					port "serf_lan" {
						static = 8301
					}

					port "serf_wan" {
						static = 8302
					}

					port "raft" {
						static = 8300
					}

					port "dns" {
						static = 8600
					}
				}
			}
		}
	}
}