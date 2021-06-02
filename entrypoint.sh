#!/bin/bash

# List all Go environment variables 
go env

# Run two services
$GOPATH/bin/oauth2-proxy \
  --client-id $OAUTH2_CLIENT_ID \
  --client-secret $OAUTH2_CLIENT_SECRET \
  --redirect-url $OAUTH2_REDIRECT_URL \
  --config "./oauth_config.cfg" \
& serve --listen 3000 --no-clipboard .
