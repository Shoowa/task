# Guide

## Prepare a Redis database
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
