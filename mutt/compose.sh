#!/usr/bin/env bash

#  ┏━╸┏━┓┏┳┓┏━┓┏━┓┏━┓┏━╸
#  ┃  ┃ ┃┃┃┃┣━┛┃ ┃┗━┓┣╸
#  ┗━╸┗━┛╹ ╹╹  ┗━┛┗━┛┗━╸

is_reply_included=$(rg '^On\s+' | rg 'wrote:$' <"$1" | wc -l)

if [[ $is_reply_included -gt 0 ]]; then
  nvim "+norm /OnOO" "+StripWhitespace" "$1"
else
  nvim "+norm Go" "+StripWhitespace" "$1"
fi
