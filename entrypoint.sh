#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /league_highlight/tmp/pids/server.pid

# cronデーモンの起動
service cron start

# cronタブの更新
bundle exec whenever --update-crontab

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
