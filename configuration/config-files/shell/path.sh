# default path
PATH=PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Homebrew path
eval "$(/opt/homebrew/bin/brew shellenv)"

# my custom paths
CURRENT_DIR_BIN_PATH=$PATH:$HOME/bin:./bin
DOTNET_CORE_PATH=/usr/local/share/dotnet
MONO_PATH=/Library/Frameworks/Mono.framework/Versions/Current/bin

PATH=$PATH:$CURRENT_DIR_BIN_PATH:$DOTNET_CORE_PATH:$MONO_PATH

export MONO_PATH
export PATH
