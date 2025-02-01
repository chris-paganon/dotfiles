# last actions before it worked this time:
# removed some custom config in modprobe.d
# probably: options snd-hda-intel model=headset-mode6
# added this wireplumber config: https://wiki.archlinux.org/title/PipeWire#Microphone_is_not_detected_by_PipeWire
# run `sudo mkinitcpio -P``


# lsmod

Module                  Size  Used by
ufs                   102400  0
hfsplus               172032  0
hfs                   102400  0
cdrom                  81920  2 hfsplus,hfs
minix                  53248  0
msdos                  16384  0
jfs                   262144  0
nls_ucs2_utils          8192  1 jfs
xfs                  3829760  0
ext4                 1155072  0
mbcache                16384  1 ext4
jbd2                  208896  1 ext4
rfcomm                102400  4
snd_seq_dummy          12288  0
snd_hrtimer            12288  1
snd_seq               131072  7 snd_seq_dummy
snd_seq_device         16384  1 snd_seq
ccm                    20480  6
tun                    69632  2
ip6table_nat           12288  0
ip6table_filter        12288  0
ip6_tables             36864  2 ip6table_filter,ip6table_nat
iptable_nat            12288  0
iptable_filter         12288  0
uinput                 20480  2
cmac                   12288  2
algif_hash             12288  1
algif_skcipher         12288  1
af_alg                 32768  6 algif_hash,algif_skcipher
bnep                   36864  2
snd_soc_dmic           12288  0
snd_acp6x_pdm_dma      16384  0
snd_soc_acp6x_mach     36864  0
snd_hda_codec_realtek   212992  1
snd_sof_amd_acp70      16384  0
snd_sof_amd_acp63      16384  0
snd_hda_codec_generic   114688  1 snd_hda_codec_realtek
amd_atl                57344  1
intel_rapl_msr         20480  0
vfat                   24576  1
snd_soc_acpi_amd_match     8192  1 snd_sof_amd_acp63
snd_hda_scodec_component    20480  1 snd_hda_codec_realtek
snd_hda_codec_hdmi     98304  2
intel_rapl_common      53248  1 intel_rapl_msr
fat                   110592  2 msdos,vfat
snd_sof_amd_vangogh    16384  0
snd_sof_amd_rembrandt    16384  0
snd_sof_amd_renoir     16384  0
snd_sof_amd_acp        69632  5 snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp63,snd_sof_amd_renoir
snd_sof_pci            24576  5 snd_sof_amd_acp70,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp63,snd_sof_amd_renoir
snd_sof_xtensa_dsp     16384  1 snd_sof_amd_acp
amdgpu              15429632  15
snd_sof               462848  2 snd_sof_amd_acp,snd_sof_pci
snd_sof_utils          16384  1 snd_sof
snd_pci_ps             28672  0
snd_amd_sdw_acpi       16384  2 snd_sof_amd_acp,snd_pci_ps
soundwire_amd          45056  2 snd_sof_amd_acp,snd_pci_ps
nft_reject_inet        12288  0
kvm_amd               237568  0
nf_reject_ipv4         12288  1 nft_reject_inet
soundwire_generic_allocation    12288  1 soundwire_amd
nf_reject_ipv6         20480  1 nft_reject_inet
soundwire_bus         147456  2 soundwire_generic_allocation,soundwire_amd
nft_reject             12288  1 nft_reject_inet
kvm                  1388544  1 kvm_amd
snd_soc_core          454656  5 snd_soc_acp6x_mach,snd_sof,snd_acp6x_pdm_dma,soundwire_amd,snd_soc_dmic
snd_hda_intel          65536  3
crct10dif_pclmul       12288  1
snd_intel_dspcfg       40960  2 snd_hda_intel,snd_sof
snd_compress           28672  1 snd_soc_core
crc32_pclmul           12288  0
snd_intel_sdw_acpi     16384  1 snd_intel_dspcfg
ac97_bus               12288  1 snd_soc_core
snd_pcm_dmaengine      16384  1 snd_soc_core
polyval_clmulni        12288  0
uvcvideo              180224  0
snd_hda_codec         212992  4 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_realtek
mt7921e                24576  0
snd_rpl_pci_acp6x      20480  0
amdxcp                 12288  1 amdgpu
polyval_generic        12288  1 polyval_clmulni
btusb                  77824  0
snd_acp_pci            12288  0
drm_exec               12288  1 amdgpu
mt7921_common          94208  1 mt7921e
ghash_clmulni_intel    16384  0
videobuf2_vmalloc      20480  1 uvcvideo
snd_hda_core          147456  5 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek
snd_acp_legacy_common    16384  1 snd_acp_pci
btrtl                  32768  1 btusb
gpu_sched              65536  1 amdgpu
sha512_ssse3           53248  0
uvc                    12288  1 uvcvideo
mt792x_lib             69632  2 mt7921e,mt7921_common
btintel                69632  1 btusb
snd_pci_acp6x          20480  0
videobuf2_memops       16384  1 videobuf2_vmalloc
drm_buddy              24576  1 amdgpu
snd_hwdep              20480  1 snd_hda_codec
sha1_ssse3             32768  0
nvidia_drm            135168  3
hid_multitouch         36864  0
spd5118                16384  0
nft_masq               12288  0
aesni_intel           122880  7
mt76_connac_lib        94208  3 mt792x_lib,mt7921e,mt7921_common
snd_pci_acp5x          20480  0
nvidia_uvm           3837952  2
amd_pmf                73728  0
ucsi_acpi              12288  0
videobuf2_v4l2         40960  1 uvcvideo
btbcm                  24576  1 btusb
i2c_algo_bit           20480  1 amdgpu
snd_pcm               200704  14 snd_sof_amd_acp,snd_hda_codec_hdmi,snd_pci_acp6x,snd_hda_intel,snd_hda_codec,snd_sof,snd_acp6x_pdm_dma,snd_compress,snd_soc_core,snd_sof_utils,soundwire_amd,snd_hda_core,snd_pci_ps,snd_pcm_dmaengine
snd_rn_pci_acp3x       24576  0
gf128mul               16384  2 polyval_generic,aesni_intel
nvidia_modeset       1671168  3 nvidia_drm
r8169                 126976  0
sp5100_tco             20480  0
typec_ucsi             77824  1 ucsi_acpi
amdtee                 32768  0
snd_acp_config         24576  10 snd_rn_pci_acp3x,snd_sof_amd_acp70,snd_pci_acp6x,snd_pci_acp5x,snd_sof_amd_rembrandt,snd_sof_amd_vangogh,snd_sof_amd_acp63,snd_acp_pci,snd_pci_ps,snd_sof_amd_renoir
btmtk                  32768  1 btusb
drm_suballoc_helper    12288  1 amdgpu
mt76                  135168  4 mt792x_lib,mt7921e,mt7921_common,mt76_connac_lib
crypto_simd            16384  1 aesni_intel
videobuf2_common       94208  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
snd_timer              57344  3 snd_seq,snd_hrtimer,snd_pcm
mac80211             1638400  4 mt792x_lib,mt76,mt7921_common,mt76_connac_lib
drm_display_helper    270336  1 amdgpu
videodev              393216  2 videobuf2_v4l2,uvcvideo
realtek                45056  1
snd                   155648  21 snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek,snd_sof,snd_timer,snd_compress,snd_soc_core,snd_pcm
bluetooth            1101824  34 btrtl,btmtk,btintel,btbcm,bnep,btusb,rfcomm
typec                 110592  1 typec_ucsi
cryptd                 28672  3 crypto_simd,ghash_clmulni_intel
joydev                 28672  0
snd_soc_acpi           16384  3 snd_sof_amd_acp,snd_acp_config,snd_pci_ps
amd_sfh                53248  1 amd_pmf
drm_ttm_helper         16384  3 amdgpu,nvidia_drm
i2c_hid_acpi           12288  0
i2c_piix4              36864  0
libarc4                12288  1 mac80211
mdio_devres            12288  1 r8169
mousedev               24576  0
cec                    94208  1 drm_display_helper
mc                     90112  4 videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
rapl                   20480  0
cfg80211             1396736  4 mt76,mac80211,mt7921_common,mt76_connac_lib
wmi_bmof               12288  0
asus_nb_wmi            32768  0
pcspkr                 12288  0
ttm                   106496  2 amdgpu,drm_ttm_helper
libphy                229376  3 r8169,mdio_devres,realtek
k10temp                16384  0
i2c_smbus              20480  1 i2c_piix4
snd_pci_acp3x          20480  0
roles                  16384  1 typec_ucsi
soundcore              16384  1 snd
ccp                   184320  2 kvm_amd,amdtee
crc16                  12288  3 bluetooth,amdgpu,ext4
tee                    49152  2 amd_pmf,amdtee
amd_pmc                57344  0
i2c_hid                40960  1 i2c_hid_acpi
nft_ct                 28672  0
mac_hid                12288  0
nft_chain_nat          12288  0
nf_nat                 61440  4 ip6table_nat,nft_masq,nft_chain_nat,iptable_nat
nf_conntrack          200704  3 nf_nat,nft_ct,nft_masq
nf_defrag_ipv6         24576  1 nf_conntrack
nf_defrag_ipv4         12288  1 nf_conntrack
nvidia              77496320  43 nvidia_uvm,nvidia_modeset
nf_tables             385024  5 nft_ct,nft_reject_inet,nft_masq,nft_chain_nat,nft_reject
crypto_user            20480  0
dm_mod                225280  0
loop                   45056  0
nfnetlink              20480  2 nf_tables
ip_tables              36864  2 iptable_filter,iptable_nat
x_tables               65536  6 ip6table_filter,iptable_filter,ip6table_nat,ip6_tables,ip_tables,iptable_nat
hid_asus               40960  0
asus_wmi              110592  2 asus_nb_wmi,hid_asus
sparse_keymap          12288  1 asus_wmi
platform_profile       12288  2 amd_pmf,asus_wmi
rfkill                 40960  7 asus_wmi,bluetooth,cfg80211
btrfs                2170880  1
blake2b_generic        24576  0
libcrc32c              12288  5 nf_conntrack,nf_nat,btrfs,nf_tables,xfs
crc32c_generic         12288  0
xor                    20480  1 btrfs
hid_generic            12288  0
serio_raw              20480  0
raid6_pq              122880  1 btrfs
usbhid                 86016  1 hid_asus
atkbd                  40960  0
sdhci_pci             106496  0
libps2                 20480  1 atkbd
vivaldi_fmap           12288  1 atkbd
cqhci                  45056  1 sdhci_pci
nvme                   65536  2
sdhci                  94208  1 sdhci_pci
crc32c_intel           16384  2
nvme_core             258048  3 nvme
sha256_ssse3           36864  0
i8042                  57344  1 asus_wmi
mmc_core              270336  3 sdhci,cqhci,sdhci_pci
video                  81920  4 asus_wmi,amdgpu,asus_nb_wmi,nvidia_modeset
nvme_auth              24576  1 nvme_core
serio                  28672  5 amd_pmc,serio_raw,atkbd,i8042
wmi                    28672  3 video,asus_wmi,wmi_bmof



