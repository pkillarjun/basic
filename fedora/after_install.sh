#!/usr/bin/env bash

sudo dnf -y update

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y git cmake automake autoconf yacc bison libtool lcov
sudo dnf install -y libasan libubsan libtsan libhwasan liblsan
sudo dnf install -y clang clang-devel llvm llvm-devel compiler-rt libcxx-devel libcxx-static
sudo dnf install -y golang rust cargo rustfmt perl-core
sudo dnf install -y podman podman-compose podman-docker
sudo dnf install -y ffmpeg vlc libde265 --allowerasing
sudo dnf install -y chromium wireshark python3-pwntools vim-common neovim btop htop qbittorrent tor torbrowser-launcher

# Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.anydesk.Anydesk
flatpak install -y flathub com.valvesoftware.Steam

# Oh My Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Neovim base conf
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

# bashrc conf
mkdir -p $HOME/.go
cat bashrc >> ~/.bashrc
