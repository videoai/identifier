#!/usr/bin/env bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
#useradd --shell /bin/bash -u $USER_ID -o -c "" -m identifier2
# identifier user already exists, so just need to change their ID
usermod -u $USER_ID identifier

export HOME=/home/identifier

exec /usr/local/bin/gosu identifier "$@"