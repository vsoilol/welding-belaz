FROM node:20.11.0

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 3000
# required for docker desktop port mapping

CMD ["yarn", "start"]