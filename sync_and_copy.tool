#!/bin/sh

source ./config

SOURCE_FILE="${1}"
FILE_EXT="${SOURCE_FILE##*.}"

UUID=$(uuidgen | tr -d '\n-' | tr '[:upper:]' '[:lower:]')

REMOTE_FILE_NAME="${UUID}.${FILE_EXT}"
REMOTE_URL="${HTTP_HOST}/${REMOTE_FILE_NAME}"

echo "${REMOTE_URL}" | pbcopy && \
  osascript -e 'display notification "Link copied to clipboard" with title "Shmall"'

scp -P"${SSH_PORT}" "${SOURCE_FILE}" "${SSH_USER}@${SSH_HOST}:${REMOTE_DIR_PATH}/${REMOTE_FILE_NAME}" && \
  osascript -e 'display notification "Uploaded successfully." with title "Shmall"' || \
    osascript -e 'display notification "Failed to upload!" with title "Shmall"'
