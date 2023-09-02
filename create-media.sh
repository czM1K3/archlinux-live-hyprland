#!/bin/env bash

# Create fresh directory
rm -rf archlive
cp -r /usr/share/archiso/configs/releng/ archlive

# Add required packages
cat >> ./archlive/packages.x86_64 <<- EOM

archlinux-keyring

hyprland
waybar
sddm
xorg-server
xf86-video-amdgpu
xf86-video-amdgpu
xf86-video-intel
xf86-video-nouveau
mesa
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
gst-plugin-pipewire
libpulse
wireplumber
fish
network-manager-applet
polkit-kde-agent

alacritty
firefox
thunar
wofi
htop
gnome-disk-utility
EOM

# Copy custom files
cp -r ./root/* ./archlive/airootfs

# Add files permissions
sed -i 's/file_permissions=(/file_permissions=(\n  ["\/home\/michal"]="1000:1000:755"\n  ["\/etc\/gshadow"]="0:0:0400"/g' ./archlive/profiledef.sh

# Create user archie
printf "archie:x:1000:1000::/home/archie:/usr/bin/fish\n" >> ./archlive/airootfs/etc/passwd
printf "archie:\$6\$2AWHIzAq.3GDaiMZ\$Y5Uyhj5KmT49bJSwGyAqq7BoZRxGtuHdFIdA3wIRepUR7hxEZX/uKCsL1GjmawvUtCECQ07n17pQryhccZ57U/:14871::::::" >> ./archlive/airootfs/etc/shadow
cat >> ./archlive/airootfs/etc/group <<- EOM
root:x:0:root
adm:x:4:archie
wheel:x:10:archie
uucp:x:14:archie
archie:x:1000:
EOM

cat >> ./archlive/airootfs/etc/gshadow <<- EOM
root:!*::root
archie:!*::
EOM

# Enable sddm as display manager
ln -s /usr/lib/systemd/system/sddm.service archlive/airootfs/etc/systemd/system/display-manager.service

# Build iso
sudo mkdir -p tmp
sudo mkarchiso -v -w ./tmp -o ./out ./archlive
sudo rm -rf ./tmp
