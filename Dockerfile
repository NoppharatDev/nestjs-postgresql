FROM node:16.14.2-alpine
ENV NODE_ENV = production

WORKDIR /app

COPY [ "package.json", "package-lock.json", "./" ]

RUN npm instaill --frozen-lockfile --production

COPY . .

RUN npm i -g @nestjs/cli 
RUN npm run build

CMD [ "npm", "run", "start:prod" ]