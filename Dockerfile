FROM docker:1.9
# docker ssh front docker is based on alpine
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

# add openssh package and docker-compose
ENV DOCKER_COMPOSE_VERSION 1.3.1

RUN apk --update add py-pip py-yaml openssh &&\
    pip install -U docker-compose==${DOCKER_COMPOSE_VERSION} &&\
    rm -rf `find / -regex '.*\.py[co]' -or -name apk`

# script generates new server key, sets sshd config for keybased auth and starts sshd
ADD sshd.sh /bin/sshd.sh

#set env for docker
RUN echo "export DOCKER_HOST='tcp://docker:2375'" >> /etc/profile

#start sshd
CMD ["/bin/sshd.sh"]
