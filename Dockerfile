FROM golang:buster
EXPOSE 8000
WORKDIR /app

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g serve

# 1
# RUN go get github.com/oauth2-proxy/oauth2-proxy

# 2
# RUN go get -d -v github.com/oauth2-proxy/oauth2-proxy
# RUN go install -v github.com/oauth2-proxy/oauth2-proxy

# which will put the binary in $GOROOT/bin
RUN wget https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v7.1.3/oauth2-proxy-v7.1.3.linux-amd64.tar.gz
RUN tar -vxf oauth2-proxy-v7.1.3.linux-amd64.tar.gz
RUN mv oauth2-proxy-v7.1.3.linux-amd64/oauth2-proxy .

COPY ./entrypoint.sh ./
RUN chmod +x entrypoint.sh

COPY ./oauth_config.cfg ./
COPY ./reports/html-report/ ./
COPY ./authenticated-emails-list.txt ./

ENTRYPOINT ["./entrypoint.sh"]
