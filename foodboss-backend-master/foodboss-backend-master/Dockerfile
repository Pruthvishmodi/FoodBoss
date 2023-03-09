FROM strapi/base
WORKDIR /opt/app
COPY ./package.json ./
COPY ./yarn.lock ./
RUN yarn install --ignore-engines
COPY ./ .
ENV NODE_ENV production
ENV DATABASE_CLIENT=postgres
ENV DATABASE_NAME=strapi
ENV DATABASE_HOST=postgres
ENV DATABASE_PORT=5432
ENV DATABASE_USERNAME=strapi
ENV DATABASE_PASSWORD=strapi
ENV APP_KEYS=0oyQOe5xQAB/aiQY/2wMgA==,E5AH4Efb1XWQIbPggeE2/w==,vkjjUKBbH8VWP2ES0xvgTw==,uWVEi/4dWAGCgASXBwpnTw==
ENV API_TOKEN_SALT=wdo3OEcXLytkui7mujUVnw==
ENV ADMIN_JWT_SECRET=QLb2+yrjmBryNZ7q37mk6w==
ENV JWT_SECRET=S9IX2B5F4g0+Mw0gKliHPg==
RUN yarn build
EXPOSE 1337
CMD ["yarn", "start"]