#!/bin/bash

sudo apt update
sudo apt install curl vim-gtk3 tree klavaro clementine cmatrix neofetch -y

# install podman stuff
sudo apt install podman skopeo jq -y

# virtualbox
sudo apt install /home/$USER/Downloads/virtualbox-7.0_7.0.12-159484~Debian~bookworm_amd64.deb -y

# Yandex stuff
curl -s https://repo.yandex.ru/yandex-browser/YANDEX-BROWSER-KEY.GPG | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/yandex-browser.gpg
sudo apt install /home/$USER/Downloads/Yandex.deb -y

curl -s http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/yandex-disk.gpg
sudo apt install /home/$USER/Downloads/yandex-disk_latest_amd64.deb
