
ZNAP_REPOS_DIR=~/.cache/znap/repos
mkdir -p $ZNAP_REPOS_DIR
zstyle ':znap:*' repos-dir $ZNAP_REPOS_DIR
source ~/.znap/znap.zsh

znap prompt sindresorhus/pure

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
[[ -f ~/.extra ]] && source ~/.extra

znap source ohmyzsh/ohmyzsh lib/{clipboard,history,key-bindings}
znap source rupa/z z
znap source changyuheng/fz

znap source zsh-users/zsh-completions
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-syntax-highlighting


ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

unsetopt cdable_vars
unsetopt auto_name_dirs

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Make vim the default editor
export EDITOR="vim"

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

