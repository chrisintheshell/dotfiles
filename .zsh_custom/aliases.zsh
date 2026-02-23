alias my-drive='cd /Volumes/TB\ Data'
alias zless=$PAGER                                                            # zless:        Use $PAGER (less) for zless
alias msync="rsync -vaNHAXx --fileflags --protect-decmpfs --force-change \
    --rsync-path=/opt/pkg/bin/rsync --stats -i"                               # msync:        Rsync for files on macOS
alias cu='sudo cu --nostop -l /dev/cu.usbserial-110'                         # cu:           My cu command for serial connections using Keyspan adapter
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'                 # ic:           Change directory to the iCloud Drive folder within the termal
#alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'         # vmrun:        VMware's vmrun command
alias python='/opt/homebrew/bin/python3'                                         # python:       Use Python 3 as default python version
alias pip='/opt/homebrew/bin/pip3'                                               # pip3:         Use pip3

alias shasum_256='shasum -a 256'                                              # shasum_256:   Run a shasum using 256bit algorithm
alias vm-windows-work='vmrun -T fusion start \
    ~/Documents/Virtual\ Machines.localized/Windows\ 7\ x64\ 2.vmwarevm/Windows\ 7\ x64\ 2.vmx'         # vm_windows_work:    My Windows Work VM
alias typing-tutor='ttyper'
alias servo-fix-permissions='xattr -r -d com.apple.quarantine /Applications/Servo.app'

# 1Password
alias op-signin='eval $(op signin paladin)'

# Containers

# Git & Config
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'                                      # config:       My dotfile configuration management using git

#ghostty
alias ghostty='/Applications/Ghostty.app/Contents/MacOS/ghostty'
alias ghostty-edit-config='ghostty +edit-config'
alias ghostty-list-keybinds='ghostty +list-keybinds --default'
alias ghostty-show-config='ghostty +show-config'
alias ghostty-show-config-default='ghostty +show-config --default --docs'

#hammerspoon
alias hammerspoon-edit-config='vi ~/.hammerspoon/init.lua'

# macOS
alias lsregister='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister'
alias mac-sensor-network='sudo powermetrics -n 1 -i 1 --samplers network'
alias mac-sensor-smc='sudo powermetrics -n 1 -i 1 --samplers smc'
alias mac-sensor-thermal='sudo powermetrics -n 1 -i 1 --samplers thermal'

#Network
alias net-dns-flushcache='sudo dscacheutil -flushcache; sudo killall -HUP \
  mDNSResponder'                                                               # dns_flush_cache
alias net-dns-lookup='dscacheutil -q host -a name'                             # dns_lookup:  Similar to dig or drill DNS clients created by Knot
alias net-iperf='iperf3'                                                       # iperf:        Use iperf3 for iperf
alias net-maclookup='maclookup -k at_M8daZz1GSwcJmXfs3A5tbTXmPvD50'           # net_maclookup: Lookup MAC addresses
alias net-ipinfo='ipinfo myip'                                                  # my_ip:         Public facing IP Address
alias net-check-port-tcp='nc -zv'                                           # nc_check_port: Use nc to check for open TCP ports
alias net-check-port-udp='nc -zvu'                                          # nc_check_port: Use nc to check for open UCP ports
alias net-route-get='route get'
alias net-tcp-ping='tcping'
alias net-tls-scan='cryptonice'                                                # net_sslscan: Scan SSL/TLS websites
alias net-tls-show_certs='openssl s_client -showcerts -connect'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"        # tailscale:   Run tailscale commands

# Security
alias sec-pw-gen='diceware'

# SSH
alias ssh-fw='TERM=xterm-256color ssh'                                        # sshfw:        Use xterm when connecting to some OS' (Junos) via SSH
alias ssh-no-key='TERM=xterm-256color ssh -o PubkeyAuthentication=no'         # ssh_no_key:   Use xterm and ignore public key
alias ssh-legacy='container run -it --rm ubuntu:14.04 bash -c "apt update && apt install -y openssh-client && bash"'

# System
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

# tmux
alias tmux-attach-local="tmux attach -t local"
alias tmux-attach-remote="tmux attach -t remote"
alias tmux-create-local="tmux-init-local.sh"
alias tmux-create-remote="tmux new-session -d -s remote"
alias tmux-edit-config="vi ~/.tmux.conf"

# Vi
alias vi='nvim'
alias vim='nvim'

#ZSH/OMZ
alias zsh-edit-aliases='vi ~/.zsh_custom/aliases.zsh'
alias zsh-edit-env='vi ~/.zsh_custom/env_vars.zsh'
alias zsh-edit-zshrc="vi ~/.zshrc"
