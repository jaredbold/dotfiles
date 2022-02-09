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
