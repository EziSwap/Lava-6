#!/bin/bash

RPC_URL="https://near.lava.build/lava-referer-cbd44f26-4827-4c2e-b78a-d4dbd7e0a616/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

axelar_data=$(curl -A UA -x http://104.233.19.224:5896 --proxy-user tihhlvxl:qatvzutcsmo4 -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"status"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi

    echo "$axelar_data" >> "$OUTPUT_DIR/axelar.txt"

    echo "Axelar data fetched and saved to $OUTPUT_DIR/axelar.txt."
else
    echo "Failed to fetch Axelar data."
fi
