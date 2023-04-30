FROM node:16
COPY . .

RUN yarn

RUN yarn prisma generate

RUN yarn build

CMD [ "yarn", "start" ]