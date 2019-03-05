
FILES=(
    # fzf autocompletion and keyboard shortcuts
    ~/.fzf.zsh 
    # zsh syntax highlighting
    /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
)

for file in $FILES; do
    [ -r "$file" ] && source "$file"
done
unset file


# rbenv
if type "rbenv" > /dev/null; then
    eval "$(rbenv init -)"
fi
