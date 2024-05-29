
sudo apt-get --fix-broken install

sudo apt-get  dist-upgrade

dpkg --configure -a
sudo apt install lightdm -y

sudo dpkg-reconfigure lightdm
