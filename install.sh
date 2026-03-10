#!/bin/bash

# setup scripts
mkdir -p ~/.scripts
cp ./config/scripts/gpu-autocheck.sh ~/.scripts
chmod +x ~/.scripts/gpu-autocheck.sh

# setup environment
mkdir -p ~/.config/environment.d
cp ./config/environment.d/99-nvidia.conf ~/.config/environment.d

# setup rule in udev
sudo cp ./config/rules/99-gpu-power.rules /etc/udev/rules.d
sudo udevadm control --reload

# setup service check boot
sudo cp ./config/services/gpu-check-boot.service /etc/systemd/system/
sudo systemctl enable --now gpu-check-boot.service

# reload or sign out
echo "Done."
echo "Reload or Sign out to reload the environment... Thanks"