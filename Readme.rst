ssh front for docker:dind

### Dependencies

* [![2.0.0](https://badge.imagelayers.io/docker.svg)](https://imagelayers.io/?images=docker:1.9 '1.9') docker:1.9

### Image Size

* [![Latest](https://badge.imagelayers.io/danielguerra/docker-sshd.svg)](https://imagelayers.io/?images=danielguerra/docker-sshd:latest 'latest') danielguerra/docker-sshd

### Usage

start docker dind server
```bash
docker run --privileged --name shared-docker -d docker:dind
```
start docker ssh front
```bash
docker run -d --name ssh-docker --link shared-docker:docker danielguerra/docker-sshd
```
