#!/bin/bash
################################################################################
# File: base-16.bashrc
# Author: Jared Bold
# Date: 04.23.2019
# Description:
#   init settings for base-16
################################################################################
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] &&
  [ -s "$BASE16_SHELL/profile_helper.sh" ] &&
  source "$BASE16_SHELL/profile_helper.sh"
