alias la="ls -a"
alias cls="clear"

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

# SSH into Google Pixel 8
alias pixel="ssh -p 8022 u0_a295@10.0.0.164"

# JVM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/liberica-jdk-21-full.jdk/Contents/Home
export SCALA_HOME=/opt/homebrew/opt/scala/idea

# MySQL
export PATH="$PATH:/opt/homebrew/opt/mysql-client/bin"

# Music
mp3download () {
	workon ytdlp
	python ~/Code/Tools/ytdlpw.py
}

mp3tag () {
	workon ytdlp
	python ~/Code/Tools/tag.py
}

mp3sync () {
	if [ -d "/Volumes/One Touch" ]; then
		echo "======================"
		echo "Syncing with One Touch"
		echo "======================"
		rsync -aP "/Users/hemanth/Music/Volume 9" "/Volumes/One Touch/Music"
	else
		echo "======================="
		echo "One Touch not available"
		echo "======================="
	fi
	if [ "$(nmap -A 10.0.0.164 -p 8022 | grep open)" = "8022/tcp open  ssh     OpenSSH 9.5 (protocol 2.0)" ]; then
		echo
		echo "==========================="
		echo "Syncing with Google Pixel 8"
		echo "==========================="
		rsync -aP "/Users/hemanth/Music/Volume 9" u0_a295@10.0.0.164:'"/data/data/com.termux/files/home/storage/music"'
	else
		echo
		echo "============================"
		echo "Google Pixel 8 not available"
		echo "============================"
	fi
}

# git reset (complete / garbage collect branch)
function gr() {
    if [ -z "$1" ]; then
        echo "Usage: gc <branch>"
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
