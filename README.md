# config-pci-eth-mapping
map pci addrs to if names for openwrt.

通过pci路径映射interface名称。



## Usage
### Configuration
```
pci-eth-mapping
	#option eth0 "0000:00:19.0"
	#option eth1 "0000:05:00.0"
```

$3 for specific device via pci path, $2 for expected interface name.

you can get pci path of device via /sys/class/net/<if name>/device/uevent.

通过列$3来通过pci路径指定设备，您可以在/sys/class/net/<if name>/device/uevent获取设备对应的pci路径，列$2来指定期望的接口名称。

### Init
add "pci-eth-mapping" to "/etc/config".

将"pci-eth-mapping"添加到"/etc/config"中。

add content in "rc-pci-eth-mapping-config.sh" to "/etc/init.d/pci-eth-mapping-config"


将"rc-pci-eth-mapping-config.sh"的内容添加到"/etc/init.d/pci-eth-mapping-config"中。

then

```
chmod +x /etc/init.d/pci-eth-mapping-config
ln -s /etc/init.d/pci-eth-mapping-config /etc/rc.d/S11pci-eth-mapping-config
```

enjoy~
