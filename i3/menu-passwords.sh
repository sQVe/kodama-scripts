#!/usr/bin/env bash

#  ┏┳┓┏━╸┏┓╻╻ ╻   ┏━┓┏━┓┏━┓┏━┓╻ ╻┏━┓┏━┓╺┳┓┏━┓
#  ┃┃┃┣╸ ┃┗┫┃ ┃   ┣━┛┣━┫┗━┓┗━┓┃╻┃┃ ┃┣┳┛ ┃┃┗━┓
#  ╹ ╹┗━╸╹ ╹┗━┛   ╹  ╹ ╹┗━┛┗━┛┗┻┛┗━┛╹┗╸╺┻┛┗━┛

passwords=$(fd --extension gpg . "$PASSWORD_STORE_DIR" | sed "s#$PASSWORD_STORE_DIR/##" | sed 's/\.gpg$//')
choice="$(echo "$passwords" | rofi -kb-accept-entry "Return" -dmenu -theme-str 'inputbar { children: [prompt, entry]; }' -p 'password: ')"

if [[ -n "$choice" ]]; then
  if pass show --clip "$choice"; then
    notify-send -t 1000 -i password "Password copied" "$choice"
  else
    notify-send -t 1000 -i password "Failed to copy password" "$choice"
  fi
fi
