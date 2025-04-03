#!/bin/sh

# See https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#ISO_repacking
# Requires mtools and libisoburn

name=$(echo $1| rev | cut -c 5- | rev)

osirrox -indev "$name.iso" \
	-extract_boot_images ./ \
	-cpx /arch/boot/x86_64/vmlinuz-linux \
	/EFI/BOOT/BOOTx64.EFI \
	/EFI/BOOT/BOOTIA32.EFI \
	/shellx64.efi \
	/shellia32.efi ./

chmod +w BOOTx64.EFI BOOTIA32.EFI shellx64.efi shellia32.efi vmlinuz-linux

sudo sbctl sign BOOTx64.EFI
sudo sbctl sign BOOTIA32.EFI
sudo sbctl sign shellx64.efi
sudo sbctl sign shellia32.efi
sudo sbctl sign vmlinuz-linux

mcopy -D oO -i eltorito_img2_uefi.img vmlinuz-linux ::/arch/boot/x86_64/vmlinuz-linux
mcopy -D oO -i eltorito_img2_uefi.img BOOTx64.EFI BOOTIA32.EFI ::/EFI/BOOT/
mcopy -D oO -i eltorito_img2_uefi.img shellx64.efi shellia32.efi ::/

xorriso -indev "$name.iso" \
	-outdev "$name-Secure_Boot.iso" \
	-map vmlinuz-linux /arch/boot/x86_64/vmlinuz-linux \
	-map_l ./ /EFI/BOOT/ BOOTx64.EFI BOOTIA32.EFI -- \
	-map_l ./ / shellx64.efi shellia32.efi -- \
	-boot_image any replay \
	-append_partition 2 0xef eltorito_img2_uefi.img

rm BOOTIA32.EFI BOOTx64.efi eltorito_catalog.img \
    eltorito_img1_bios.img eltorito_img2_uefi.img \
    mbr_code_isohybrid.img mbr_part2_efi.img \
	shellia32.efi shellx64.efi systemarea.img \
	vmlinuz-linux "$name.iso"

