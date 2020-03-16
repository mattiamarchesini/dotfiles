#
# ~/.bash_profile
#

source ~/.config/profile.sh

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx 2>/dev/null
fi

