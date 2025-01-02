alias la="ls -a"
alias cls="clear"

# Get current unix timestamp in milliseconds.
alias now="python -c 'import time; print(int(time.time_ns() / (10**6)))'"

export PATH=$PATH:~/.local/bin
export EDITOR=/opt/homebrew/bin/nvim

# Stop zsh from eating up the space before the pipe operator after using tab to autocomplete.
export ZLE_REMOVE_SUFFIX_CHARS=""

# Homebrew
export FPATH=$FPATH:/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit
compinit

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey "ç" fzf-cd-widget

# Go
export GOPATH=~/.local/go

# Python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /Library/Frameworks/Python.framework/Versions/3.12/bin/virtualenvwrapper.sh

# Node
export NODE_PATH=$(npm root --quiet -g)

# JVM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/liberica-jdk-21-full.jdk/Contents/Home
export SCALA_HOME=/opt/homebrew/opt/scala/idea

# git reset (complete / garbage collect branch)
function gr() {
    if [ -z "$1" ]; then
        echo "Usage: gr <branch>"
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

# Add git branch name to prompt.
function git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch') '
  fi
}
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f %F{green}$(git_branch_name)%f%# '
