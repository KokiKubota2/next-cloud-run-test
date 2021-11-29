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
FROM node:14-slim

WORKDIR /app

COPY package.json yarn.lock next.config.js ./

COPY --from=build /app/build /app/build
COPY --from=node_modules /app/node_modules /app/node_modules

CMD yarn start