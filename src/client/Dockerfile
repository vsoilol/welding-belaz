FROM node:16.20.2

ENV http_proxy http://temp:54321@192.168.100.5:3128
ENV https_proxy http://temp:54321@192.168.100.5:3128

WORKDIR /app

COPY ./package*.json .

RUN npm ci

COPY . .

EXPOSE 3000
# required for docker desktop port mapping

CMD ["npm", "start"]