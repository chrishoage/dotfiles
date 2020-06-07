export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/grep", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/compfix", from:oh-my-zsh, defer:0
zplug "lib/completion", from:oh-my-zsh, defer:0
zplug "plugins/rsync", from:oh-my-zsh
zplug "laggardkernel/zsh-gpg-agent", if:"which gpg-agent"
zplug "rupa/z", use:z.sh, defer:0
zplug "changyuheng/fz", defer:1

zplug "~/.zsh", from:local
zplug "~/.zsh", from:local, as:theme
zplug "~/", use:".extra", from:local, if:"[[ -f ~/.extra ]]"

zplug "zsh-users/zsh-completions", defer:0
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="false"
APPEND_HISTORY="true"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

unsetopt cdable_vars
unsetopt auto_name_dirs

zplug load

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Make vim the default editor
export EDITOR="vim"

# Make focused-space-browser util default browser
export BROWSER=focused-space-browser

# Make some commands not show up in history
export HISTIGNORE="l:la:ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind shift tab to reverse menu compelte
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Restore hyphen tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

