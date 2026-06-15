#! /bin/bash
#This script is used to check if specific development tools are installed and install them if needed"

source ./check_versions.sh
source ./lib/installer_linux.sh
source ./lib/installer_mac.sh
source ./lib/installer_windows.sh


# Proggrams to be installed:
arr=(django-admin docker docker-compose python3)

# colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


# main program
# Print a list of programs
echo "The list of necessary programs:"
for item in "${arr[@]}"; do
    echo -e "${GREEN}${item}${NC}"
done
printf "\n"

# check if these programms are installed 
check_versions
if [ ${#missing[@]} -eq 0 ]; then
    echo -e "\n${GREEN}All tools are installed${NC}"
else
    echo -e "\n${RED} Not installed:${NC}" 
    for item in "${missing[@]}"; do
        echo -e "${RED} - $item${NC}"
    done
fi

# check OS
echo "Which OS linux/mac/windows?"
read answer
if [ "$answer" = "linux" ]; then
    echo "let install missing programs for Linux OS"
    list_installer_linux
elif
    [ "$answer" = "mac" ]; then
    echo "let install missing programs for Mac OS" 
    list_installer_mac
elif 
    [ "$answer" = "windows" ]; then
    echo "Commands for Windows OS are not provided"
    exit 1
else
    echo "Commands for "$answer" are not provided"
    exit 1
fi
check_versions
