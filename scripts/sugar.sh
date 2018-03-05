#!/bin/bash

prepare_stage=0
prepare_substage=0

# $1 - Input text
# $2 - Color (optional: default white)
function text {
  local color_reset="\e[0m"
  local color=''

  case $1 in
    "red")       color="\e[1;31m";;
    "blue")      color="\e[0;34m";;
    "blue_bold") color="\e[1;34m";;
    "green")     color="\e[0;32m";;
    "bwhite")    color="\e[47m";;  
    "rst")       color="\e[0m";;
  esac
  
  if [ -n $color ]; then
    echo -e "${color}$2${color_reset}"
  else
    echo -e $2
  fi
}

# $1 - Input text
function stage {
  let "prepare_stage+=1"
  echo "[$(text green $prepare_stage)] $(text blue_bold "${1}")"
}

# $1 - Input text
function substage {
  let "prepare_substage+=1"
  echo "[$(text green "${prepare_stage}.${prepare_substage}")] $(text blue "${1}")"
}

# $1 - Path to repository
# $2 - Branch (optional: default master)
function clone {
  local repo_name=$(basename $1 .git)
  
  if [[ ! -d $repo_name ]]; then
    git clone $1
    cd $base_name
  
    if [[ -n $2 ]]; then
      git checkout $2
    fi
  else
    echo "You can update $(text green $base_name) manualy"
  fi
}

