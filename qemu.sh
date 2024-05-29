#!/bin/sh

# Check if script is run as root
if [ "$(id -u)" -eq 0 ]; then
  echo "You must NOT be a root user when running this script, please run ./install.sh" 2>&1
  exit 1
fi

# Checking if virualisation is enabled or not
if [ "$(grep -Ec '(vmx|svm)' /proc/cpuinfo)" -eq '0' ]; then
  echo "Virtualization is not enabled. If your Processor supports virtualisation, go to bios settings and enable VT-x(Virtualization Technology Extension) for Intel processor and AMD-V for AMD processor." 2>&1
  exit 1
fi

# Actual installation
if command -v apt-get > /dev/null; then
  # Install necessary programs
  sudo apt-get -y install qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon

  # Add user to libvirt group to Allow access to VMs
  sudo usermod -aG libvirt "$USER"
  sudo usermod -aG libvirt-qemu "$USER"
  sudo usermod -aG kvm "$USER"
  sudo usermod -aG input "$USER"
  sudo usermod -aG disk "$USER"
elif command -v pacman > /dev/null; then
  # Install necessary programs
  sudo pacman -S --noconfirm qemu-base virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs

  # Add user to libvirt group to Allow access to VMs
  sudo usermod -aG libvirt $(whoami)
  newgrp libvirt
fi

# Install VM manager frontend based on system configs
if ps -A | grep -q "gnome-shell"; then # Install GNOME-Boxes if DE is GNOME
  if command -v apt-get > /dev/null; then
    sudo apt-get install -y gnome-boxes
  elif command -v pacman > /dev/null; then
    sudo pacman -S --noconfirm gnome-boxes
  fi
else
  if command -v apt-get > /dev/null; then # Install virt-manager otherwise
    sudo apt-get install -y virt-manager
  elif command -v pacman > /dev/null; then
    sudo pacman -S --noconfirm virt-manager
  fi
fi

# Enable libvirtd service using systemd if available
if command -v systemctl > /dev/null; then
  sudo systemctl enable --now libvirtd
fi

# Checking if libvirtd.service was enabled correctly
if [ "$(systemctl status libvirtd.service | awk 'NR==2{print $4}')" != "enabled;" ]; then
  echo "libvirtd.service is not enabled. Please check why."
fi

# Start default network for networking
sudo virsh net-start default
sudo virsh net-autostart default
if [ "$(sudo virsh net-list --all | awk 'NR==3{print $3}')" != "yes" ]; then 
  echo "Default network for virtual machines is not set to autostart. Please check why."
fi

# The End
echo "Reboot the system."

