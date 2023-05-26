# SPDX-License-Identifier: GPL-2.0-only
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk


define Device/Default
  KERNEL_DEPENDS = $$(wildcard $(DTS_DIR)/$$(DEVICE_DTS).dts)
  KERNEL_LOADADDR := 0x11000000
  PROFILES = Default $$(DEVICE_NAME)
endef

include $(SUBTARGET).mk

define Image/Build
	$(call Image/Build/$(1),$(1))
endef

$(eval $(call BuildImage))