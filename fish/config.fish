if status is-interactive
    # Commands to run in interactive sessions can go here
end
zoxide init fish | source
fzf --fish | source

set -g fish_key_bidings fish_vi_key_bindings

fishrc
fish_user_key_bindings
fish_user_alias

export FZF_DEFAULT_COMMAND='fdfind -tf --hidden'
export FZF_DEFAULT_CTRL_T_COMMAND='fdfind -tf --hidden'

