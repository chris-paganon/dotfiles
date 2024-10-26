This is hopefully unnecessary. You should be able to boot into a snapper snapshot from GRUB, then use btrfs-assistant to do the recovery. If that doesn't work, then:

1. Boot to live USB
2. `mount -o subvolid=5 /dev/nvme... /mnt`
3. Rename existing `/mnt/@` to `/mnt/@.broken`
4. Look for the snapshot: `grep -r '<date>' /mnt/@snapshots/*/info.xml` We can add `-A 5 -B 5` to get more info or replace date with description for example
5. copy snapshot to replace root subvolume: `btrfs subvolume snapshot /mnt/@snapshots/XXX/snapsht /mnt/@`
6. unmount top level volume: `umount /mnt`
7. Next steps may not be necessary anymore now that I added `rootflags=subvol=/@` to GRUB config kernel parameters (/etc/default/grub > GRUB_CMDLINE_LINUX_DEFAULT): [https://wiki.archlinux.org/title/Btrfs#Mounting_subvolume_as_root](https://wiki.archlinux.org/title/Btrfs#Mounting_subvolume_as_root)
8. mount the new subvolume: `mount -o subvol=@ /dev/nvme... /mnt`
9. set it as default: `btrfs subvolume set-defaut /mnt`
10. unmount it: `umount /mnt`
11. remount it as default: `mount /dev/nvme... /mnt`
12. mount the boot volume: `mount /dev/nvme... /mnt/boot`
13. chroot in: `arch-chroot /mnt`
14. Update GRUB: `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
15. exit chroot and reboot


There is also this simple script but it wont work if install is totally inaccessible [https://aur.archlinux.org/packages/snapper-rollback](https://aur.archlinux.org/packages/snapper-rollback)