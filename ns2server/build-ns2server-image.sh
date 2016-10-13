#!/bin/bash

docker build --no-cache=true \
    --build-arg NS2_MODS="28eb0f83 2DE2436F" \
    --build-arg NS2_SERVER_IP=1.2.3.4 \
    --build-arg NS2_SERVER_NAME="Oh Oh Oh" \
    --build-arg NS2_STEAM_USERNAME=ohohoh \
    --build-arg NS2_STEAM_PASSWORD=ohohoh \
    --build-arg NS2_WEB_ADMIN_PASSWORD=ohohoh \
    -t ns2-server .

