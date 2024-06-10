#!/usr/bin/env bash

# Update fedora core
sudo dnf remove -y libreoffice*
sudo dnf -y update

# Install dev toolchain
sudo dnf groupinstall -y "Development Tools" "C Development Tools and Libraries"
sudo dnf install -y clang clang-devel llvm llvm-devel compiler-rt libcxx-devel libcxx-static
sudo dnf install -y libasan libubsan libtsan libhwasan liblsan
sudo dnf install -y golang rust cargo rustfmt cmake

# Install vscode [Sorry stallman]
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code

# RpmFusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.anydesk.Anydesk
flatpak install -y flathub com.valvesoftware.Steam

# FFmpeg & Vlc
sudo dnf install -y ffmpeg vlc libde265 --allowerasing

# Basic utility
sudo dnf install -y podman podman-compose podman-docker
sudo dnf install -y chromium wireshark python3-pwntools vim-common neovim neofetch btop htop openssl qbittorrent

# Oh My Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Neovim base conf
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

# bashrc conf
mkdir -p $HOME/.go
echo '# conf'                   >> ~/.bashrc
echo 'export GOPATH=$HOME/.go'  >> ~/.bashrc
echo "alias vi=nvim"            >> ~/.bashrc
echo 'alias rm="gio trash"'     >> ~/.bashrc
