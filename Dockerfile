FROM golang:1-alpine as builder
# Build oauth2-proxy binary to /go/bin/oauth2-proxy
RUN go get github.com/oauth2-proxy/oauth2-proxy

FROM node:12-alpine
EXPOSE 8000
WORKDIR /app
RUN npm install -g serve@11

COPY --from=builder /go/bin/oauth2-proxy ./
RUN chmod +x oauth2-proxy

COPY ./entrypoint.sh ./
RUN chmod +x entrypoint.sh

COPY ./oauth_config.cfg ./
COPY ./reports/html-report/ ./
COPY ./authenticated-emails-list.txt ./

ENTRYPOINT ["./entrypoint.sh"]
