# Allow backward-kill-word to use slashs as a delimiter
# Word characters are alphanumerics only
autoload -U select-word-style
select-word-style bash

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word
