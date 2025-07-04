
# Postgre SQL
# alias pgon='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pgoff='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# MySQL aliases
# alias myon='sudo /Library/StartupItems/MySQLCOM/MySQLCOM start'
# alias myoff='sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop'
# alias myrestart='sudo /Library/StartupItems/MySQLCOM/MySQLCOM restart'

# apache aliases
# alias apron='apachectl -k start'
# alias aproff='apachectl -k stop'
# alias apres='apachectl -k restart'

# find aliases
# alias fn='find . -iname $1' # don't need this anymore thansk to fd
alias fn='fd'

# lsd (replacement for ls)
# https://github.com/lsd-rs/lsd
if command -v lsd &> /dev/null
then
    alias ls="lsd"
fi

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

# ruby
# alias be='bundle exec'
# alias bi='bundle install'

# git
alias g='git'

# bat tool: cat replacement
# https://github.com/sharkdp/bat
if hash bat 2>/dev/null; then
  alias cat='bat'
  export BAT_CONFIG_PATH="~/.batrc"
fi

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# # Canonical hex dump; some systems have this symlinked
# command -v hd > /dev/null || alias hd="hexdump -C"

# # OS X has no `md5sum`, so use `md5` as a fallback
# command -v md5sum > /dev/null || alias md5sum="md5"

# # OS X has no `sha1sum`, so use `shasum` as a fallback
# command -v sha1sum > /dev/null || alias sha1sum="shasum"

# # ROT13-encode text. Works for decoding, too! ;)
# alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# # Show/hide hidden files in Finder
alias fshow="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias fhide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias fhidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias fshowdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
# alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
# alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"
