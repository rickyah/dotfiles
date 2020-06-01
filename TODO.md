# TODO

[x] Add support for Brewfiles
[] More intelligent syncing behaviour
	[] Prevent syncying config files system->dotfiles if dotfiles repo has modifications
	[] When syncing files, do not overwrite files that exist and are different from the source

[] Add support for Brewfiles
	[X] Refactor app install script in favor of Brewfiles
	[] Install fonts using [cask-font](https://github.com/Homebrew/homebrew-cask-fonts) to reduce download size

[] Support multiple configurations (personal, work) without using branches (aka layer system)
	We can generate configurations that apply on top of a base one: a  default Brewfile with common cases and the we apply an aditional Brewfile for the current layer

[] Allow sync comand to only sync a subset of the files (categories)
	[] Use just one rsync file instead of one per folder with different categories as an obj map
	[] Add a parameter to specify the categories to sync, comma separated

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