# OC 0.7.9 官方正式版

- 添加了自动检测macOS安装程序卷名，以便在安装时使用。无法显示磁盘标签文件
- 添加--将nosnoop标志恢复到AudioDxe，使v0。7.7 Windows声音选择加入修复程序
- 增加了当SetApfsTrimTimeout设置为零时禁用修剪的新方法
- 修正了macOS 12上的SetApfsTrimTimeout（仅在设置为零时有效）
- 为macrecovery添加了构建qemu恢复映像的脚本
- 修复了在虚拟机监控程序上选择SecureBootModel的问题（应该是x86legacy）
- 为预链接和更新版本添加了kext阻止策略
- 添加了全局MSR 35h修复程序以提供当前CPUINFO，允许KVM中的-cpu主机
- 修复了启用AVX加速时可能出现的内存损坏
- 添加了日志模块，用于按模块进行正向和反向日志过滤
- 将OpenLinuxBoot驱动程序参数从partuuidpts:{PARTUUID}重命名为autoopts:{PARTUUID}
- 支持从独立/boot分区启动Linux，而不使用/loader/entries文件（用户必须指定完整的内核启动选项）
- 在驱动程序参数中处理XML实体
- 将基础EDK II包更新为edk2-stable202202