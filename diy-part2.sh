#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 确保当前目录是 openwrt 源码根目录（工作流已保证）
echo "Current directory: $(pwd)"  # 调试用，可删除

# 创建 files 目录层级
mkdir -p files/usr/sbin

cp "$GITHUB_WORKSPACE/pppd" files/usr/sbin/pppd
chmod +x files/usr/sbin/pppd
cp "$GITHUB_WORKSPACE/pppd" files/lib/netifd/proto/ppp.sh
chmod +x files/lib/netifd/proto/ppp.sh
# 可选：检查文件是否复制成功
ls -l files/usr/sbin/pppd

