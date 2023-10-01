# ZSH Theme - Preview: https://raw.githubusercontent.com/Eshaan7/ParrotTerm/master/preview.png
# Mod of the gnzh theme and blokkzh theme

setopt prompt_subst


(){

    local PR_USER PR_USER_OP PR_PROMPT PR_HOST PR_AT
    local userName hostName atSign promptSign
    local returnSymbol promptSymbolFrom promptSymbolTo promptSymbol 

# Switch to ASCII characters in Linux term
    if [[ ${TERM} == "linux" ]];
    then
        returnSymbol='<<'
        promptSymbolFrom='/-'
        promptSymbolTo='\-'
        promptSymbol='>'
        ZSH_THEME_GIT_PROMPT_PREFIX='%F{red}-[git '
        ZSH_THEME_GIT_PROMPT_SUFFIX='%F{red}]'
        ZSH_THEME_VIRTUALENV_PREFIX='%F{red}-[%f%F{green}python '
        ZSH_THEME_VIRTUALENV_SUFFIX='%F{red}]'
    else
        returnSymbol='↵'
        promptSymbolFrom='%F{red}┌─'
        promptSymbolTo='%F{red}└─'
        promptSymbol='%F{red}─╼ %F{yellow}\$%f%F{black}'
        ZSH_THEME_GIT_PROMPT_PREFIX='%F{red}─[%f%F{166}'
        ZSH_THEME_GIT_PROMPT_SUFFIX='%F{red}]'
        ZSH_THEME_VIRTUALENV_PREFIX='%F{red}─[%f%F{green}🐍 '
        ZSH_THEME_VIRTUALENV_SUFFIX='%F{red}]'
    fi

# Check the UID
    if [[ $UID -ne 0 ]]; then # normal user
        PR_USER='%F{black}%n%f'
        PR_USER_OP='%F{black}%#%f'
        #PR_USER='%n%f'
        #PR_USER_OP='%#%f'
        PR_PROMPT="%F{black}${promptSymbol}"
        PR_AT='%F{yellow}@'
    else # root
        PR_USER='%F{red}%n%f'
        PR_USER_OP='%F{red}%#%f'
        PR_PROMPT="%F{black}${promptSymbol}%f"
        PR_AT='%F{yellow}@'
    fi

# Check if we are on SSH or not
    if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
        if [[ $UID -eq 0 ]]; then
            PR_HOST='%B%F{magenta}%m%f%b' # SSH, root
        else
            PR_HOST='%F{green}%m%f' # SSH, normal user
        fi
    elif [[ $UID -eq 0 ]]; then
        PR_HOST='%B%F{26}%m%f%b' # no SSH, root
    else
        PR_HOST='%F{26}%m%f' # no SSH, normal user
    fi

    local return_code="%(?..%F{red}%? ${returnSymbol}%f)"

    local user_host="${PR_USER}${PR_AT}${PR_HOST}"
    local current_dir="%F{57}%~%f"

    local git_branch='$(git_prompt_info)'
    local venv_python='$(virtualenv_prompt_info)'

    PROMPT="${promptSymbolFrom}[${user_host}%F{red}]%f${venv_python}%F{red}-[%f${current_dir}%F{red}]%f${git_branch}
${promptSymbolTo}$PR_PROMPT "

    RPROMPT="${return_code}"
}
