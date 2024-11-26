function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color --bold 1cb698
    printf '%s' $USER
    # set_color B6641C
    set_color efa322
    printf ' at '

    # set_color --bold 1c45b6
		# set_color --bold 245EFF
		# set_color --bold 0d74b3
		set_color --bold 0f83cb
    echo -n (prompt_hostname)
    # set_color B6641C
    set_color efa322
    printf ' in '

    set_color --bold 1cb698
    printf '%s' (prompt_pwd --dir-length=0)
    set_color 7f1919

    # Line 2
    echo
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end
