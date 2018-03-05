#!/bin/bash

current_folder=$(pwd)
project_folder=$(readlink -f $(dirname $(readlink -f $0))/..)
cd $project_folder

mkdir -p sc-machine/kb.bin

sc-machine/bin/sc-builder -f -c -i configs/kb.path -o sc-machine/kb.bin -s config/sc-builder.ini -e sc-machine/bin/extensions

cd $current_folder
