#!/usr/bin/env bash

if [[ "$1" == "api" ]]; then
  echo -e "Restarting API..."

  # Kill any existing sam local start-api processes
  pkill -f "sam local start-api"

  # Wait for all sam local start-api processes to terminate
  while pgrep -f "sam local start-api" > /dev/null; do
    echo "Waiting for sam local start-api to fully stop..."
    sleep 0.5
  done

  echo "sam local start-api stopped."

  # Build project that is in the hello-world directory
  GOARCH=arm64 GOOS=linux go -C hello-world build -o bootstrap

  # Start the local API
  sam local start-api -t template.yaml

elif [[ "$1" == "build" ]]; then
  echo -e "Building bootstrap.."

  # create new build
  make build
else
  echo "Usage: $0 {api|build}"
  exit 1
fi
