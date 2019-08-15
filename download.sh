#!/bin/sh

# download router firmware
wget https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC88U/FW_RT_AC88U_300438445717.zip

# extract firmware zip
7z x FW_RT_AC88U_300438445717.zip

# switch to release folder
cd Firmware_Release

# extract firmware file
7z x RT-AC88U_3.0.0.4_384_45717-gadd52a8.trx

# extract the correct binary part from the firmware
dd if=lib/modules/2.6.36.4brcmarm/kernel/drivers/net/dhd/dhd.ko skip=1269516 ibs=1 count=935317 of=brcmfmac4366c-pcie.bin

# move firmware a folder up
mv brcmfmac4366c-pcie.bin ..

# switch back to root folder
cd ..

# cleanup files
rm -r Firmware_Release/ FW_RT_AC88U_300438445717.zip

# echo some hints
echo "HINT: copy the generated file to /sys/firmware/brcm"
echo "HINT: run 'iw reg set CH' to set the correct frequencies
