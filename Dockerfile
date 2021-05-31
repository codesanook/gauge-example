FROM golang:buster
EXPOSE 8080
WORKDIR /app

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g serve

# 1
# RUN go get github.com/oauth2-proxy/oauth2-proxy

# 2
RUN go get -d -v github.com/oauth2-proxy/oauth2-proxy
RUN go install -v github.com/oauth2-proxy/oauth2-proxy

# which will put the binary in $GOROOT/bin
COPY ./auth_config.cfg /
COPY ./entrypoint.sh /
COPY ./reports/htmt-report/ /

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
