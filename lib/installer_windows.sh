

#  Install Python3
install_python3_windows ()
{
echo "Installing Python3 for Windows"

winget install 9NQ7512CXL7T -e --accept-package-agreements --disable-interactivity
py install --configure -y
python --version
pip --version

echo "Installation is terminated"
}



# Django
install_django_windows ()
{
echo "Installing Django for Windows"
py -m pip install Django==6.0.6
echo "Installation is terminated"
}


# install docker
$ sudo apt-get update
$ sudo apt-get install -y python3.6 python3-pip python3-venv


# install docker-compose