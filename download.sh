#!/bin/bash

# cleanup files
rm -rf Firmware_Release/ FW_RT_AC88U_300438445717.zip

# download router firmware
wget https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC88U/FW_RT_AC88U_300438445717.zip

# extract firmware zip
7z x FW_RT_AC88U_300438445717.zip

# switch to release folder
cd Firmware_Release

# extract firmware file
7z x RT-AC88U_3.0.0.4_384_45717-gadd52a8.trx

# define variable to binary file for use in the following commands
file="lib/modules/2.6.36.4brcmarm/kernel/drivers/net/dhd/dhd.ko"

# find the size of the the binary part (driver starts with 4366c0)
sizeInHex=$(readelf -s $file | grep 4366c0 | grep dlarray | head -n 1 | awk '{ print $3 }')

# convert the size from hex to dec for later use
sizeInDec=$((16#${sizeInHex:2}))

# find the offset where the binary part starts (00 f2 3e b8 ...)
offsetInDec=$(od -v -t x1 $file | sed 's/[^ ]* *//' | tr '\012' ' ' | grep -b -i -o "00 f2 3e b8" | sed 's/:.*/\/3/' | bc | head -n 1)

# extract the correct binary part from the firmware
dd if=$file skip=$offsetInDec ibs=1 count=$sizeInDec of=brcmfmac4366c-pcie.bin

# move firmware a folder up
mv brcmfmac4366c-pcie.bin ..

# switch back to root folder
cd ..

# cleanup files
rm -r Firmware_Release/ FW_RT_AC88U_300438445717.zip

