# default path
PATH=PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Homebrew path
eval "$(brew --prefix)/bin/brew shellenv"

# my custom paths
CURRENT_DIR_BIN_PATH=$PATH:$HOME/bin:./bin
DOTNET_CORE_PATH=/usr/local/share/dotnet
MONO_PATH=/Library/Frameworks/Mono.framework/Versions/Current/bin
GNU_CORE_UTILS_PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

PATH=$PATH:$CURRENT_DIR_BIN_PATH:$GNU_CORE_UTILS_PATH:$DOTNET_CORE_PATH:$MONO_PATH

export MONO_PATH
export PATH