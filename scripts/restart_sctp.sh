#!/bin/bash

current_folder=$(pwd)
project_folder=$(readlink -f $(dirname $(readlink -f $0))/..)
cd $project_folder

./scripts/build_kb.sh
sc-machine/bin/sctp-server configs/sctp.ini

cd $current_folder
