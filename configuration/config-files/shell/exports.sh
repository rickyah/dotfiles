# Make nvim the default editor
export EDITOR="nvim"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

export LANG="en_US"
export LC_ALL="en_US.UTF-8"


# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don't clear the screen after quitting a manual page
export MANPAGER="less -RFX"

# FZ options
FD_OPTIONS="--exclude .git"
FZF_PREVIEW_OPTIONS="--preview 'bat --style=numbers --color=always {}' --bind='f2:toggle-preview' --preview-window='right:hidden:wrap'"

export FZF_DEFAULT_OPTS="--height 40% $FZF_PREVIEW_OPTIONS"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"

# Opt out of MS telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=true

# Enable custom configuration file locations
export XDG_CONFIG_HOME="$HOME/.config"
export BAT_CONFIG_PATH=$HOME/.config/bat/batc
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc

