function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

function git_prompt_info() {
    branch=$(parse_git_branch)
    if [[ -n $branch ]];then
        echo "${ZSH_THEME_GIT_PROMPT_PREFIX}$branch${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    fi 
}
    


