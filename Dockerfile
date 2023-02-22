#################
# Build the app #
#################
FROM node:18-bullseye as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
RUN ng build --configuration production --output-path=/dist

################
# Run in NGINX #
################
FROM nginx:1.23.1 as base
COPY --from=build /dist /usr/share/nginx/html

CMD ["/bin/sh",  "-c",  "exec nginx -g 'daemon off;'"]
