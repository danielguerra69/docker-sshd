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
create an empty ssh volume
```bash
$ docker create -v /root/.ssh --name ssh-container danielguerra/ssh-container /bin/true
```
create your own keys on your own machine
```bash
$ docker run --volumes-from ssh-container debian:jessie ssh-keygen -q
```
add your pub key to authorized_keys file
```bash
$ docker run --volumes-from ssh-container debian:jessie cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
```
create a copy in your directory (pwd)
```bash
$ docker run --volumes-from ssh-container -v $(pwd):/backup debian:jessie cp -R /root/.ssh/* /backup
```

start docker ssh front
```bash
docker run -d -p 2222:22 --name ssh-docker --volumes-from ssh-container --link shared-docker:docker danielguerra/docker-sshd
```
