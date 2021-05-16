HISTFILE=$XDG_CONFIG_HOME/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$XDG_CONFIG_HOME/zsh/.zshrc'

autoload -Uz compinit
autoload -Uz promptinit
promptinit
compinit
# End of lines added by compinstall

# syntax-highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# auto-sugestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# VIM path config
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

# Apply theme
. $ZDOTDIR/theme_refined

# Aspell spellcheck
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/aspell.ru.pws; repl $XDG_CONFIG_HOME/aspell/aspell.ru.prepl"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(''$XDG_CONFIG_HOME'/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$XDG_CONFIG_HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$XDG_CONFIG_HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$XDG_CONFIG_HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


alias c_zsh="vim $XDG_CONFIG_HOME/zsh/.zshrc"
alias c_xinit="vim $XDG_CONFIG_HOME/X11/xinitrc"
alias c_vim="vim $XDG_CONFIG_HOME/vim/vimrc"
alias c_dwm="cd $XDG_CONFIG_HOME/suckless/dwm"
alias c_dmenu="cd $XDG_CONFIG_HOME/suckless/dmenu"
alias c_st="cd $XDG_CONFIG_HOME/suckless/st"
alias v=vim
alias vf=vifm
alias ~="cd ~"
alias fir0="firefox $HOME/Documents/Articles/0/tags"
