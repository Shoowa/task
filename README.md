# Guide

## Prepare environ variables
```bash
~/ $ export REDIS_USERNAME=""
~/ $ export REDIS_PASSWORD=""
~/ $ export REDIS_HOST="localhost"
~/ $ export REDIS_PORT=6379
~/ $ export REDIS_DB=1
```

## Prepare a local Redis database
```bash
~/ $ redis-cli -n 1
~/ $ 127.0.0.1:6379[1]> SET HIT_COUNT 0
```

## Operate the container
```bash
~/task $ docker build . -t tasky:beta
~/task $ docker run -p 8080:8080 -e REDIS_USERNAME -e REDIS_PASSWORD -e REDIS_HOST -e REDIS_PORT -e REDIS_DB -d tasky:beta
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
