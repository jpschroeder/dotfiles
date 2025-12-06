# Keychron Keyboard Firmware Setup/Debug

## Quick Start
1. Open the [Keychron Launcher](https://launcher.keychron.com/) in Google Chrome.
2. Connect your keyboard.
3. Start configuring.`

## Troubleshooting

* Check the device logs in Chrome: `chrome://device-log/`
* If you see the error:

```
Failed to open '/dev/hidraw7': FILE_ERROR_ACCESS_DENIED
Access denied opening device read-write, trying read-only.
```

* The device permissions need to be updated. Run the following command (substitute hidrawX with the device name from your logs):

```sh
sudo chmod a+rw /dev/hidraw7
```

    * Original permissions: `crw------- ... /dev/hidrawX`
    * New permissions: `crw-rw-rw- ... /dev/hidrawX`

* Relaunch the Keychron Launcher.

Note: This permission change does not survive a reboot.

## The Fix (Permanent udev rule)

To avoid permission errors, create a udev rule that automatically grants the current user access to the keyboard.

* Find the keychron vendor ID:

```sh
> lsusb | grep -i keychron
Bus 007 Device 003: ID 3434:0311 Keychron Keychron V1
# 3434 is the vendor id
```

* Create the Rule File: Create a new file called `99-keychron.rules` in `/etc/udev/rules.d/`
    * See the file in this directory
    * Note: In my arch setup, my current user is in the `wheel` group

* Apply the changes (or just reboot)

```sh
sudo udevadm control --reload-rules && sudo udevadm trigger
```

* Then disconnect and reconnect the keyboard and restart Chrome (or just reboot)

## Terminology

* VIA: Keyboard firmware configurator.
* Keychron Launcher: Keychron's specific, forked version of the VIA configurator.

## References

* <https://bbs.archlinux.org/viewtopic.php?id=285709>
* <https://www.reddit.com/r/Keychron/comments/12iinsi/comment/jfuf0mj/>
* <https://www.reddit.com/r/Keychron/comments/1e5um1u/a_linux_user_psa/>

