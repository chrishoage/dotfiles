[ -f /etc/profile ] && . /etc/profile

# Load profiles from ~/.config/profile.d
if test -d ~/.config/profile.d/; then
  for profile in ~/.config/profile.d/*.sh; do
    test -r "$profile" && . "$profile"
  done
  unset profile
fi

export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
