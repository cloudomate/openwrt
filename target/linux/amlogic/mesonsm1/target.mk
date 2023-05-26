# SPDX-License-Identifier: GPL-2.0-only
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

ARCH:=aarch64
SUBTARGET:=mesonsm1
BOARDNAME:=MESONSM1
CPU_TYPE:=cortex-a55

KERNELNAME:=Image dtbs

define Target/Description
	Build firmware image for s905x3 Family Boards.
	This firmware features a 64 bit kernel.
endef