#!/bin/sh

source ./config

osascript -e 'display notification "Launching Shmall..." with title "Shmall"'

bundle exec filewatcher "${LOCAL_DIR_PATH}/*" './sync_and_copy.tool "${FILENAME}"'
