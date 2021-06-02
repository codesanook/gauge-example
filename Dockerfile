FROM golang:latest
EXPOSE 8000
WORKDIR /app

# Build oauth2-proxy binary to $GOPATH/bin/oauth2-proxy
RUN go get github.com/oauth2-proxy/oauth2-proxy

# Prepare serve
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g serve

COPY ./entrypoint.sh ./
RUN chmod +x entrypoint.sh

COPY ./oauth_config.cfg ./
COPY ./reports/html-report/ ./
COPY ./authenticated-emails-list.txt ./

ENTRYPOINT ["./entrypoint.sh"]
