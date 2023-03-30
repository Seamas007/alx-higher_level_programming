#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <url>"
    exit 1
fi

url="$1"

response=$(curl -sI $url)
content_length=$(echo "$response" | grep -i content-length | awk '{print $2}')

if [[ -z $content_length ]]; then
    echo "Could not determine content length"
    exit 1
fi

echo "Content length: $content_length bytes"
