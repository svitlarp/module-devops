#! /bin/bash
#This script is used to check if specific development tools are installed and install them if needed"

source ./check_versions.sh
# source ./lib/installer_linux.sh
# source ./lib/installer_mac.sh
# source ./lib/installer_windows.sh


# colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


# main program
echo "The script to install programs:"
for item in "${arr[@]}"; do
    echo -e "${GREEN}${item}\033[0m"
done

printf "\n"
check_versions


if [ ${#missing[@]} -eq 0 ]; then
    echo -e "\n${GREEN}All tools installed!${NC}"
else
    echo -e "\n${RED}Not installed:${NC}"
    for item in "${missing[@]}"; do
        echo -e "${RED} - $item${NC}"
    done
fi


