#!/bin/bash
###############################################################################
# File:         tmux.bashrc
# Author:       Jared Bold
# Create Date:  03.17.2016
# Modified Date:03.17.2016
# Description:
#   tmux bashrc file to be loaded by main bashrc
###############################################################################

###############################################################
#			Aliases				      #
###############################################################
alias tmux='tmux -2' # enables 256 color mode

###############################################################
#			Functions			      #
###############################################################
function workBranch() {
  tmux rename-session $(pwd | sed "s|.*/\(dev[0-9]\).*|\1|")-$(git rev-parse --abbrev-ref HEAD | sed "s|HEAD||")
}

function wb() {
  workBranch
}

function fix_rename() {
  echo "tmux-ressurect-automatic-rename started!"
  for session_window in $(tmux list-windows -a -F '#{session_name}:#{window_index}'); do
    tmux set-window-option -t $session_window automatic-rename on
    echo "automatic-rename enabled for $session_window"
  done
}
