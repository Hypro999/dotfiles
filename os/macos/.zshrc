export PATH=$PATH:~/.local/bin
export EDITOR=/opt/homebrew/bin/nvim

# Homebrew
export FPATH=$FPATH:/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit
compinit

# FZF
source /opt/homebrew/Cellar/fzf/0.44.1/shell/key-bindings.zsh
bindkey "ç" fzf-cd-widget

# Go
export GOPATH=$PATH:~/.local/go

# Python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /opt/homebrew/bin/virtualenvwrapper.sh

# Stop zsh from eating up the space before the pipe operator after using tab to autocomplete.
export ZLE_REMOVE_SUFFIX_CHARS=""
