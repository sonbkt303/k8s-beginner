ARG version=20-alpine

FROM node:${version} AS base
WORKDIR /base

# Install pnpm
RUN npm install -g pnpm

COPY package.json .
COPY pnpm-lock.yaml .

RUN pnpm install

COPY . .

RUN pnpm build

FROM node:${version} AS production

RUN npm install -g pnpm

WORKDIR /app

COPY --from=base /base/package.json .
COPY --from=base /base/pnpm-lock.yaml .
COPY --from=base /base/dist ./dist
# COPY --from=base /base/node_modules ./node_modules

RUN pnpm install --production

# Serve the build output using an HTTP server (e.g., serve)
RUN npm install -g serve

# Command to run the application
CMD ["serve", "-s", "dist"]