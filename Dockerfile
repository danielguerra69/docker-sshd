FROM docker:1.12
# docker ssh front docker is based on alpine
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

# add openssh package and docker-compose
ENV DOCKER_COMPOSE_VERSION 1.8.0
ENV COMPOSE_API_VERSION=1.18

RUN apk --update add py-pip openssh git &&\
    pip install --upgrade pip &&\
    pip install -U docker-compose==${DOCKER_COMPOSE_VERSION} &&\
    rm -rf /tmp/* /var/cache/apk/*

# configure container
ADD docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

#start sshd
CMD ["/usr/sbin/sshd","-D"]
