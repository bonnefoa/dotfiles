# Aliases
alias -- -='cd -'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias ls='exa'
alias la='exa -alh -snew'
alias grep='grep --color '
alias ncmpcl='ncmpc -h localhost'
alias vgdb='valgrind --leak-check=full --db-attach=yes --db-command="cgdb -- -nw %f %p" --track-origins=yes'
alias ssh='TERM=xterm ssh'
alias vim=nvim

# ENV
export EDITOR=nvim
export GOROOT=/usr/lib/go/
export VISUAL=nvim

export LESS=" -S -R"
export GOPATH="$HOME/git-repos/golang/"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
export PATH="$HOME/git-repos/.file/bin/:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

export XDG_DATA_HOME="$HOME/.local/share"
export PYTHONDONTWRITEBYTECODE="1"
export LANG="en_US.utf8"
export LC_ALL="en_US.UTF-8"
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Vim mode timeout
export KEYTIMEOUT=1

# Tab title
ZSH_TAB_TITLE_ENABLE_FULL_COMMAND=true
ZSH_TAB_TITLE_ADDITIONAL_TERMS='xterm-kitty'
ZSH_TAB_TITLE_PREFIX='kitty '

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf Configuration 
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude ".git" . "$1" "
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude ".git" . "$1" "
#export FZF_BASE="$GOPATH/src/github.com/junegunn/fzf"


# https://github.com/junegunn/fzf Configuration
export FZF_COMPLETION_OPTS='+c -x'
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

if [[ -d $HOME/local/google-cloud-sdk ]]; then
	source $HOME/local/google-cloud-sdk/completion.zsh.inc
fi

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
setopt inc_append_history
setopt share_history

# Navigation
setopt autocd
setopt cdable_vars
setopt rm_star_silent
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
