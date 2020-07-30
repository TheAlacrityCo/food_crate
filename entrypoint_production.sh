#!/usr/bin/env bash
cd /farm_link

# Create the Rails production DB on first run
RAILS_ENV=production bundle exec rake db:create

# Make sure we are using the most up to date
# database schema
RAILS_ENV=production bundle exec rake db:migrate

# Do some protective cleanup
> log/production.log
rm -f /farm_link/tmp/pids/server.pid

# Run the web service on container startup
# $PORT is provided as an environment variable by Cloud Run
bundle exec rails server -e production -b 0.0.0.0 -p 3000