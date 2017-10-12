#!/bin/zsh

echo "Setting keyboard layout to CH..."
loadkeys de_CH-latin1

# ls /sys/firmware/efi/efivars

echo "Setting timezone and ntp..."
timedatectl set-ntp true
timedatectl set-timezone Europe/Zurich
timedatectl status

echo "Partitioning..."
fdisk -l
fdisk /dev/sda
# set up main partition primary 1 and boot parition primary 2

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda1 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot

lsblk -f

echo "Installing base packages..."
pacstrap /mnt base

echo "Configuring the file system..."
genfstab -U /mnt >> /mnt/etc/fstab
echo "- fstab ----------------"
cat /mnt/etc/fstab
echo "------------------------"

arch-chroot /mnt
