## How to start ssh agent (if not enabled by default)
```
eval $(ssh-agent)
ssh-add
```
### Use it with sudo (useful for git sometimes)
`sudo SSH_AUTH_SOCK="$SSH_AUTH_SOCK" git`

## Add hardware acceleration to Firefox
Change these in about:config (after installing some other things I believe)
```
media.ffmpeg.vaapi.enabled = true 
gfx.x11-egl.force-enabled = true 
widget.dmabuf.force-enabled = true 
media.av1.enabled = false
```

## Get X11 software name
Run `xprop` then click on the window. `WM_CLASS(STRING)` 2nd string is the class name

## Get key name
`xev` or to get just the relevant name `xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'`

## Upload screenshots to imgur with flameshot
https://flameshot.org/docs/guide/imgur-help/

## Downgrade everything
https://wiki.archlinux.org/title/Arch_Linux_Archive#How_to_restore_all_packages_to_a_specific_date

## X11 forwarding
https://wiki.archlinux.org/title/OpenSSH#X11_forwarding