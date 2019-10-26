at_italics=$'\e[3m'
at_italicsoff=$'\e[23m'

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} %{$at_italics%}at%{$at_italicsoff%} %{$fg[yellow]%}%m%{$reset_color%} %{$at_italics%}in%{$at_italicsoff%} %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
%(?,%{%F{white}%},%{%F{red}%})›%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$at_italics%}on%{$at_italicsoff%} %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
