#==================================================
# Build Layer
FROM node:14-slim as build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn --non-interactive --frozen-lockfile

COPY . .

RUN yarn build

#==================================================
# Package install Layer
FROM node:14-slim as node_modules

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn --non-interactive --frozen-lockfile

#==================================================
# Run Layer
FROM gcr.io/distroless/nodejs:14

WORKDIR /app

CMD yarn start