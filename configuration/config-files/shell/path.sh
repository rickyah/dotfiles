# default path
PATH=PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

CURRENT_DIR_BIN_PATH=$PATH:$HOME/bin:./bin
DOTNET_CORE_PATH=/usr/local/share/dotnet
MONO_PATH=/Library/Frameworks/Mono.framework/Versions/Current/bin

PATH=$PATH:$CURRENT_DIR_BIN_PATH:$DOTNET_CORE_PATH:$MONO_PATH

export MONO_PATH

# android skd
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PATH
