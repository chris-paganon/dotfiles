## Always disable hibernation on windows:
`powercfg /H off`

## How to format a USB in windows

Install rufus OR:
```
diskpart //Open diskpart utility in windows
list disk
select disk X //Select the right disk
clean
create partition primary
active
format fs=Fat32 quick
```

## How to fully shrink partition from Windows
[https://superuser.com/questions/561605/how-can-i-increase-my-shrink-space-in-disk-management](https://superuser.com/questions/561605/how-can-i-increase-my-shrink-space-in-disk-management)

Run `powercfg /h off`

Do this to disable pagefile: [https://www.techbout.com/disable-pagefile-windows-89478/](https://www.techbout.com/disable-pagefile-windows-89478/)
Disable system restore: [https://superuser.com/questions/484375/how-can-i-shrink-my-windows-partition-further-than-the-disk-management-is-allowi](https://superuser.com/questions/484375/how-can-i-shrink-my-windows-partition-further-than-the-disk-management-is-allowi)

restart

defrag disk and optimize Master File Table (MFT) with UltraDefrag