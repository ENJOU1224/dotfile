if status is-interactive
    # Commands to run in interactive sessions can go here
end
zoxide init fish | source
fzf --fish | source

set -g fish_key_bindings fish_vi_key_bindings

fishrc
fish_user_key_bindings
fish_user_alias

