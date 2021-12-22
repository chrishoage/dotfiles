# Make vim the default editor
export EDITOR='vim'

# Prefer US English and use UTF-8
export LANG='en_US'
export LC_ALL='en_US.UTF-8'

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER='less -X'

# default hightlights and brackets
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
