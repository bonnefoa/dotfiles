function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

RPROMPT='$(date +"%H:%M:%S")'

KUBE_PS1_SYMBOL_ENABLE=false
whence kube_ps1 > /dev/null && kubectl config current-context > /dev/null 2> /dev/null && RPROMPT="\$(kube_ps1) $RPROMPT"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
