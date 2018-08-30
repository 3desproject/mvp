#!/usr/bin/env bash
mv build.env .env
if ! grep -qn LOGIN= ./.env; then
    read -p 'Enter 3DES Username: ' login
    echo -e '\nLOGIN='$login >> ./.env
fi

if ! grep -qn PASS= ./.env; then
    read -sp 'Enter 3DES Password: ' password
    echo -e '\nPASS='$password >> ./.env
fi

echo -e '[OK]'
echo -e 'Starting 3DES worker...'
docker-compose up -d