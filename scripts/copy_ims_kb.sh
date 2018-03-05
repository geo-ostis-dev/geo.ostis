#!/bin/bash

current_folder=$(pwd)
project_folder=$(readlink -f $(dirname $(readlink -f $0))/..)
cd $project_folder

mkdir -p ims.ostis.kb/out
rm -rf ims.ostis.kb/out

cp -a ims.ostis.kb/ims/ostis_tech/semantic_network_represent/ ims.ostis.kb/out/
cp -a ims.ostis.kb/ims/ostis_tech/unificated_models/ ims.ostis.kb/out/
cp -a ims.ostis.kb/ims/ostis_tech/semantic_networks_processing/ ims.ostis.kb/out/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_of_reusable_comp_ui/ui_menu/ ims.ostis.kb/out/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_reusable_comp_kpm/reusable_sc_agents/lib_c_agents/ ims.ostis.kb/out/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_reusable_comp_kpm/reusable_sc_agents/lib_scp_agents/search/ ims.ostis.kb/out/search_agents/
cp -a ims.ostis.kb/ims/ostis_tech/lib_ostis/sectn_lib_reusable_comp_kpm/programs_for_sc_text_processing/scp_program/ ims.ostis.kb/out/
cp -a ims.ostis.kb/to_check/ ims.ostis.kb/out/
cp -a ims.ostis.kb/ui/ ims.ostis.kb/out/

cd $current_folder
