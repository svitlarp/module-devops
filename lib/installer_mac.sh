

# Install Python3 
install_python3_mac ()
{
echo "Installing Python3 for Windows"

brew install python3
python3 --version
pip3 --version

echo "Installation is terminated"
}

# Install Django 
install_django_mac ()
{
echo "Installing Django for MacOS."
python -m pip install Django==6.0.6
echo "Installation is terminated"
}


# install docker
$ sudo apt-get update
$ sudo apt-get install -y python3.6 python3-pip python3-venv

# install docker-compose
