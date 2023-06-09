#!/bin/bash
################################################################################
# File: aliases.bashrc
# Author: Jared Bold
# Date: 04.02.2018
# Description:
#   This is the minimal set of aliases needed to be comfortable
################################################################################
# Some things are OS Depenedent so get that info first
OS=`uname`

################################################################################
# Shortcuts  #
################################################################################
alias flw='shopt -s checkwinsize && resize > /dev/null 2>&1'
alias l='less' 
alias g='git'
alias c='clear'
alias :q='exit' # In case you are to used to working in vim

alias tf='tail -f'    # Continues to dump file to stdout as it is written 
alias nw='(TMUX="" xterm &)'  # Opens a new terminal window

alias cdg='cd `git top`'

alias xclipp='xargs echo -n | xclip && echo "$(xclip -o)"'
alias xclipc='xargs echo -n | xclip -sel clipboard && echo "$(xclip -o)"'
alias ansi2text='sed -e "s/\x1b\[[0-9;]*m//g"'

################################################################################
# Vim #
################################################################################
alias vi='vim'
alias vimr='vim -R'
alias vimvs='vim -O'
alias vimsp='vim -o'
alias evimrc='vim ~/.vimrc'
alias vimn='vim -U NONE -N'

################################################################################
# ls  #
################################################################################
if [ $OS == "Linux" ]; then
  alias ls='ls --color=auto'
fi
alias ll='ls -la'

################################################################################
# grep  #
################################################################################
if [ $OS == "Linux" ]; then
  alias grep='grep --color=auto'
fi

################################################################################
# functions  #
################################################################################
run_after() {
  PID="$1"
  shift
  CMD="$*"
  watch -g ps -opid -p "$PID"
  $CMD
}
