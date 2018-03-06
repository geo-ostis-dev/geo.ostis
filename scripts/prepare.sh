#!/bin/bash

current_folder=$(pwd)
project_folder=$(readlink -f $(dirname $(readlink -f $0))/..)
cd $project_folder

source scripts/sugar.sh

#=======================================
stage "Prepare sc-machine"
substage "Clone project"
#---------------------------------------
clone https://github.com/ShunkevichDV/sc-machine.git scp_stable
#---------------------------------------

#=======================================
substage "Install dependencies"
#---------------------------------------
cd sc-machine/scripts
./install_deps_ubuntu.sh
sudo apt-get install redis-server
#---------------------------------------

#=======================================
substage "Make"
#---------------------------------------
./clean_all.sh
./make_all.sh
cd $project_folder
#---------------------------------------

#=======================================
stage "Prepare sc-web"
#---------------------------------------
substage "Clone project"
clone "https://github.com/Ivan-Zhukau/sc-web.git"

#=======================================
substage "Install python"
#---------------------------------------
sudo apt install python-dev
#---------------------------------------

#=======================================
substage "Install dependecies"
#---------------------------------------
./sc-web/scripts/install_deps_ubuntu.sh
./sc-web/scripts/install_nodejs_dependence.sh
#---------------------------------------

#=======================================
substage "NPM install"
#---------------------------------------
cd sc-web
npm install
#---------------------------------------

#=======================================
substage "Grunt build"
#---------------------------------------
grunt build
cd $project_folder
#---------------------------------------

#=======================================
stage "Build knowledge base"
substage "Clone project 'ims.ostis.kb'"
#---------------------------------------
clone https://github.com/ShunkevichDV/ims.ostis.kb
#---------------------------------------

#=======================================
substage "Copy ims.ostis.kb -> ims.ostis.kb/kb"
./scripts/copy_ims_kb.sh
#---------------------------------------

#=======================================
substage "Build Knowledge base"
./scripts/build_kb.sh
#---------------------------------------

#=======================================
stage "Prepare module 'sc-web.module.geo'"
substage "Install"
cd sc-web
npm install sc-web.module.geo
#---------------------------------------

#=======================================
substage "Place"
geo place
#---------------------------------------

cd $current_folder
