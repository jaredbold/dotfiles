#!/bin/bash
###############################################################################
# File:         cvs.bashrc
# Author:       Jared Bold
# Date:         04.02.2018
# Description:
#   cvs bashrc file to be loaded by main bashrc
###############################################################################

###############################################################################
#                             Aliases                                         #
###############################################################################
alias cvscheck='cvs -nq update'
alias cvscheck_modified='cvscheck | grep "^M"'
alias cvscheck_new='cvscheck | grep "^?"'
alias cvscheck_update='cvscheck | grep "^U"'
alias cvscheck_patch='cvscheck | grep "^P"'
alias cvsreset='cvs update -C'
alias cvsmod="cvscheck_modified > $USER.mod; cat $USER.mod"

