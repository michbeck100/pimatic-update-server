FROM node:18-slim as builder

ADD *.json *.coffee /build/
WORKDIR /build
RUN npm install

FROM node:18-slim

RUN npm install -g coffee-script

COPY --from=builder /build /pimatic-update-server/

WORKDIR /pimatic-update-server

RUN mkdir cache

CMD coffee server.coffee

