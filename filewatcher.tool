#!/bin/sh

source ./config

bundle exec filewatcher "${LOCAL_DIR_PATH}/*" './sync_and_copy.tool "${FILENAME}"'
