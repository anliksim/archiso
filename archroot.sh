#!/bin/zsh

echo "Synchronizing clock..."
ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc

echo "Generating locale..."
# vi /etc/locale.gen
locale-gen

echo "Mapping locale..."
echo "LANG=de_CH.UTF-8" > /etc/locale.conf
cat /etc/locale.conf

echo "Mapping keyboard layout..."
echo "KEYMAP=de_CH-latin1" > /etc/vconsole.conf
cat /etc/vconsole.conf

echo "Mapping hostname..."
echo "archi" > /etc/hostname
cat /etc/hostname

echo "Setting root password..."
passwd

pacman -S vim --noconfirm
pacman -S iw --noconfirm
pacman -S wpa_supplicant --noconfirm

echo "Installing bootlaoder..."
pacman -S grub --noconfirm

