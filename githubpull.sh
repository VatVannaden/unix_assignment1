#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: githubpull [GITHUB-URL]"
  exit 1
fi

url="$1"
username=$(basename "$url")
output_file="${username}.txt"

curl -s "https://api.github.com/users/${username}/repos" | \
jq -r '.[].name' > "$output_file"

echo "Repositories saved to $output_file"
