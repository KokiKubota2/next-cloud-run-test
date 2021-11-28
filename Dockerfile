# Install production dependencies.
FROM node:alpine AS deps
WORKDIR .
RUN yarn install --frozen-lockfile

# Copy local code to the container image.
FROM node:alpine AS builder
WORKDIR .
COPY . .
RUN yarn build

# Run the web service on container startup.
FROM node:alpine AS runner
WORKDIR .
CMD yarn start