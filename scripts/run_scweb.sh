#!/bin/bash

current_folder=$(pwd)
project_folder=$(readlink -f $(dirname $(readlink -f $0))/..)
cd $project_folder

cd sc-web/server

python app.py

cd $current_folder
