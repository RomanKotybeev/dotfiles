export TERMINAL=alacritty
export BROWSER=firefox
export EDITOR=nvim
export LOCKSCREEN="i3lock -c 000000"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_STATE_HOME=$HOME/.local/state

# ZSH
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# X11
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$HOME/.config/X11/.Xauthority"
export WM=i3

# Conda
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"

# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

# Disable files
export LESSHISTFILE=-

# locale
export LANG=en_US.UTF-8

# Aspell
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/aspell.ru.pws; repl $XDG_CONFIG_HOME/aspell/aspell.ru.prepl"

# Local TeX Live TeXmf tree, TeXmf caches and config
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# Python startup file
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python3/pythonrc.py"

# SQLite
# sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history

# Jupyter/IPython
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# GDB
export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history

# Calculator
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history

# GNU readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# DOOM Emacs
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export DOOMLOCALDIR="$XDG_CONFIG_HOME/emacs/.local"

# Racket
export PLTUSERHOME="$XDG_DATA_HOME"/racket

# Nodejs
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

PATH="$HOME/.local/bin:/usr/sbin:/sbin:$PATH"

#. $HOME/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
	exec Hyprland
fi

if [ "$(tty)" = "/dev/tty2" ]; then
	startx $XINITRC
fi
