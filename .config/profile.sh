#!/bin/sh

OS="unknown:$OSTYPE"

case "$OSTYPE" in
  solaris*)			OS="solaris" ;;
  darwin*)			OS="osx" ;; 
  linux-gnu)		OS=$(grep "^ID" /etc/os-release | cut -f2 -d "=") ;;
  linux-android)	OS="termux" ;;
  bsd*)				OS="bsd" ;;
  msys*)			OS="windows" ;;
esac

export OS
export OLDPATH="$PATH"
export PATH="$HOME/.bin":"$(echo ~/.bin/*/ | sed 's/\/ /:/g;s/\/$/:/g')"$PATH
export LANG=it_IT.UTF-8
export EDITOR=v
#export TERMINAL=termite
export TERM=xterm-256color
export BROWSER=chromium

