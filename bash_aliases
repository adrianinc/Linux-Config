
# some more ls aliases
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'
alias em='emacs -nw'
alias dd='dd status=progress'
alias _='sudo'
alias _i='sudo -i'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# workingdir aliases
alias workingdir='source workingdir'
alias wkgdir='cd $WKG_DIR'

# Update VIM plugins
alias vimpluginupdate="vim -c ':PlugUpdate' -c ':CocUpdate' -c ':qa'"

# pyvenv aliases 
# pyvenv is used to quickly list and launch a python virtual environment
alias pyvenv='source pyvenv'

