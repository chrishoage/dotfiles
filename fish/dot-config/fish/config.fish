fish_add_path "$HOME/.local/bin"

if test -d /opt/homebrew/bin
    /opt/homebrew/bin/brew shellenv | source
end

starship init fish | source

if not test -f $__fish_config_dir/functions/fisher.fish
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
        --create-dirs -o $__fish_config_dir/functions/fisher.fish
    source $__fish_config_dir/functions/fisher.fish
    fisher install 0rax/fish-bd
end

set --global fish_key_bindings fish_default_key_bindings

set nix_profile /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish

if test -f $nix_profile
    source $nix_profile
end

if command -q zoxide
    zoxide init fish | source
end

if command -q direnv
    direnv hook fish | source
end

if command -q fzf
    fzf --fish | source
end