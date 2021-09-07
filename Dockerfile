# This dockerfile is pretty useless
# Why?
#
# I mainly run the bot directly without the need to deploy it to a separate container and let it roam there.
#
# I find this process very tedious to setup and there aren't any guides to help setup a framework of this size properly
#
# A DOCKER CONTAINER SHOULD ONLY BE DEPLOYED DURING A FULL RELEASE

FROM node:latest

#init git
RUN apt-get update
RUN apt-get install -y git

#work dir
RUN mkdir -p /usr/src/yAPI
WORKDIR /usr/src/yAPI

COPY package.json /usr/src/yAPI
RUN npm i

COPY . /usr/src/yAPI

CMD ["bash", "r.sh"]