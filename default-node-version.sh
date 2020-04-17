#!/usr/bin/env bash

#  ╺┳┓┏━╸┏━╸┏━┓╻ ╻╻  ╺┳╸   ┏┓╻┏━┓╺┳┓┏━╸   ╻ ╻┏━╸┏━┓┏━┓╻┏━┓┏┓╻
#   ┃┃┣╸ ┣╸ ┣━┫┃ ┃┃   ┃    ┃┗┫┃ ┃ ┃┃┣╸    ┃┏┛┣╸ ┣┳┛┗━┓┃┃ ┃┃┗┫
#  ╺┻┛┗━╸╹  ╹ ╹┗━┛┗━╸ ╹    ╹ ╹┗━┛╺┻┛┗━╸   ┗┛ ┗━╸╹┗╸┗━┛╹┗━┛╹ ╹

base_path=$NVM_DIR/versions/node
default_version=$(cat "$NVM_DIR/alias/default")
available_versions=$(ls -1 "$base_path")

function get_default_version() {
  rg "$default_version" <<<"$available_versions"
}

function get_latest_version() {
  echo "$available_versions" | sort -V | tail -n 1
}

version=$(get_default_version || get_latest_version) &&
  echo "$base_path/$version/bin"
