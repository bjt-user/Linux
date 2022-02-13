alias vimrc='vim ~/.vimrc'

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
