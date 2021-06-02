#!/bin/sh

# Run oauth2-proxy and serve services
./oauth2-proxy \
  --client-id $OAUTH2_CLIENT_ID \
  --client-secret $OAUTH2_CLIENT_SECRET \
  --redirect-url $OAUTH2_REDIRECT_URL \
  --config "./oauth_config.cfg" \
& serve --listen 3000 --no-clipboard .
