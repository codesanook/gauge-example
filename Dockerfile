FROM golang:buster
EXPOSE 8000

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g serve

# 1
RUN go get github.com/oauth2-proxy/oauth2-proxy

# 2
# RUN go get -d -v github.com/oauth2-proxy/oauth2-proxy
# RUN go install -v github.com/oauth2-proxy/oauth2-proxy

# which will put the binary in $GOROOT/bin


WORKDIR /app
COPY ./entrypoint.sh ./
RUN chmod +x entrypoint.sh

COPY ./oauth_config.cfg ./
COPY ./reports/html-report/ ./

ENTRYPOINT ["./entrypoint.sh"]
