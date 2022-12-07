# OC 0.8.7 官方正式版

- 启动非文本启动项时删除了不需要的透明屏幕
- 固定了ProvideCurrentCpuInfo中AMD CPU的TSC/FSB，
- 添加了Misc - Boot -Hibernate SkipsPicker，以在从macOS休眠中醒来时不显示选择器
- 将macrecover更改为将文件下载到com.apple.recovery。默认情况下启动，
- 在MacPro5,1等设备上运行不支持Mac efi的GPU时，支持Apple内置选择器（使用BootKicker.efi或PickerMode Apple）
- 已启用PickerMode Apple以成功启动所选条目
- 已启用BootKicker。efi成功启动选定的条目（通过重新启动）
- 将防欺骗UEFI 2.x检查添加到OpenVariableRuntimeDxe