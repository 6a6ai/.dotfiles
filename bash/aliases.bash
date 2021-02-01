echo 'loading aliases'
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias cd..='cd ../'
alias ..='cd ../'
alias eject='diskutil eject'
alias f='open -a Finder ./'
alias lsa='ls -a'
alias ca='clear;history -c'
ntfsmnt () { sudo /usr/local/bin/ntfs-3g /dev/"$1" /Volumes/NTFS -olocal -oallow_other; }

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#cleanup utils
alias cql='qlmanage -r cache'
# wget
alias wg='/usr/local/Cellar/wget/1.20.3_1/bin/wget'

