# Guide

## Prepare environ variables
```bash
~/ $ export REDIS_USERNAME=""
~/ $ export REDIS_PASSWORD=""
~/ $ export REDIS_HOST="localhost"
~/ $ export REDIS_PORT=6379
~/ $ export REDIS_DB=1
```

## Operate the combined digital service via Docker-Compose
```bash
~/task $ docker-compose -f dev.yml build
~/task $ docker-compose -f dev.yml up -d
~/task $ docker-compose -f dev.yml ps
~/task $ docker-compose -f dev.yml logs
~/task $ docker-compose -f dev.yml down
```

## Request the count
```bash
~/task $ curl localhost:8080/
```

## Migrate container image to Minikube repo
```bash
~/task $ minikube image load tasky:beta
~/task $ minikube image ls | grep tasky
```

## Install Helm charts to Minikube via a Bash script.
This approach favors installing two separate Helm charts: First the Redis chart, then the local chart for the Flask app. The client KubeCTL is used to gather
information from one deployment that will be useful for another deployment. Incorporating the Redis chart as a sub-chart in the local chart might be slick, but
will involve some contortion with _Values.yaml_ and templating.
```bash
~/task $ bash installation.sh
```

## Expose Minikube cluster on MacOS
```bash
~/ $ echo '127.0.0.1 counter.info' | sudo tee -a /etc/hosts
~/ $ minikube tunnel
~/ $ curl counter.info/
```
