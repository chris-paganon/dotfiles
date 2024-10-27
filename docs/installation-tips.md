## Base setup
- Here is the wiki: https://wiki.archlinux.org/title/Installation_guide
- Follow everything plus the btrfs steps from below
- ⚠ Don't forget to install `networkmanager` before rebooting into live USB

### [btrfs: subvolumes, mounting & swap](https://wiki.archlinux.org/title/BtrfsRecommended [btrfs](https://wiki.archlinux.org/title/Btrfs) 
**Some of this might be slightly wrong or out of order. Gotta do it once from scratch to be sure**

 [After formatting the partition to btrfs:](https://wiki.archlinux.org/title/Installation_guide#Format_the_partitions)
Create these subvolumes at root from live USB (example: `btrfs subvolume create /mnt/@swap):
- /@
- /@swap
- /@home
- /@var_log
- /@pac_pkg
Re-mount with `/@` to set it up as default:
```
umount /mnt
mount /dev/partitionId /mnt -o subvol=/@
btrfs subvolume set-default /mnt (not entirely sure about this one, may be: btrfs subvolume set-default subvolume-id /mnt)
umount /mnt
mount /dev/partitionId /mnt (this should have mounted /@ this time)
```

After [installing GRUB](https://wiki.archlinux.org/title/Installation_guide#Boot_loader) and before booting for the 1st time:
1. Keep the existing UUID from fstab contents
2. Copy over the fstab content from my etcfiles repo tp define all the subvolumes mount points
3. Replace etcfiles UUIDs with the one saved from 1

Create the swap file and enable it (https://wiki.archlinux.org/title/Btrfs#Swap_file):
```
btrfs filesystem mkswapfile --size 48g --uuid clear /swap/swapfile
swapon /swap/swapfile
```

Add `resume` (for [hibernation](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation)) and `grub-btrfs-overlayfs` (to [be able to boot into snapper snapshots](https://wiki.archlinux.org/title/Snapper#Booting_into_read-only_snapshots)) to `/etc/mkinitcpio.conf` > `HOOKS`. Should look something like this:
`HOOKS=(base udev autodetect microcode modconf keyboard keymap consolefont block filesystems resume fsck grub-btrfs-overlayfs)`

And [regenerate the initramfs](https://wiki.archlinux.org/title/Regenerate_the_initramfs "Regenerate the initramfs"):
`mkinitcpio -P`
## Install my software and config
After creating a new user:
- Install `yay`: https://github.com/Jguer/yay
- Install the full package list from `packages.md` with `yay`
- Setup etcfiles from my etcfiles repo. Replace `/home/chris` with your home directory in `pacman.d/hooks/list-installed.hook`
- Setup dotfiles from here
- There are probably some systemd services to enable 💁

## Not an ASUS laptop?
`supergfxctl` and `asusctl`from my packages are for ASUS laptops only. Probably need to replace `supergfxctl` with [optimus manager](https://github.com/Askannz/optimus-manager) otherwise and remove `asusctl` (hopefully keyboard lights just work).

Then change these .zsh aliases accordingly:
```
hybrid
integrated
fixlight
```

And the i3 config lines including `asusctl`.

### Some optimus-manager pointers:
PRIME render offload never worked: [https://wiki.archlinux.org/title/PRIME#PRIME_render_offload](https://wiki.archlinux.org/title/PRIME#PRIME_render_offload) (GPU never actually turns off)

Instead, working setup with [https://github.com/Askannz/optimus-manager](https://github.com/Askannz/optimus-manager) ([Power management D3 config in hybrid](https://github.com/Askannz/optimus-manager/wiki/A-guide--to-power-management-options#configuration-1--dynamic-power-management-inside-the-nvidia-driver-runtime-d3-power-management))
```
/etc/optimus-manaher/optimus-manager.conf 

[optimus]
startup_mode=hybrid 

[nvidia]
dynamic_power_management=fine
```

But to truly save battery, need to switch to integrate graphics somehow ([config 2, 3 or 4](https://github.com/Askannz/optimus-manager/wiki/A-guide--to-power-management-options))