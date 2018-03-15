#  -------------------------
#  Chris Jones' .bashrc
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

#   ------------------------
#   Functions
#   ------------------------

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() {
      ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ;
    }

#   extract: Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#  -------------------------
#  Aliases
#  -------------------------

alias myip='curl ipinfo.io'                                                   # myip:         Public facing IP Address
alias zless=$PAGER                                                            # zless:        Use $PAGER (less) for zless
alias ls="ls -G"                                                              # ls:           Use colorized output with ls
#alias ls="\gls --color=always -G"                                             # ls:           Use colorized output with Gnu ls
alias log="~/scripts/logtodayone.rb"                                          # log:          Dayone script to submit log entries via CLI
alias msync="rsync -vaNHAXx --fileflags --protect-decmpfs --force-change \
  --rsync-path=/opt/pkg/bin/rsync --stats -i"                                 # msync:        Rsync for files on macOS
alias cu='sudo cu --nostop -l /dev/tty.KeySerial1'                            # cu:           My cu command for serial connections using Keyspan adapter
alias vi='vim'                                                                # vi:           Use vim for vi
alias stats='dshb'                                                            # stats:        Dispaly macOS system stats (cpu, mem, etc) using dshb
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'                 # ic:           Change directory to the iCloud Drive folder within the termal
alias iperf='iperf3'                                                          # iperf:        Use iperf3 for iperf
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'         # vmrun:        VMware's vmrun command
alias python='/opt/pkg/bin/python3.6'                                         # python:       Use Python 3.6 as default python version
alias sshfw='TERM=xterm-256color ssh'                                         # sshfw:        Use xterm when connecting to some OS' (Junos) via SSH
alias config='git --git-dir=/Users/cjones/.cfg/ --work-tree=/Users/cjones'    # config:       My dotfile configuration management using git
alias sysinfo='/usr/local/bin/neofetch'                                       # sysinfo:      Display system information
