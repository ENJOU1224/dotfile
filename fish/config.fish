if status is-interactive
    # Commands to run in interactive sessions can go here
end
zoxide init fish | source
fzf --fish | source

set -g fish_key_bidings fish_vi_key_bindings

fishrc
fish_user_key_bindings

export FZF_DEFAULT_COMMAND='fdfind -tf --hidden'
export FZF_DEFAULT_CTRL_T_COMMAND='fdfind -tf --hidden'

alias l=eza
alias vim=nvim
alias bat=batcat
alias fd=fdfind

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/enjou/work/miniconda3/bin/conda
    eval /home/enjou/work/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/enjou/work/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/enjou/work/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/enjou/work/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

