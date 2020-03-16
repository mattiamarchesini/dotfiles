#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

stty -ixon #disables ctrl-s and ctrl-q
shopt -s autocd #automatically cd by typing directory name

alias e='exit'

#echo -e '\e[6 q'	#change to bar
clear
