#! /bin/bash
# Script that verifies array and install programs that are not installed (for Linux OS)


install_django_linux () {
    echo "Installing Django for Linux"
    python -m pip install Django
    echo "Installation complete"
}

install_docker_linux () {
    echo "Installing Docker for Linux"
    sudo apt-get install -y ca-certificates curl gnupg
    curl -fsSL https://get.docker.com | sudo sh
    echo "Installation complete"
}

install_docker_compose_linux () {
    echo "Installing Docker Compose for Linux"
    sudo apt-get install docker-compose-plugin
    echo "Installation complete"
}

install_pyhton3_linux () {
    echo "Installing Python3 for Linux"
    sudo apt install -y python3 python3-pip 
    echo "Installation complete"
}

# main
# Proggrams to be installed:
list_installer_linux() {
    local to_install=("${missing[@]}")  

    # sudo apt-get update

    for item in "${missing[@]}"; do
        echo "Installing $item .."
        case "$item" in 
            "django-admin") install_django_linux ;;
            "docker") install_docker_linux ;;
            "docker-compose") install_docker_compose_linux ;;
            "python3") install_pyhton3_linux ;;
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

