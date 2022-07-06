FROM node:14-alpine
# Installing libvips-dev for sharp Compatability
RUN apk update && apk add  build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev
ARG NODE_ENV=development
# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}

# gyp offline https://github.com/nodejs/node-gyp/issues/1133
# ARG NODE_VER=v14.19.3
# RUN curl -sSL https://unofficial-builds.nodejs.org/download/release/v14.19.3/node-v14.19.3-headers.tar.gz \
#         -o /tmp/node-headers.tgz; \
# RUN curl -sSL https://nodejs.org/download/release/${NODE_VER}/node-${NODE_VER}-headers.tar.gz \
#         -o /tmp/node-headers.tgz; \
# COPY heroku/node-v14.19.3-headers.tar.gz /tmp/node-headers.tgz
# RUN npm config set tarball /tmp/node-headers.tgz

RUN npm add -g concurrently


WORKDIR /opt/
RUN npx create-strapi-app@latest strapi-tmp-project --quickstart --no-run

# TODO
# Remove -dev packages used for Sharp/libvips building
# Remove tmp project