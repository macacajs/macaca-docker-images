#!/bin/sh

Xvfb -ac -screen scrn 1280x2000x24 :9.0 &

export DISPLAY=:9.0

exec "$@"
