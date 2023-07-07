# syntax = docker/dockerfile:1
FROM python:3.11.3-slim as builder

RUN useradd peon -rm --user-group -u 1000 --no-log-init -s /bin/bash
WORKDIR /home/peon

# Update pip
RUN pip install --upgrade pip

# Copy the source code and list of dependencies.
COPY ./app /home/peon/code

# Install dependencies.
RUN pip install --no-cache-dir -r ./code/requirements.txt

# Define Python build environ. This will be overriden by Docker-Compose.
USER peon
ENV FLASK_DEBUG=false
ENV FLASK_APP=/home/peon/code/server.py

EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["code/server.py"]
