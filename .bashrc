#  -------------------------
#  Chris Jones' BASH
#  cjones@autonomic.ca
#  -------------------------

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

#  -------------------------
#  My Environment
#  -------------------------

#  Change prompt

export PS1="\n| \w @ \h (\u) \n| => "
export PS2="| => "

#   Set EDITOR(s)
if { which vim 2> /dev/null  1> /dev/null ;}; then
    EDITOR=vim
else
    EDITOR=vi
fi
FCEDIT=$EDITOR
VISUAL=$EDITOR
HISTEDIT=$EDITOR
export EDITOR FCEDIT HISTEDIT

#  Set PAGER
export PAGER=less

#  -------------------------
#  Aliases
#  -------------------------

alias myip='curl ipinfo.io'                 # myip:         Public facing IP Address
alias zless=$PAGER
alias ls="ls -G"
alias log="~/scripts/logtodayone.rb"
alias rsyncx="rsync -vaNHAXx --fileflags --protect-decmpfs --force-change --rsync-path=/usr/local/bin/rsync --stats -i"
alias cu='sudo cu --nostop -l /dev/tty.KeySerial1'
alias vi='vim'
alias stats='dshb'
alias iperf='iperf3'
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'
alias python='/opt/pkg/bin/python3.6'
alias sshfw='TERM=xterm-256color ssh'
alias config='git --git-dir=/Users/cjones/.cfg/ --work-tree=/Users/cjones'
