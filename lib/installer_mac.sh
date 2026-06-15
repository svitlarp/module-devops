#! /bin/bash
# Script that verifies array and install programs that are not installed (for Mac OS)


install_django_mac () {
    echo "Installing Django for MacOS."
    # python3 -m pip install django
    echo "Installation complete"
}

install_docker_docker_mac () {
    echo "Installing Docker Compose for Linux"
    # brew install --cask docker 
    echo "Installation complete"
}

install_docker_docker_compose_mac () {
    echo "Installing Docker Compose for Linux"
    # brew install docker-compose
    echo "Installation complete"
}

install_python3_mac () {
    echo "Installing Python3 for Mac OS"
    # brew install python3
    echo "Installation complete"
}


# main
# Programs to be installed:
list_installer_mac() {
    local to_install=("${missing[@]}")    

    brew update

    for item in "${missing[@]}"; do
        echo "Installing $item .."
        case "$item" in 
            "django-admin") install_django_mac ;;
            "docker") install_docker_docker_mac ;;
            "docker-compose") install_docker_docker_compose_mac ;;
            "python3") install_python3_mac ;;
            *) echo "no installer for $item" ;;
        esac
    done

    missing=()
    check_versions "${to_install[@]}"     

    if [ ${#missing[@]} -eq 0 ]; then
        echo -e "${GREEN}✅ All installed successfully${NC}"
    else
        echo -e "${RED}❌ Failed: ${missing[*]}${NC}"
    fi
}


