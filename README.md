# asus-pce-ac88-firmware

## Usage

1. Download and extract the firmware from a router firmware
```
$ ./download.sh
```

2. Copy the firmware file to the host
```
$ scp brcmfmac4366c-pcie.bin root@host:/tmp
```

3. Move the firmware to the correct folder
```
$ sudo cp /tmp/brcmfmac4366c-pcie.bin /lib/firmware/brcm/brcmfmac4366c-pcie.bin
```

4. Restart the host

## Troubleshooting

### Wrong regulatory domain

Run the following command on the host to set the regulatory domain.
Replace xx with the correct domain code (see [Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2))

```
$ iw reg set XX
```

## Useful links
* https://ubuntuforums.org/showthread.php?t=2337200&p=13618497#post13618497
* https://blog.cooperteam.net/post/2017-11-10-asus-ac88-wifi-on-linux
* https://rhees.nl/2017/03/10/HOWTO-install-drivers-for-the-Asus-PCE-AC88-on-Debian-Jessie/
