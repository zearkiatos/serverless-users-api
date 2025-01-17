FROM node:15-alpine
RUN mkdir /usr/local/nvm
USER root
RUN apk update && \
apk upgrade
RUN apk add make g++
WORKDIR /usr/src/app
COPY [".","/usr/src/app"]

RUN npm install
RUN npm install -g serverless
RUN npm install -g vercel

EXPOSE 3000

CMD ["sh", "./docker/entrypoint.sh"]