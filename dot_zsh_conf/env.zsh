export EDITOR=vim

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

# Define LS_COLORS
if [[ -d $ZPLUG_HOME/repos/seebi/dircolors-solarized/ ]]; then
    eval $(dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark)
fi
