#!/usr/bin/env bash

# Update fedora core
sudo dnf -y update

# Install basic utility
sudo dnf install -y neovim vim-common neofetch btop htop wireshark tcpdump python3-pwntools chromium
sudo dnf install -y podman podman-compose podman-docker

# Install dev toolchain
sudo dnf install -y clang clang-devel llvm llvm-devel compiler-rt clang-tools-extra libcxx-devel libcxx-static
sudo dnf install -y autoconf automake cmake libtool
sudo dnf install -y libasan libubsan libtsan libhwasan liblsan
sudo dnf install -y ragel bison flex git
sudo dnf groupinstall -y "Development Tools" "C Development Tools and Libraries"
sudo dnf install -y golang lua rust cargo rustfmt

# Install vscode [Sorry stallman]
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code

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

# rpmfusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group update -y core

# ffmpeg vlc
sudo dnf install -y ffmpeg vlc libde265 --allowerasing

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.anydesk.Anydesk
flatpak install flathub com.valvesoftware.Steam

# Other
sudo dnf install -y libreoffice
sudo dnf config-manager --enable fedora-cisco-openh264 -y
