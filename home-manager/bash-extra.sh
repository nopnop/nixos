function __set_my_prompt {
    local RESET="\033[0;0m"
    local BLACK="\033[0;30m"
    local RED="\033[0;31m"
    local GREEN="\033[0;32m"
    local YELLOW="\033[0;33m"
    local BLUE="\033[0;34m"
    local MAGENTA="\033[0;35m"
    local CYAN="\033[0;36m"
    local WHITE="\033[0;37m"

    local LIGHT_RED="\033[1;31m"
    local LIGHT_GREEN="\033[1;32m"
    local LIGHT_YELLOW="\033[1;33m"
    local LIGHT_BLUE="\033[1;34m"
    local LIGHT_MAGENTA="\033[1;35m"
    local LIGHT_CYAN="\033[1;36m"
    local LIGHT_WHITE="\033[1;37m"

    local DARK_RED="\033[0;31m"
    local DARK_GREEN="\033[0;32m"
    local DARK_YELLOW="\033[0;33m"
    local DARK_BLUE="\033[0;34m"
    local DARK_MAGENTA="\033[0;35m"
    local DARK_CYAN="\033[0;36m"


    local COLOR_33="\e[38;5;33m"
    local COLOR_105="\e[38;5;105m"
    local COLOR_145="\e[38;5;145m"

    local git_modified_color="\[${COLOR_33}\]"
    local git_extra=""
    local git_status=$(git status 2>/dev/null | grep "Your branch is ahead" 2>/dev/null)
    if [ "$git_status" != "" ]; then
        git_modified_color="\[${COLOR_33}\]"
        git_extra="\[${LIGHT_GREEN}\]+"
    fi
    local git_status=$(git status --porcelain 2>/dev/null)
    if [ "$git_status" != "" ]; then
        git_modified_color="\[${COLOR_33}\]"
        git_extra="\[${YELLOW}\]*"
    fi

    local git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' )
    if [ "$git_branch" != "" ]; then
        git_branch="|$git_modified_color$git_branch$git_extra\[${LIGHT_BLUE}\] "
    fi
    PS1="\[${LIGHT_BLUE}\]\w$git_branch\[${LIGHT_MAGENTA}\]»\[${RESET}\] "
}

PROMPT_COMMAND='__set_my_prompt'
