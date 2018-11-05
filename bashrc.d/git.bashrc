#!/bin/bash
###############################################################################
# File:         git.bashrc
# Author:       Jared Bold
# Date:         04.02.2018
# Description:
#   git bashrc file to be loaded by main bashrc
###############################################################################
. ~/.git-completion.bash
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\u:\W$(__git_ps1 " (%s)")\$ '

alias git_enable_tracking='export GIT_PS1_SHOWDIRTYSTATE=1 && export GIT_PS1_SHOWUNTRACKEDFILES=1;'
alias git_disable_tracking='export GIT_PS1_SHOWDIRTYSTATE=0 && export GIT_PS1_SHOWUNTRACKEDFILES=0;'
