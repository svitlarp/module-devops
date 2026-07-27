#! /bin/bash
#This script is used to check if specific development tools are installed and install them if needed"

readonly REQUIRED_PYTHON_VERSION="${REQUIRED_PYTHON_VERSION:-3.9}" 
export REQUIRED_PYTHON_VERSION

source ./check_versions.sh
source ./lib/installer_linux_deb.sh

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
missing=()
check_versions "${arr[@]}"
if [ ${#missing[@]} -eq 0 ]; then
    echo -e "\n${GREEN}All tools are installed${NC}"
else
    echo -e "\n${RED} Not installed:${NC}" 
    for item in "${missing[@]}"; do
        echo -e "${RED} - $item${NC}"
    done
    
    # Install programs
    list_installer_linux 
fi

