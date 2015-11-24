FROM docker:1.9
# docker ssh front docker is based on alpine
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

# add openssh package
RUN apk add --update openssh

# script generates new server key, sets sshd config for keybased auth and starts sshd
ADD sshd.sh /bin/sshd.sh

#set env for docker
RUN echo "export DOCKER_HOST='tcp://docker:2375'" >> /etc/profile

#start sshd
CMD ["/bin/sshd.sh"]
