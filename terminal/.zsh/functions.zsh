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

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# allow l and la alias to work when exa is not installed
function l() {
  if (( $+commands[exa] )); then
    exa -l "$@"
  else
    ls -lh "$@"
  fi
}

# alias la to exa or ls
function la() {
  if (( $+commands[exa] )); then
    exa -la "$@"
  else
    ls -lah "$@"
  fi
}
