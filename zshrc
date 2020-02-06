#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Workaround for: https://github.com/sorin-ionescu/prezto/issues/1744
export HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# ZSH
#

# Path
export PATH="/usr/local/opt/curl/bin:$PATH"

# Language
export LANG=en_US.UTF-8

# Reload ZSH.
alias rr='exec zsh'

# Edit zshrc in VSCode.
alias al='c ~/.zshrc'

# Remove unused aliases
unalias lc

#
# Navigation
#

# Navigate to the previous directory.
alias -- -='cd -'

# Various shortcuts.
alias d='cd ~/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias wk='cd ~/Work'

# Cd to Toaster.
alias toaster='cd /Volumes/Toaster'

# Cd to our custom tmp directory.
alias tmp='cd ~/tmp'

#
# Editors
#

# VSCode.
alias c='code'

# Vim
alias v='vim'

#
# Miscellaneous
#

# GNU grep
alias grep='ggrep'

# Launch a new VLC instance.
alias vvlc='open -n /Applications/VLC.app'

# Streamlink alias.
alias lv='streamlink'

# PS aliases.
alias psa='ps aux'
alias psg='ps aux | grep -i'

# Human readable DF & DU.
alias df='df -h'
alias du='du -h -d 2'

# Clear & list directory.
alias cls='clear; ls'

# LS & grep.
alias lsg='ll | grep -i'

# Make cp & mv to be verbose.
alias cp='cp -v'
alias mv='mv -v'

# Use trash instead of rm.
alias rm='trash'

# Fix aliases when using sudo.
# alias sudo='sudo '

# Bat
alias cat='bat'

# Prettyping
alias ping=prettyping

#
# OSX
#

# Updates.
alias update_os='sudo softwareupdate -i -a;'
alias update_brew='brew -v update; brew upgrade; brew cleanup --prune=30; brew doctor;'
alias update_npm='npm i -g npm; npmgu;'
alias update_gem='sudo gem update --system; sudo gem update'
alias update_pip='pip install -U pip; sudo -H pip-review --auto'
alias update_prezto='cd ~/.zprezto && git pull && git submodule update --init --recursive && cd -'
alias update_all='update_os; update_brew; update_npm; update_prezto'

# Npm global updates
function npmgu() {
  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
  do
      npm -g install "$package"
  done
}

# Clean LaunchServices.
alias lscleanup='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

# Empty trashes on all mounted volumes and the main HDD + Apple's System Logs.
alias empty='sudo \rm -rfv /Volumes/*/.Trashes; sudo \rm -rfv ~/.Trash; sudo \rm -rfv /private/var/log/asl/*.asl'

#
# Internet
#

# Get external IP.
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# Flush Directory Service cache.
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

# Start a Proxy Socks v5.
alias proxy='ssh -C2qTnN -D 8282'

# Dig.
alias dig='dig +nocmd any +multiline +noall +answer'

# Edit the hosts file.
alias hosts='sudo $EDITOR /etc/hosts'

#
# Dev
#

# URL encode.
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Start MongDB.
alias mongodb='mongod -f /usr/local/etc/mongod.conf'

# Delete local branches which have already been merged into the current HEAD.
alias gitcleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# SSH to Zoidberg.
alias zoid='ssh zoidberg'

#
# Projects
#

# Raki
alias raki='wk && cd Raki'
alias rakilog='tail -f ~/Library/Application\ Support/Raki/raki.log'
alias rakipouch='wk && cd pouchdb-server && pouchdb-server -p 5984'

# Muki
alias mukiw='wk && cd muki-worker'
alias mukis='wk && cd muki-server'
alias mukic='wk && cd muki-client'

# ShareY
alias sharey='wk && cd sharey'

# Dotfiles
alias dotfiles='d && cd Work/dotfiles'

# Bot Land
alias bl='cd /Volumes/Work/botland'

#
# Exports
#

# Node REPL configuration.
export NODE_REPL_HISTORY=~/.node_history;
export NODE_REPL_HISTORY_SIZE='10000';

# Homebrew Cask
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

#
# Shortcuts
#

# Add a keybinding to accept suggestions.
bindkey '^ ' autosuggest-accept

#
# Fzf
#

# Add fzf default key bindings.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add custom key bindings.
bindkey '^[OP' fzf-cd-widget

# Options.
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# Custom Ctrl-R that can executes commands when pressing Ctrl-X
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  selected=( $(fc -rl 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort --expect=ctrl-x $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    local accept=0
    if [[ $selected[1] = ctrl-x ]]; then
      accept=1
      shift selected
    fi
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
      [[ $accept = 1 ]] && zle accept-line
    fi
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

#
# Custom commands.
#

# Remove the last added file in the Downloads folder if it matches a set of extensions.
dlrm() {
  validExtensions=("avi" "mkv")

  dl
  file=($(ls -tU | head -n1))
  extension="${file##*.}"

  for ext in "${validExtensions[@]}"
  do
      if [ "$ext" = "$extension" ] ; then
          rm "$file"

          echo "Deleted ${file}"

          break
      fi
  done

  cd - > /dev/null
}

#
# Git
#

# Alias git to hub.
git() {
  # Clone and cd in the cloned directory automatically.
  if [ "$1" = clone ] ; then
    /usr/local/bin/hub clone $2
    cd $(basename $2 | sed 's/.git$//')
  else
    /usr/local/bin/hub "$@"
  fi
}
