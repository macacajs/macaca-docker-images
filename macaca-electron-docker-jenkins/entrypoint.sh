#!/bin/sh

Xvfb -ac -screen scrn 1280x800x24 :99.0 &

exec "$@"
