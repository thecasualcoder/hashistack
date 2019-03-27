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
sudo nomad agent -config config/nomad-server.hcl
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
sudo nomad agent -config config/nomad-client-1.hcl
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

## 4. Run new job with vault policy configured

# Section 3

## 1. Allow traffic

What is covered?
- Consul for service discovery
- Traefik for consul aware web server
