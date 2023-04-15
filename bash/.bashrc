#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1="\[\033[0;34m\][\u \W]\$\\[\033[00m\] "

# enable bash completion in interactive shells
#. /usr/share/bash-completion/bash_completion


# VIM
# export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

alias c_zsh="vim $XDG_CONFIG_HOME/zsh/.zshrc"
alias c_xinit="vim $XDG_CONFIG_HOME/X11/xinitrc"
alias c_vim="cd $XDG_CONFIG_HOME/vim"
alias c_dwm="cd $XDG_CONFIG_HOME/suckless/dwm"
alias c_dmenu="cd $XDG_CONFIG_HOME/suckless/dmenu"
alias c_st="cd $XDG_CONFIG_HOME/suckless/st"
alias v=vim
alias vf=vifm
alias ~="cd ~"
alias fir0="firefox $HOME/docs/Articles/0/tags"
alias mkcd='{ IFS= read -r d && mkdir "$d" && cd "$d"; } <<<'
alias gdb="gdb -q"
alias bc="bc -ql"
alias ll="ls -la"
