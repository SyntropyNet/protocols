FROM node:14-alpine as builder
WORKDIR /app
COPY . ./
ENV PUPPETEER_SKIP_DOWNLOAD='true'
RUN npm -g install @asyncapi/generator
RUN npm install -g @asyncapi/html-template
RUN ag platform-protocol.yml @asyncapi/html-template -o ./platform -p singleFile=true --force-write --debug
RUN ag sdn-protocol.yml @asyncapi/html-template -o ./sdn -p singleFile=true --force-write

FROM node:14-alpine

WORKDIR /app
COPY --from=builder ./app/serve.js ./serve.js
COPY --from=builder ./app/platform/index.html ./platform.html
COPY --from=builder ./app/sdn/index.html ./sdn.html
RUN npm install express

EXPOSE 8080

CMD [ "node", "serve.js" ]