autoload -Uz compinit promptinit
promptinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

bindkey -e

HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source $ZDOTDIR/refined.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias v=nvim
alias bc="bc -ql"
alias l=ls
alias ll="ls -l"
alias la="ll - a"
alias hx=helix
