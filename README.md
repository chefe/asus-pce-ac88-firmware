# asus-pce-ac88-firmware
A script to generate the linux firmware for the [ASUS PCE-AC88](https://www.asus.com/Networking/PCE-AC88)

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
Replace XX with the correct domain code (see [Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2))

```
$ iw reg set XX
```

### Not seeing any 5GHz networks

If you cannot see any 5GHz networks try setting the network to channel 40 or lower in your router. 

## Useful links
* https://ubuntuforums.org/showthread.php?t=2337200&p=13618497#post13618497
* https://blog.cooperteam.net/post/2017-11-10-asus-ac88-wifi-on-linux
* https://rhees.nl/2017/03/10/HOWTO-install-drivers-for-the-Asus-PCE-AC88-on-Debian-Jessie/
