#################
# Build the app #
#################
FROM node:18-bullseye
RUN mkdir /app
WORKDIR /app
COPY package.json package-lock.json /app

RUN npm install
COPY . /app
EXPOSE 9000
CMD ["npm",  "start"]
