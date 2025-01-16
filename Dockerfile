FROM node:20-alpine AS base
WORKDIR /app
RUN npm install -g pnpm@9
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .

FROM base AS test
RUN pnpm test


FROM base AS app
RUN pnpm install --prod --frozen-lockfile
CMD [ "npm", "start" ]
