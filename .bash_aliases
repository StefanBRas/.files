alias calw='gcalcli --calendar=stefan-bruhn@hotmail.com calw --military --monday'
alias calm='gcalcli --calendar=stefan-bruhn@hotmail.com calm --military --monday'
alias cala='gcalcli --calendar=stefan-bruhn@hotmail.com agenda --military --monday'
alias hass_comp='eval "$(_HASS_CLI_COMPLETE=source hass-cli)"'
alias vejr='curl wttr.in/Copenhagen?2QnF'
alias vejrshort='curl wttr.in/Copenhagen?1QnF'
alias vejrv2='curl v2.wttr.in/Copenhagen'
alias vejroneline='curl wttr.in/Copenhagen?format="%l:+%c+%t+%p+%o"'
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# using git for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Never as to save in R
alias R='R --no-save'

alias i3cheatsheet='egrep ^bind ~/.config/i3/config | cut -d '\'' '\'' -f 2- | sed '\''s/ /\t/'\'' | column -ts $'\''\t'\'' | pr -2 -w 145 -t | less'
### Default aliases
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Todoist stuff
alias todoistl='unbuffer todoist --color list | cut -c 21- | nl'
alias tl='todoistl'
#
alias pytohn='python'
alias pytohn3='python3'
alias activate='source .venv/bin/activate'

# git stuff
alias gst="git status"
alias fixp="git add -u; git commit -m 'Fix pipeline'; git push"
