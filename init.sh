#!/bin/bash

alias svnd="svn st | grep '^[MA]' --color"
alias mantmux="man M /home/xx/local/share/man/man1/tmux.1"
alias grep="grep --color"
#export PS1="\[\e[32m\][#\##\[\e[31m\]\u\[\e[32m\]@\[\e[31m\]\h \[\e[35m\]\w\[\e[32m\]]$\[\e[m\]"
export PS1="\[\e[32m\][#\##\[\e[31m\]\u\[\e[32m\]@\[\e[31m\]`hostname -i` \[\e[35m\]\w\[\e[32m\]]$\[\e[m\]"

#make vim not overwrite the content in window after vim exits
export TERM=xterm
