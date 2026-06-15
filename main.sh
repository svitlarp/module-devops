#! /bin/bash
#This script is used to check if specific development tools are installed and install them if needed"

source ./check_versions.sh
# source ./lib/installer_linux.sh
# source ./lib/installer_mac.sh
# source ./lib/installer_windows.sh

# main program
echo "The script to install programs:"
for item in "${arr[@]}"; do
    echo ${item}
done

printf "\n"
check_versions


