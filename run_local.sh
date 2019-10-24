#!/bin/bash

PORT=$1

# Incantation taken from https://stackoverflow.com/a/246128/943814
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PATH=$SCRIPT_DIR/tool_bin:$PATH $SCRIPT_DIR/node/bin/node $SCRIPT_DIR/src/index.js $PORT
