#!/usr/bin/env bash

#  ┏━╸┏━┓┏┳┓┏━┓┏━┓┏━┓┏━╸
#  ┃  ┃ ┃┃┃┃┣━┛┃ ┃┗━┓┣╸
#  ┗━╸┗━┛╹ ╹╹  ┗━┛┗━┛┗━╸

nvim "+norm ggOO" "+StripWhitespace" "$1"
