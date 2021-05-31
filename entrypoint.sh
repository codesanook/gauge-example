#!/bin/bash
ls

echo $oauth2_client_id
echo $oauth2_client_secret

$GOROOT/bin/oauth2_proxy --client-id $oauth2_client_id --client-secret $oauth2_client_secret -config "./oauth_config.cfg" &
serve --listen 8000 --no-clipboard .