# arecord -l

**** List of CAPTURE Hardware Devices ****
card 2: Generic_1 [HD-Audio Generic], device 0: ALC285 Analog [ALC285 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0



# ls -l /dev/snd/

drwxr-xr-x  root root  100 B Sun Jan 26 20:58:12 2025 by-path
crw-rw----+ root audio   0 B Sun Jan 26 20:58:12 2025 controlC0
crw-rw----+ root audio   0 B Sun Jan 26 20:58:12 2025 controlC1
crw-rw----+ root audio   0 B Sun Jan 26 20:58:12 2025 controlC2
crw-rw----+ root audio   0 B Sun Jan 26 20:58:12 2025 hwC0D0
crw-rw----+ root audio   0 B Sun Jan 26 20:58:12 2025 hwC1D0
crw-rw----+ root audio   0 B Sun Jan 26 20:58:12 2025 hwC2D0
crw-rw----+ root audio   0 B Sun Jan 26 20:58:22 2025 pcmC0D3p
crw-rw----+ root audio   0 B Sun Jan 26 20:58:22 2025 pcmC0D7p
crw-rw----+ root audio   0 B Sun Jan 26 20:58:22 2025 pcmC0D8p
crw-rw----+ root audio   0 B Sun Jan 26 20:58:22 2025 pcmC0D9p
crw-rw----+ root audio   0 B Sun Jan 26 20:58:22 2025 pcmC1D3p
crw-rw----+ root audio   0 B Sun Jan 26 20:58:54 2025 pcmC2D0c
crw-rw----+ root audio   0 B Sun Jan 26 20:58:54 2025 pcmC2D0p
crw-rw----+ root audio   0 B Sun Jan 26 20:58:22 2025 seq
crw-rw----+ root audio   0 B Sun Jan 26 20:58:10 2025 timer


# sudo fuser --all --verbose /dev/snd/* | copy

                     USER        PID ACCESS COMMAND
/dev/snd/by-path:
/dev/snd/controlC0:  chris     F.... wireplumber
/dev/snd/controlC1:  chris     F.... wireplumber
/dev/snd/controlC2:  chris     F.... wireplumber
/dev/snd/hwC0D0:
/dev/snd/hwC1D0:
/dev/snd/hwC2D0:
/dev/snd/pcmC0D3p:
/dev/snd/pcmC0D7p:
/dev/snd/pcmC0D8p:
/dev/snd/pcmC0D9p:
/dev/snd/pcmC1D3p:
/dev/snd/pcmC2D0c:
/dev/snd/pcmC2D0p:
/dev/snd/seq:        chris     F.... pipewire
/dev/snd/timer:


# cat /proc/asound/card2/codec#0

Codec: Realtek ALC285
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0285
Subsystem Id: 0x10431c52
Revision Id: 0x100002
No Modem Function Group found
Default PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
  Power: setting=D0, actual=D0
GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
  IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Speaker Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x57 0x57]
  Converter: stream=0, channel=0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Headphone Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Device: name="ALC285 Analog", type="Audio", device=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x00 0x00]
  Converter: stream=0, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x06 [Audio Output] wcaps 0x411: Stereo
  Converter: stream=0, channel=0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Device: name="ALC285 Analog", type="Audio", device=0
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x3f 0x3f]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x24
Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Control: name="Capture Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Control: name="Capture Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x3f 0x3f]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x23
Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x22
Node 0x0a [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
  Control: name="Internal Mic Boost Volume", index=1, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000020: IN
  Pin Default 0x90a60150: [Fixed] Mic at Int N/A
    Conn = Digital, Color = Unknown
    DefAssociation = 0x5, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
  Control: name="Internal Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x01 0x01]
  Pincap 0x00000020: IN
  Pin Default 0x90a60140: [Fixed] Mic at Int N/A
    Conn = Digital, Color = Unknown
    DefAssociation = 0x4, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Speaker Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x00010014: OUT EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x90170110: [Fixed] Speaker at Int N/A
    Conn = Analog, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x02
Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x16 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0000001c: OUT HP Detect
  Pin Default 0x40000000: [N/A] Line Out at Ext N/A
    Conn = Unknown, Color = Unknown
    DefAssociation = 0x0, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x02* 0x03
Node 0x17 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Bass Speaker Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0000001c: OUT HP Detect
  Pin Default 0x90170120: [Fixed] Speaker at Int N/A
    Conn = Analog, Color = Unknown
    DefAssociation = 0x2, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 3
     0x02* 0x03 0x06
Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000024: IN Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Control: name="Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=02, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x00013734: IN OUT EAPD Detect
    Vref caps: HIZ 50 GRD 80 100
  EAPD 0x2: EAPD
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x02* 0x03
Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1d [Pin Complex] wcaps 0x400400: Mono
  Pincap 0x00000020: IN
  Pin Default 0x40c63a45: [N/A] SPDIF In at Ext N/A
    Conn = Digital, Color = Blue
    DefAssociation = 0x4, Sequence = 0x5
  Pin-ctls: 0x20: IN
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1e [Pin Complex] wcaps 0x400501: Stereo
  Pincap 0x00000010: OUT
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x06
Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
  Processing caps: benign=0, ncoeff=142
Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Headphone Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0001001c: OUT HP EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x03211030: [Jack] HP Out at Ext Left
    Conn = 1/8, Color = Black
    DefAssociation = 0x3, Sequence = 0x0
  Pin-ctls: 0xc0: OUT HP
  Unsolicited: tag=01, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x02 0x03*
Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 5
     0x19 0x1a 0x1b 0x1d 0x13
Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 5
     0x19 0x1a 0x1b 0x1d 0x12
Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
  Connection: 3
     0x12 0x13* 0x18
