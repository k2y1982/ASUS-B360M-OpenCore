# OC 0.8.0 官方正式版

- 增加了对早期日志保存的支持
- 在脚本中切换到Python 3(使用Python /path/to/script强制Python 2)
- 增加ForceAquantiaEthernet项，支持aququantia AQtion基于AQC-107s的10GbE网卡，感谢@Mieze和@Shikumo
- 更新SMBIOS和其他内置固件版本
- 添加了Misc->Serial部分以自定义串行端口属性
- XNU增加了CustomPciSerialDevice的quirk，可以正确识别定制的外部串行设备