#!/bin/bash

./oauth2-proxy \
  --client-id $oauth2_client_id \
  --client-secret $oauth2_client_secret \
  --redirect-url $redirect_url \
  --config "./oauth_config.cfg" \
& serve --listen 3000 --no-clipboard .
