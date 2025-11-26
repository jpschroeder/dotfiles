# Boot Config

This is the systemd boot config file for my xps-15 laptop. It can't actually be restored using stow, but should go in `/boot/loader/entries/arch.conf`

These 2 parameters are the important ones:

`pcie_aspm=off`: Without this, there are errors spamming the logs constantly

`xhci_hcd.quirks=0x80`: Without this, suspend/resume doesn't work correctly with my docking station

You can verify these parameters using:
```sh
cat /proc/cmdline
cat /sys/module/xhci_hcd/parameters/quirks
```
