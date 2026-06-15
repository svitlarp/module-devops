

#  Install Python3
install_pyhton3_linux ()
{
echo "Installing Python3 for Linux"
sudo apt update
sudo apt install python3 python3-pip -y
python3 --version
echo "Installation is terminated"
}

# Install Django
install_django_linux ()
{
echo "Installing Django for Linux"
python -m pip install Django==6.0.6
echo "Installation is terminated"
}


# install docker
$ sudo apt-get update
$ sudo apt-get install -y python3.6 python3-pip python3-venv


# install docker-compose