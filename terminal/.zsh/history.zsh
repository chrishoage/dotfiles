# configure history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000
# Make some commands not show up in history
export HISTIGNORE='l:la:ls:cd:cd -:pwd:exit:date:* --help'


# If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word.
setopt always_to_end
# If a new command line being added to the history list duplicates an older one, the older command is removed from the list
setopt hist_ignore_all_dups
# ignore commands that start with space
setopt hist_ignore_space
# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first
# record timestamp of command in HISTFILE
setopt extended_history
# show command with history expansion to user before running it
setopt hist_verify
