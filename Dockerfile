FROM quay.io/oauth2-proxy/oauth2-proxy:v7.1.3-amd64 as oauth2

FROM node:12-alpine
EXPOSE 8000
WORKDIR /app

RUN npm install -g serve
COPY --from=oauth2 ./bin/oauth2-proxy oauth2-proxy
RUN chmod +x oauth2-proxy

COPY ./entrypoint.sh ./
RUN chmod +x entrypoint.sh

COPY ./oauth_config.cfg ./
COPY ./reports/html-report/ ./
COPY ./authenticated-emails-list.txt ./

ENTRYPOINT ["./entrypoint.sh"]
