
#wsd Check for an interactive session
[ -z "$PS1" ] && return

export PATH=$PATH:/opt/mosml/bin:/opt/node/bin:~/scripts
TERM="rxvt"; export TERM

alias browse="chromium & exit"
alias ncmpcpp="urxvt -name ncmpcpp -e ncmpcpp &"
alias nb6="/home/nwillems/netbeans-6.9.1/bin/netbeans --nosplash &"
alias sysupgrade="touch /home/nwillems/pacmanlog/sys$(date +%y-%m-%d); sudo pacman -Syyu --logfile /home/nwillems/pacmanlog/sys$(date +%Y-%m-%d).log"
alias ls='ls -l --color=auto'
alias irc="weechat-curses"
alias torrent="transmission &"
alias cls="clear"
alias skype="xhost +local: && sudo -u skype /usr/bin/skype"
alias xlinks="xlinks -g"
PS1='[\u@\h \W]\$ '
BROWSER="/usr/bin/chromium"; export BROWSER
EDITOR="/usr/bin/vim"; export EDITOR
complete -cf sudo man

[ -r /home/nwillems/.bash/bash.bash_completion ] && . /home/nwillems/.bash/bash.bash_completion 

