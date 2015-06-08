#=======================
# DOCKER COMMANDS
#======================
dockerContainers(){
  if [ $# -gt 0 ]; then
    case "$1" in
      "rm") echo 'remove containers'; sudo docker rm `sudo docker ps -aq`
        ;;
      "kill") echo 'kill containers'; sudo docker kill `sudo docker ps -q`
        ;;
      *) sudo docker ps $1
        ;;
    esac
  else
    sudo docker ps
  fi
}

dockerImages(){
  sudo docker images $1
}

deleteUntaggedImages(){
  sudo docker rmi $(sudo docker images | grep "^<none>" | awk "{print $3}")
}

alias containers=dockerContainers
alias images=dockerImages
alias images-delete-untagged=deleteUntaggedImages


#=======================
# GIT COMMANDS
#======================
alias gst="git status"
alias gc="git commit"
alias gp="git pull"
alias gpr="git pull --rebase"
