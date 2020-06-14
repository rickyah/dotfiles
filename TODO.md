# TODO

[X] Add support for Brewfiles
[X] More intelligent syncing behaviour
	[X] Prevent syncying config files system->dotfiles if dotfiles repo has modifications

[X] Add support for Brewfiles
	[X] Refactor app install script in favor of Brewfiles
	[X] Install fonts using [cask-font](https://github.com/Homebrew/homebrew-cask-fonts) to reduce download size
	[X] Nuke fonts binary files from repository

[] Support multiple configurations (personal, work) without using branches (aka layer system)
	[] We can generate configurations that apply on top of a base one: a  default Brewfile with common cases and the we apply an aditional Brewfile for the current layer
	[] Use git-config conditional includes (https://git-scm.com/docs/git-config#_conditional_includes)

[X] Allow sync comand to only sync a subset of the files (categories)
	[X] Use just one rsync file instead of one per folder with different categories as an obj map
	[X] Add a parameter to specify the categories to sync, comma separated

[] Add support for SDKMAN


## Tools to install
* cmake
* python
* python2
* open jdk 8
* android-sdk
* android-studio
* gradle
* ccache

## Settings to save
vscode settings
vscode keymaps
vscode extensions
xcode keymaps
iterm settings

# Fonts
* Add source code pro font
* Check more fonts installed in the system