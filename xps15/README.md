# XPS 15 Boot Config

This is how to set kernel parameters for my xps-15 laptop. These settings aren't meant to be restored using stow.

These 2 parameters are the important ones:

`pcie_aspm=off`: Without this, there are errors spamming the logs constantly

`xhci_hcd.quirks=0x80`: Without this, suspend/resume doesn't work correctly with my docking station

`systemd.tpm2_wait=false`: The system has an issue reading the tpm device. Without this, it will delay startup waiting for it.

You can verify these parameters after boot using:
```sh
cat /proc/cmdline
cat /sys/module/xhci_hcd/parameters/quirks
```

There 2 different ways to set them.

## 1. UEFI Unified Kernel Image (preferred)

If booting a UKI directly from UEFI, you need to set the path: `/etc/cmdline.d/xps15.conf`

Then run: `mkinitcpio -p linux`

## 2. Systemd Boot

If booting through systemd boot, set the path: `/boot/loader/entries/arch.conf`

