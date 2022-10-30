#!/bin/bash

#update:2019-11-11
#author:alon2000

#LAN_MAC=`ifconfig eth0 | grep -w ether | awk '{print $2}'`
LAN_MAC=`cat /sys/class/net/eth0/address`
MAC_HEAD=`echo $LAN_MAC|cut -c1-15`
MAC_TAIL=`echo $LAN_MAC|cut -c16-17`
MAC_TAILn=$((16#${MAC_TAIL}-1))

WLAN_MAC="$(printf '%s%02x\n' $MAC_HEAD $[MAC_TAILn])"

if [[ -f "/lib/firmware/brcm/brcmfmac43455-sdio.phicomm,n1.txt" ]] ; then
  sed -i -e "s/^macaddr=b8:27:eb:74:f2:6c$/macaddr=$WLAN_MAC/" \
    "/lib/firmware/brcm/brcmfmac43455-sdio.phicomm,n1.txt"
fi

if [[ -f "/lib/firmware/brcm/brcmfmac43455-sdio.txt" ]] ; then
  sed -i -e "s/^macaddr=b8:27:eb:74:f2:6c$/macaddr=$WLAN_MAC/" \
    "/lib/firmware/brcm/brcmfmac43455-sdio.txt"
fi

echo "WiFi MAC address modified successfully! reboot..."
reboot
