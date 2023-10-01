#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vim='nvim'

if [ -f ~/.zsh_aliases ]; then 
    . ~/.zsh_aliases
fi

if [ -d ~/.zshrc.d ]; then
	for rc in ~/.zshrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc
