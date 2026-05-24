#!/bin/sh

# Dependencies:
#   - sbctl
#   - mtools
#   - libisoburn

set -e # Exit immediately if any command fails

name=$(echo "$1" | rev | cut -c 5- | rev)

echo "-> Extracting boot images and files..."
# 1. Extract the raw UEFI partition image
osirrox -indev "$name.iso" -extract_boot_images ./

# 2. Extract the specific files to the current directory using explicit source destination pairs
xorriso -indev "$name.iso" \
	-osirrox on \
	-extract /arch/boot/x86_64/vmlinuz-linux ./vmlinuz-linux \
	-extract /EFI/BOOT/BOOTx64.EFI ./BOOTx64.EFI \
	-extract /EFI/BOOT/BOOTIA32.EFI ./BOOTIA32.EFI \
	-extract /shellx64.efi ./shellx64.efi

echo "-> Signing binaries..."
chmod +w BOOTx64.EFI BOOTIA32.EFI shellx64.efi vmlinuz-linux
sudo sbctl sign BOOTx64.EFI
sudo sbctl sign BOOTIA32.EFI
sudo sbctl sign shellx64.efi
sudo sbctl sign vmlinuz-linux

echo "-> Updating UEFI partition image..."
mcopy -D oO -i eltorito_img2_uefi.img vmlinuz-linux ::/arch/boot/x86_64/vmlinuz-linux
mcopy -D oO -i eltorito_img2_uefi.img BOOTx64.EFI BOOTIA32.EFI ::/EFI/BOOT/
mcopy -D oO -i eltorito_img2_uefi.img shellx64.efi ::/

echo "-> Repacking ISO..."
xorriso -indev "$name.iso" \
	-outdev "$name-Secure_Boot.iso" \
	-map vmlinuz-linux /arch/boot/x86_64/vmlinuz-linux \
	-map_l ./ /EFI/BOOT/ BOOTx64.EFI BOOTIA32.EFI -- \
	-map_l ./ / shellx64.efi -- \
	-boot_image any replay \
	-append_partition 2 0xef eltorito_img2_uefi.img

echo "-> Cleaning up temporary files..."
rm -f BOOTIA32.EFI BOOTx64.EFI eltorito_catalog.img \
    eltorito_img1_bios.img eltorito_img2_uefi.img \
    mbr_code_isohybrid.img mbr_part2_efi.img shellx64.efi \
    systemarea.img vmlinuz-linux gpt_part3_efi.img 2>/dev/null || true

echo "-> Deleting the original ISO in 5 seconds..."
sleep 5
echo "-> Deleting the original ISO..."
rm "$name.iso"

