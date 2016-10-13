#!/bin/bash

docker run -d \
    -p 27015:27015/udp \
    -p 27016:27016/udp \
    -p 9999:9999 \
    --name ns2server -t -i ns2-server 
