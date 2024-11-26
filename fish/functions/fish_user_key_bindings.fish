function fish_user_key_bindings
	bind -M insert	 \cl	forward-char
	bind -M insert	 \ck	forward-word
	bind -M insert	 \ch	backward-word
	bind -M insert	 \ca	beginning-of-line
	bind -M insert	 \ce	end-of-line
	bind -M default		 H		beginning-of-line
	bind -M default		 L		end-of-line
  fzf_key_bindings
end
