export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude ".git" . "$1" "
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude ".git" . "$1" "
export FZF_BASE="$GOPATH/src/github.com/junegunn/fzf"
export FZF_COMPLETION_OPTS='+c -x'

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}
