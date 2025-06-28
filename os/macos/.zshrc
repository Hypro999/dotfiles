export PATH=$PATH:~/.local/bin
export EDITOR=/opt/homebrew/bin/nvim

# Stop zsh from eating up the space before the pipe operator after using tab to autocomplete.
export ZLE_REMOVE_SUFFIX_CHARS=""

# Homebrew
export FPATH=$FPATH:/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit
compinit

# FZF
source <(fzf --zsh)
bindkey "ç" fzf-cd-widget

# JVM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/liberica-jdk-21.jdk/Contents/Home
export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-21.jdk/Contents/Home
export SCALA_HOME=/opt/homebrew/opt/scala/idea

# Python
export WORKON_HOME=$HOME/.virtualenvs
source /Library/Frameworks/Python.framework/Versions/3.12/bin/virtualenvwrapper.sh

# Go
export GOPATH=~/.local/go

# Node
export NODE_PATH=$(npm root --quiet -g)

# Haskell
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# MySQL
export PATH="$PATH:/opt/homebrew/opt/mysql-client/bin"

# Shortcuts
alias now="python -c 'import time; print(int(time.time_ns() / 10e6))'"

# git reset
#
# switch to the specified branch, pull it, then delete
# the branch you were previously on.
gr() {
    if [ -z "$1" ]; then
        echo "Usage: gc <branch-to-switch-to>"
        return 1
    fi

    # Record the current git branch
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    if [ "$current_branch" = "$1" ]; then
        echo "Already on branch $1"
        return 1
    fi

    # Switch to the specified branch
    git checkout "$1"

    # Pull from the origin remote
    git pull origin "$1"

    # Delete the previously recorded branch
    git branch -d "$current_branch"
}

