# Base Layer
FROM node:14.17.0-slim AS base
WORKDIR .
RUN yarn --frozen-lockfile

# Build Layer
FROM base AS build
WORKDIR .
RUN yarn build

# Production Run Layer
FROM gcr.io/distroless/nodejs:14
WORKDIR .
CMD yarn start