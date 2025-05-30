#!/bin/sh /etc/rc.common

START=11

[ -n "${IPKG_INSTROOT}" ] && return 0

grep(){
/bin/busybox 'grep' $@
}

for i in $( ls /sys/class/net/*/device/uevent | awk -F'/' '{print $5}' | tr '\n' ' ' ) ;
do

	pci_slot_name=$( grep $i /etc/config/pci-eth-mapping | awk '{print $3}' | tr -d '"' )
	if [ "$pci_slot_name" != '' ]; then
	
		ip link set "$i" down 
		ip link set "$i" name "$i"_tmp
		
	fi
done

for i in $( ls /sys/class/net/*/device/uevent | awk -F'/' '{print $5}' | tr '\n' ' ' ) ;
do

pci_slot_name=$( basename $(readlink -f "/sys/class/net/$i/device" 2>/dev/null))
	target_if_name=$( grep -i $pci_slot_name /etc/config/pci-eth-mapping | awk '{print $2}' )
	if [ "$target_if_name" != '' ]; then
	
		ip link set "$i" down 
		ip link set "$i" name "$target_if_name"
		
	fi
done
