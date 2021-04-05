# Node and install Step

FROM node:fermium-alpine as builder

WORKDIR "/usr/app"

COPY package.json .

RUN yarn

COPY . .

RUN yarn build

# nginx step

FROM nginx

COPY --from=builder /usr/app/build usr/share/nginx/html
