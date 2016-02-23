#!/bin/bash

exec /usr/bin/websockify --web /noVNC 6080 "$HOSTPORT"
