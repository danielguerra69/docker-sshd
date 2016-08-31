FROM docker:1.12
# docker ssh front docker is based on alpine
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

# add openssh package and docker-compose
ENV DOCKER_COMPOSE_VERSION 1.8.0
ENV COMPOSE_API_VERSION=1.18

RUN apk --update add py-pip openssh git &&\
    pip install --upgrade pip &&\
    pip install -U docker-compose==${DOCKER_COMPOSE_VERSION}

# script generates new server key, sets sshd config for keybased auth and starts sshd
ADD sshd.sh /bin/sshd.sh

#set env for docker
RUN echo "export DOCKER_HOST='tcp://docker:2375'" >> /etc/profile
#start sshd
CMD ["/bin/sshd.sh"]
