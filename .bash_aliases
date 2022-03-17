#!/bin/bash

alias cputemp='/home/bf/Coding/scripts/get_cpu_temp.sh'
alias ll='ls -la'

alias gob='cd ..'
alias gos='cd ~/Coding/scripts'

alias vimrc='vim ~/.vimrc'
alias vimftp='cd ~/.vim/ftplugin'

alias bashaliases='vim ~/.bash_aliases'
alias bashrc='vim ~/.bashrc'

#get size of current folder
alias fsize='printf "The size of this folder is: ";du -h . | tail -1 | cut -f1'

#remove all docker containers
alias killd='sudo docker container prune -f'

#show displayserver (i.e. wayland)
alias dserver="loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}'"

###################################################################################################
# FUNCTIONS (THAT CAN BE CALLED LIKE ALIASES) #####################################################
###################################################################################################

#create a new bash script by entering "newbash [filename]" on the command line:
newbash() {
  local filename=$1
  touch $filename
  chmod +x $filename
  printf "#!/bin/bash" > $filename
}

#for annoying folder structures where a folder only contains one other folder (as used in java)
march() {
  folder_count=$(ls -d */ 2>/dev/null | wc -l)
  while [ $folder_count -eq 1 ]; do
    cd *
    folder_count=$(ls -d */ 2>/dev/null | wc -l)
  done
}
