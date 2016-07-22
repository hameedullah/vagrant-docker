#!/bin/bash

# Update the apt repo
sudo apt-get update

# install certificates
sudo apt-get -y install apt-transport-https ca-certificates

# Add Docker key
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D


# Add docker apt repo for ubuntu trusty
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list

# Update the apt repo
sudo apt-get update

# Remove any old container packages
sudo apt-get -y purge lxc-docker

# Install recommended pre-reqs
sudo apt-get -y install linux-image-extra-$(uname -r)

# Install apparmor only required for 12.04 and 14.04
sudo apt-get -y  install apparmor

# Install docker
sudo apt-get -y install docker-engine

# Add docker group
sudo groupadd docker

# Add vagrant user to the docker group so the user can run docker command
sudo usermod -aG docker vagrant

# Add memory and swap accounting
sudo sed -i -e 's/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/' /etc/default/grub

# Update grub configuration
sudo update-grub

# Reboot the machine
sudo reboot

