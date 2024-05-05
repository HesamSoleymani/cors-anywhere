FROM hub.hamdocker.ir/node:16 as builder
ARG NODE_OPTIONS
WORKDIR /app 
COPY package.json yarn.lock ./
RUN yarn install 
COPY . .


FROM hub.hamdocker.ir/node:16 as runner
WORKDIR /app
ENV NODE_ENV production
COPY --from=builder /app/ ./

CMD ["yarn", "start"]