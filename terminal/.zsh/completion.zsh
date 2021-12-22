# Automatically use menu completion after the second consecutive request for completion
setopt auto_menu
# completion is done from both ends of the cursor.
setopt complete_in_word

# bind shift tab to reverse menu compelte
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Restore hyphen tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Allow colors in completions
zstyle ':completion:*' list-colors ''
# Highlight current completion option in list
zstyle ':completion:*:*:*:*:*' menu select
