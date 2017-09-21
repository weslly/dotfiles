export EDITOR="nvim"
export GIT_EDITOR=$EDITOR
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export is_dev=1

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="wesh"
ZSH_THEME="dieter"


__git_files () {
    _wanted files expl ‘local files’ _files
}

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew brew-cask sudo fabric bower wp-cli pip python lol osx git git-remote-branch sublime zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/share/npm/bin:/Library/Frameworks/Mono.framework/Commands:/Users/weslly/.local/bin:$HOME/.cargo/bin

alias gacp="git add .; git commit -a -m '$1' ; git push origin master"

[ -s "/Users/weslly/.scm_breeze/scm_breeze.sh" ] && source "/Users/weslly/.scm_breeze/scm_breeze.sh"

alias update='sudo softwareupdate -i -a; brew update; brew upgrade'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

alias flush="sudo killall -HUP mDNSResponder"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

alias silent="osascript -e 'set volume output muted true'"
alias loud="osascript -e 'set volume 7'"
alias baixo="osascript -e 'set volume 0.1'"
alias lt="tree -L 1"
alias color='pygmentize -O style=native -f console256 -g'
# alias shred="read -p \"Are you sure? (y/n) \" CONT \n if [ "$CONT" == \"y\" ]; then \n gshred -vfu ./*\n fi"
alias todogit="git grep --color=always --no-index --exclude-standard --heading --break --ignore-case -e ' FIX: *' -e ' TODO: *' | sed -e 's/^[[:space:]]*//'"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

# alias bower='noglob bower'

alias up="cd \$(pwd | ruby -e 'b=[]; a=STDIN.read.split(?/);(1...a.length).each { |i| b << a[0..i].join(?/) }; b.reverse.each { |j| puts j }' | choose)"

alias down="cd \$(ls -1 | choose)"



source `brew --prefix`/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source `brew --prefix`/etc/profile.d/z.sh

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
alias zz="/usr/local/bin/funcoeszz"

function bfind () { find ./* -iname "*$1*" -type f }

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'


alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

function twitch () {
    open http://twitch.tv/$1/chat;
    streamlink -p mpv  --hls-segment-threads 4  http://twitch.tv/$1 ${2:-high};
}

PATH="/Users/weslly/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/weslly/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/weslly/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/weslly/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/weslly/perl5"; export PERL_MM_OPT;

# Alias vim to nvim
# alias :e=nvim
alias vim=$EDITOR
alias vi=$EDITOR


alias ls=exa
#
# Terminal on VIM mode
# set -o vi
#
# bindkey -v
#
# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward
#
# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1"
#     zle reset-prompt
# }
#
# zle -N zle-line-init
# zle -N zle-keymap-select
# # export KEYTIMEOUT=1
#
# # Restore history search on up/down
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search # Up
# bindkey "^[[B" down-line-or-beginning-search # Down
#

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export PATH="/usr/local/opt/qt5/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"


zstyle ':completion:*' special-dirs true

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export DISABLE_AUTO_TITLE="true"

# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"
