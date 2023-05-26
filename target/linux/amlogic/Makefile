# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

BOARD:=amlogic
BOARDNAME:=Amlogic SoC Family
FEATURES:=ext4 audio usb usbgadget display gpio fpu pci pcie rootfs-part boot-part squashfs
SUBTARGETS:=mesonsm1

KERNEL_PATCHVER:=5.15

define Target/Description
	Build firmware image for Amlogic S9 Gen 3 SoC devices.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += e2fsprogs kmod-sound-core kmod-usb-hid mkf2fs partx-utils


$(eval $(call BuildTarget))