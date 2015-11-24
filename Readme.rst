ssh front for docker:dind

docker run --privileged --name shared-docker -d docker:dind
docker run -d --name ssh-docker --link shared-docker:docker danielguerra/docker-sshd
ssh to ssh-docker
