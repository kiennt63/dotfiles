# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# This source code is licensed under the MIT license found in the license file.

CUSTOM_TMUX_COLOR_THEME_FILE=src/custom.conf
CUSTOM_TMUX_COLOR_PALETTE_FILE=src/palette.conf
CUSTOM_TMUX_VERSION=0.3.0
CUSTOM_TMUX_STATUS_CONTENT_FILE="src/custom-status-content.conf"
CUSTOM_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE="src/custom-status-content-no-patched-font.conf"
CUSTOM_TMUX_STATUS_CONTENT_OPTION="@custom_tmux_show_status_content"
# CUSTOM_TMUX_STATUS_CONTENT_DATE_FORMAT="@custom_tmux_date_format"
CUSTOM_TMUX_NO_PATCHED_FONT_OPTION="@custom_tmux_no_patched_font"
_current_dir="$HOME/dotfiles/tmux/themes"

__cleanup() {
  unset -v CUSTOM_TMUX_COLOR_THEME_FILE CUSTOM_TMUX_VERSION
  unset -v CUSTOM_TMUX_STATUS_CONTENT_FILE CUSTOM_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE
  unset -v CUSTOM_TMUX_STATUS_CONTENT_OPTION CUSTOM_TMUX_NO_PATCHED_FONT_OPTION
  # unset -v CUSTOM_TMUX_STATUS_CONTENT_DATE_FORMAT
  unset -v _current_dir
  unset -f __load __cleanup
  tmux set-environment -gu CUSTOM_TMUX_STATUS_TIME_FORMAT
  tmux set-environment -gu CUSTOM_TMUX_STATUS_DATE_FORMAT
}

__load() {
  tmux source-file "$_current_dir/$CUSTOM_TMUX_COLOR_PALETTE_FILE"
  tmux source-file "$_current_dir/$CUSTOM_TMUX_COLOR_THEME_FILE"

  local status_content=$(tmux show-option -gqv "$CUSTOM_TMUX_STATUS_CONTENT_OPTION")
  local no_patched_font=$(tmux show-option -gqv "$CUSTOM_TMUX_NO_PATCHED_FONT_OPTION")
  # local date_format=$(tmux show-option -gqv "$CUSTOM_TMUX_STATUS_CONTENT_DATE_FORMAT")

  if [ "$(tmux show-option -gqv "clock-mode-style")" == '12' ]; then
    tmux set-environment -g CUSTOM_TMUX_STATUS_TIME_FORMAT "%I:%M %p"
  else
    tmux set-environment -g CUSTOM_TMUX_STATUS_TIME_FORMAT "%H:%M"
  fi

  # if [ -z "$date_format" ]; then
  #   tmux set-environment -g CUSTOM_TMUX_STATUS_DATE_FORMAT "%Y-%m-%d"
  # else
  #   tmux set-environment -g CUSTOM_TMUX_STATUS_DATE_FORMAT "$date_format"
  # fi

  if [ "$status_content" != "0" ]; then
    if [ "$no_patched_font" != "1" ]; then
      tmux source-file "$_current_dir/$CUSTOM_TMUX_STATUS_CONTENT_FILE"
    else
      tmux source-file "$_current_dir/$CUSTOM_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE"
    fi
  fi
}

__load
__cleanup
