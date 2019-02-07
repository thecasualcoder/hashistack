# Section 1

## 1. Run a service

```bash
#vagrant ssh node0
http-echo -text "Hello World!" -listen "0.0.0.0:8080"

# From host
open http://192.168.1.100:8080
```

## 2. Run nomad

```bash
#vagrant ssh node0
sudo nomad agent \
    -server -client \
    -data-dir /data/nomad \
    -bootstrap-expect 1 \
    -bind 192.168.1.100 \
    -network-interface enp0s8
```

## 3. Access nomad UI

```bash
# From host
open http://192.168.1.100:4646
```

## 4. Schedule `http-echo`

Write a job file `http-echo.hcl` under `jobs` folder in current repo

```bash
# vagrant ssh node0
nomad validate /vagrant/jobs/http-echo.hcl
nomad plan /vagrant/jobs/http-echo.hcl
nomad run /vagrant/jobs/http-echo.hcl
```

What is covered?
- Dynamic port
- Horizontal scaling
- Self healing
- Resource crunch

## 5. Adding new node

```bash
#vagrant ssh node1
sudo nomad agent \
    -client \
    -data-dir /data/nomad \
    -servers=192.168.1.100 \
    -bind=192.168.1.101 \
    -network-interface enp0s8
```

# Section 2

## 1. Start vault

```bash
# vagrant ssh systems
sudo vault server -dev -dev-listen-address=192.168.1.200:8200
```

## 2. Configure secret

```bash
open http://192.168.1.200:8200
```

What is covered?
- Create a secret
- Create a policy for the secret

## 3. Configure nomad to be vault aware


```bash
# vagrant ssh node0
# Stop nomad and add these flags to existing command
-vault-enabled \
-vault-address=http://192.168.1.200:8200 \
-vault-token=${VAULT_TOKEN}

# vagrant ssh node1
# Stop nomad and add these flags to existing command
-vault-enabled \
-vault-address=http://192.168.1.200:8200 \
-vault-token=${VAULT_TOKEN}
```

## 4. Run new job with vault policy configured

# Section 3

## 1. Allow traffic

What is covered?
- Consul for service discovery
- Fabio for consul aware web server