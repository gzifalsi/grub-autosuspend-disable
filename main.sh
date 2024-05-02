#!/bin/sh

#disable usb autosuspension

cp /etc/default/grub /etc/default/grub.backup #backup /etc/default/grub
params=$(cat grubtemp | grep GRUB_CMDLINE_LINUX_DEFAULT) #keep the current kernel parameters
params=$(echo "$params" | sed 's/.$//')
params="$params usbcore.autosuspend=-1\"" #add usbcore.autosuspend=-1 to the kernel parameters
sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT=/s/.*/$params/" /etc/default/grub #apply changes
update-grub #update grub
echo "rebooting in 3s"
sleep 3
reboot
