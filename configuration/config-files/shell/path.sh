# default path
PATH=PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# my custom paths
CURRENT_DIR_BIN_PATH=$PATH:$HOME/bin:./bin
DOTNET_CORE_PATH=/usr/local/share/dotnet
MONO_PATH=/Library/Frameworks/Mono.framework/Versions/Current/bin
GNU_CORE_UTILS_PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

PATH=$PATH:$CURRENT_DIR_BIN_PATH:$GNU_CORE_UTILS_PATH:$DOTNET_CORE_PATH:$MONO_PATH
export MONO_PATH

# Homebrew exports (these exports come from running 'brew shellenv'
export HOMEBREW_PREFIX="/usr/local";
export HOMEBREW_CELLAR="/usr/local/Cellar";
export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
export PATH="/usr/local/bin:/usr/local/sbin${PATH+:$PATH}";
export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/usr/local/share/info:${INFOPATH:-}";

