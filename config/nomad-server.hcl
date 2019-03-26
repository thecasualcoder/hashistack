bind_addr = "192.168.1.100"
data_dir = "/data/nomad"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled       = true
  network_interface = "enp0s8"
}

consul {
  address = "http://192.168.1.200:8500"
}

vault {
  enabled = true
  address = "http://192.168.1.200:8200"
  token = "workshop"
}