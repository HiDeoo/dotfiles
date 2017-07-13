#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# ZSH
#

# Reload ZSH.
alias rr='exec zsh'

# Edit aliases in VSCode.
alias al='c ~/.zshrc'

# Navigate to the previous directory.
alias -- -='cd -'

#
# Navigation
#

# Various Shortcuts.
alias d='cd ~/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias wk='cd ~/Dropbox/Work'

#
# Editors
#

# Sublime Text.
alias s='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# Atom.
alias a='atom'

# VSCode.
alias c='code'

#
# OSX
#

# Updates.
alias update_os='sudo softwareupdate -i -a;'
alias update_brew='brew -v update; brew upgrade --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor;'
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

# Empty trashes on all mounted volumes and the main HDD + Apple’s System Logs.
alias empty='sudo rmn -rfv /Volumes/*/.Trashes; sudo rmn -rfv ~/.Trash; sudo rmn -rfv /private/var/log/asl/*.asl'

#
# Internet
#

# Get external IP.
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# Flush Directory Service cache.
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

# Upload torrents.
alias uptorrents='sh -c "scp ~/Downloads/*.torrent hideo@dedibox:torrents/watch && rmn ~/Downloads/*.torrent"'

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

# SSH into Vagrant.
alias vm='ssh vagrant@127.0.0.1 -p 2222'

# Start MongDB.
alias mongodb='mongod -f /usr/local/etc/mongod.conf'

# Delete local branches which have already been merged into the current HEAD.
alias gitcleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

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
alias psg='ps aux | grep'

# HTOP.
alias htop='sudo htop'

# Human readable DF & DU.
alias df='df -h'
alias du='du -h -d 2'

# Clear & list directory.
alias cls='clear; ls'

# LS & grep.
alias lsg='ll | grep'

# Make cp, mv & rm to be verbose.
alias cp='cp -v'
alias mv='mv -v'
alias rmn='/bin/rm -i -v'

# Use trash instead of rm.
alias rm='trash'

# Fix aliases when using sudo.
alias sudo='sudo '

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
alias sharey='wk && cd ShareY'

# Dotfiles
alias dotfiles='wk && cd dotfiles'

#
# Exports
#

# Node REPL configuration.
export NODE_REPL_HISTORY=~/.node_history;
export NODE_REPL_HISTORY_SIZE='10000';

# Homebrew Cask
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

#
# NVM
#

# Lazy load nvm when needed only to improve startup time.
function nvm() {
  unset -f nvm
  source $(brew --prefix nvm)/nvm.sh
  nvm "$@"
}

#
# Shortcuts
#

# Add a keybinding to accept suggestions.
bindkey '^ ' autosuggest-accept
