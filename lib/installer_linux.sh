#! /bin/bash
# Script that verifies array and install programs that are not installed (for Linux OS)


install_django_linux () {
    echo "Installing Django for Linux"
    if ! python3 -m pip --version >/dev/null 2>&1; then
        echo "pip not found, installing pip..."
        sudo apt-get install -y python3-pip
    fi
    # python3 -m pip install --upgrade pip
    # python3 -m pip install Django
    echo "Installation complete"
    
    if python3 -m pip show django >/dev/null 2>&1; then
        echo "Installation complete: $(python3 -m pip show django | grep Version)"
    else
        echo "Installation failed"
        return 1
    fi
}

install_docker_linux () {
    echo "Installing Docker for Linux"
    apt-get update -qq
    apt-get install -y -qq \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Docker Keyrings
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg

   # Repo
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Engine
    apt-get update -qq
    apt-get install -y -qq \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin
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

    for item in "${to_install[@]}"; do
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

