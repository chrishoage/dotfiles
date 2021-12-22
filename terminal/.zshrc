ZNAP_REPOS_DIR=~/.cache/znap/repos
mkdir -p $ZNAP_REPOS_DIR
zstyle ':znap:*' repos-dir $ZNAP_REPOS_DIR
source ~/.znap/znap.zsh

# show prmopt as early as possible
znap prompt sindresorhus/pure

for file in ~/.zsh/*.zsh; do
  source "$file"
done

[[ -f ~/.extra ]] && source ~/.extra

znap source rupa/z
znap source changyuheng/fz
znap source Tarrasch/zsh-bd
znap source marlonrichert/zsh-hist

znap source zsh-users/zsh-completions

znap source zsh-users/zsh-syntax-highlighting

znap source zsh-users/zsh-history-substring-search
# configure zsh-history-substring-search with binding UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh

[[ -x $(which op) ]] && znap fpath _op 'op completion zsh'
