#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate VERSION=20240223104938
bundle exec rails db:migrate VERSION=20240223124154
bundle exec rails db:migrate VERSION=20240224004522
bundle exec rails db:migrate VERSION=20240223110247
bundle exec rails db:migrate VERSION=20240223110728
bundle exec rails db:migrate VERSION=20240223110846
bundle exec rails db:migrate VERSION=20240223114443
bundle exec rails db:migrate VERSION=20240224020332

