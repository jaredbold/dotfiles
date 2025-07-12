#!/bin/bash
################################################################################
# File: bashrc
# Author: Jared Bold
# Date: 04.02.2018
# Description:
#   This is the minimal set of settings needed to have a working bash
#   environment. This loads extra .bashrc files from ~/.bashrc.d directory
################################################################################
# Bail out if not in an interactive shell
[[ $- != *i* ]] && return

OS=$(uname)
################################################################################
# Default Prompt  #
################################################################################
export PS1='\u:\W$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

################################################################################
# Input  #
################################################################################
set -o vi       # input mode is vim
stty erase '^?' # disable the bell, not sure this is needed
if [ "$OS" == "Linux" ]; then
  if xset q &>/dev/null; then
    xset b off
  fi
fi

################################################################################
# Important exports #
################################################################################
export LS_COLORS=$LS_COLORS:'ow=34;1:' # fix ls color outputs
if command -v nvim &>/dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
export LESS="-Ri -F -X $LESS" # set search to smart-case, do not paginate if less than a page

################################################################################
# Tab Completion  #
################################################################################
shopt | grep -q '^direxpand\b' && shopt -s direxpand
bind "set show-all-if-ambiguous on"
bind "TAB:menu-complete"

################################################################################
# Important Aliases #
################################################################################
alias ..='cd ..'
alias ebrc='vim ~/.bashrc'
alias sbrc='source ~/.bashrc'

#################################################################
# Scripts #
#################################################################
for script in ~/.bashrc.d/*; do
  if [ -x "${script}" ]; then
    source ${script}
  fi
done

#################################################################
# Fix PATH #
#################################################################
if [ -n "$PATH" ]; then
  old_PATH=$PATH:
  PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*} # the first remaining entry
    case $PATH: in
    *:"$x":*) ;;        # already there
    *) PATH=$PATH:$x ;; # not there yet
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi
