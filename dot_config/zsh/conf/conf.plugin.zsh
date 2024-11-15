# Aliases
alias -- -='cd -'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias la='ls -Alhtr --color'
alias grep='grep --color '
alias vim=nvim

# ENV
export EDITOR=nvim
export VISUAL=nvim

export PAGER="less"
export LESS=" -S -R"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
export PATH="$HOME/.local/bin:$HOME/local/bin:$HOME/.cargo/bin:$HOME/virtual/bin:$HOME/go/bin:$HOME/dd/devtools/bin/:$PATH"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
export PYTHONDONTWRITEBYTECODE="1"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h
export SYSTEMD_DEBUGGER=cgdb

# Vim mode timeout
export KEYTIMEOUT=1

# SSH Agent socket
[ -z "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Tab title
ZSH_TAB_TITLE_ENABLE_FULL_COMMAND=true
ZSH_TAB_TITLE_ADDITIONAL_TERMS='xterm-kitty'
ZSH_TAB_TITLE_PREFIX='kitty '

# https://github.com/junegunn/fzf Configuration
export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_OPTS='-i --height=70%'
export _ZO_FZF_OPTS='--no-sort --bind=ctrl-z:ignore --cycle --keep-right --border=sharp --height=65% --info=inline --layout=reverse --tabstop=1 --exit-0 --select-1 --preview="\command -p ls -Cp --color=always --group-directories-first {2..}" --preview-window=down,30%,sharp'

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Vim mode configuration
bindkey -v

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history

# Navigation
setopt autocd
setopt cdable_vars
setopt rm_star_silent
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
