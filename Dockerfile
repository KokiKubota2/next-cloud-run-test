# Base Layer
FROM node:14.17.0-slim AS base
WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn --frozen-lockfile
COPY . .

# Build Layer
FROM base AS build
WORKDIR /build

COPY --from=base /app ./
RUN yarn build

# Package install Layer
FROM node:14.17.0-slim AS node_modules

WORKDIR /modules

COPY package.json yarn.lock ./
RUN yarn install --non-interactive --frozen-lockfile --production

# Production Run Layer
FROM gcr.io/distroless/nodejs:14
WORKDIR /app

COPY package.json yarn.lock next.config.js ./
COPY --from=build /build/public ./public
COPY --from=build /build/.next ./.next
COPY --from=node_modules /modules/node_modules ./node_modules
CMD ["node_modules/.bin/next start"]