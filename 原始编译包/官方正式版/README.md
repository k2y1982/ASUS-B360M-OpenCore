# OC 0.7.6 官方正式版

- 修复了使用GCC编译时的堆栈金丝雀支持
- 增加了自动比例因子检测
- 显式将ResizeApplePubars限制为0和-1
- 修复了OpenCanopy长标签在图形背景上淡出的问题
- 修复了PROVIDECOLEGOP未禁用仅限blit模式的问题（例如，在Z690上）
- 修复了Alder Lake SMBIOS CPU型号信息
- 为Intel Alder Lake添加了XCPM CPU电源管理ACPI表
- 更新了绘图顺序，以避免OpenCorporation中的图形撕裂
- 修复了ScanPolicy中使用逻辑单元处理PCI设备路径的问题
- 添加了重新连接图形用于启用可选UEFI图形驱动程序的连接选项
- 添加了BiosVideo.efi驱动程序，用于重新连接图形连接
- 更改了FadtEnableReset，以避免不可靠的键盘控制器重置
- 添加了EnableVmx怪癖，允许在某些Mac上的其他操作系统中进行虚拟化
- 升级了ProtectUefiServices，以防止在启用安全引导的情况下进行链加载时GRUB垫片覆盖服务指针
- 已删除不推荐的SSDT-PNLFCFL
- 修复了零大小内存属性表的处理