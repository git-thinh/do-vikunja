#!/bin/bash
envsubst < /etc/vikunja/config.yml.template > /etc/vikunja/config.yml
exec "$@"
