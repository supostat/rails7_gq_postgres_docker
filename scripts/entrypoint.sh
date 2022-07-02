#!/bin/bash

unset BUNDLE_PATH
unset BUNDLE_BIN

bundle check || bundle install
(rm ./tmp/pids/* || true) && bundle exec rails s -p 4000 -b 0.0.0.0
