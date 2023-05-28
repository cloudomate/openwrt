
DTS_DIR := $(DTS_DIR)/amlogic
FAT32_BLOCK_SIZE=1024
FAT32_BLOCKS=$(shell echo $$(($(CONFIG_TARGET_KERNEL_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

define Build/generic-board-bootscr
  mkimage -A arm64 -O linux -T script -C none -a 0 -e 0 -n "boot.scr" -d boot.$(DEVICE_MODEL).txt  $(KDIR)/factory_update_param.ubt
endef

define Build/sdcard-img
	$(RM) -f $@.boot
	mkfs.fat -n BOOT -C $@.boot $(FAT32_BLOCKS)
	mcopy -i $@.boot $(IMAGE_KERNEL) ::zImage
	mcopy -i $@.boot $(KDIR)/image-$(DEVICE_DTS).dtb ::dtb
  mcopy -i $@.boot $(KDIR)/factory_update_param.ubt ::
  mcopy -i $@.boot $(KDIR)/factory_update_param.ubt ::auto_update.ubt
	./gen_aml_sdcard_img.sh $@ $@.boot $(IMAGE_ROOTFS) \
		$(CONFIG_TARGET_KERNEL_PARTSIZE) $(CONFIG_TARGET_ROOTFS_PARTSIZE)
  rm -f $@.boot
endef


define Device/amlogic_s905x3-gtbxbm-2g
  DEVICE_VENDOR := Amlogic
  DEVICE_MODEL := S905X3_GTBXBM_2G
  DEVICE_DTS := meson-sm1-amlogic-s905x3-gtbxbm-2g
  DEVICE_DTS_DIR := ../dts
  DEVICE_PACKAGES :=  kmod-usb3
  KERNEL_NAME := Image
  KERNEL := kernel-bin | append-dtb
  KERNEL_LOADADDR := 0x11000000
  FILESYSTEMS := ext4 squashfs
  IMAGES := sdcard.img
  IMAGE/sdcard.img := generic-board-bootscr | sdcard-img
 endef 
TARGET_DEVICES += amlogic_s905x3-gtbxbm-2g
