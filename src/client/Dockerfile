FROM node:20.11.0

ENV http_proxy http://temp:54321@192.168.100.5:3128
ENV https_proxy http://temp:54321@192.168.100.5:3128

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 3000
# required for docker desktop port mapping

CMD ["yarn", "start"]