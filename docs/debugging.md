Crash after pacman -Syu & grub cant find vmlinuz (maybe lacked space on boot partition during upgrade)

- Boot into live USB
- Mount files & boot
- chroot in
- Run `pacman -S linux`

Crash after pacman -Syu & /boot can’t be mounted.

- From normal boot entry, run `uname -r` . This is the version of kernel booted into. Most likely kernel modules installed are still on previous version, causing the problems.
- Boot into live USB
- Mout files & boot
- chroot in
- Re-install previous version of linux (must be same as `uname -r` from above): `pacman -U file:///var/cache/pacman/pkg/linux....tar...`
- See below if this didn’t work

[https://bbs.archlinux.org/viewtopic.php?id=178358](https://bbs.archlinux.org/viewtopic.php?id=178358)

Trying to boot into a snapshot seemed to make `mount` from live ISO mounted the wrong files. But normal boot did boot into the last corrupted state. So running anything from chroot from the mounted filesystem from live ISO was useless because it didn’t make any changes to the filesystem I actually booted into. To fix this, run steps 7 to 13 from snapper recovery page here.

## Microphone

### Pulseaudio

Make sure mic is plugged in before starting laptop. Launch and close vivladi. Launch `alsamixer`, press F4 and turn microphone on/off.

If it still doesn't work, press F6 and look for the entry with a bunch of controls, and turn mic options on/off.
Play around with pamixer, parecord & pactl until it works.
After doing a bunch of

```
pamixer --increase 5 --source 4
pamixer --list-sources
parecord -rv test.wav
pactl list sources
```

`pamixer --list-sources` shows a source with ID 1 and another that keeps increasing after each plug/unplug. That is what actually does it.

Seemed like `pamixer --increase 5 --source 1` did it.
Or maybe I want `pactl get-default-source` to be this one: ` alsa_output.pci-0000_06_00.6.analog-stereo.monitor`
The mic source is usually ID 1, whether it’s plugged in or not. Doing `systemctl --user restart pulseaudio` fixed it this time.
