# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

# allow l and la alias to work when eza is not installed
function l() {
  if (( $+commands[exa] )); then
    exa -l "$@"
  elif (( $+commands[eza] )); then
    exa -l "$@"
  else
    ls -lh "$@"
  fi
}

# alias la to eza or ls
function la() {
  if (( $+commands[exa] )); then
    exa -la "$@"
  elif (( $+commands[eza] )); then
    exa -la "$@"
  else
    ls -lah "$@"
  fi
}


# shortcut to open current directory or passed in argument
function open() {
  if [ $# -eq 0 ]; then
    xdg-open "$(pwd)"
  else
    xdg-open "$@"
  fi
}

function clipcopy() {
  if [ -n "${DISPLAY:-}" ] && (( ${+commands[xclip]} )); then
    xclip -in -selection clipboard < "${1:-/dev/stdin}"
  elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xsel]} )); then
    xsel --clipboard --input < "${1:-/dev/stdin}"
  elif [ -n "${WAYLAND_DISPLAY:-}" ] && (( ${+commands[wl-copy]} )) && (( ${+commands[wl-paste]} )); then
    wl-copy < "${1:-/dev/stdin}"
  elif [[ $OSTYPE == linux-android* ]] && (( $+commands[termux-clipboard-set] )); then
    termux-clipboard-set < "${1:-/dev/stdin}"
  elif [ -n "${TMUX:-}" ] && (( ${+commands[tmux]} )); then
    tmux load-buffer "${1:--}"
  fi
}

function clippaste() {
  if [ -n "${DISPLAY:-}" ] && (( ${+commands[xclip]} )); then
    xclip -out -selection clipboard
  elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xsel]} )); then
    xsel --clipboard --output
  elif [ -n "${WAYLAND_DISPLAY:-}" ] && (( ${+commands[wl-copy]} )) && (( ${+commands[wl-paste]} )); then
    wl-paste
  elif [[ $OSTYPE == linux-android* ]] && (( $+commands[termux-clipboard-set] )); then
    termux-clipboard-get
  elif [ -n "${TMUX:-}" ] && (( ${+commands[tmux]} )); then
    tmux save-buffer -
  fi
}

