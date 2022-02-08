# OC 0.7.8 官方正式版

- 更新了ocvalidate，以警告使用secure SecureBootModel加载不安全的DmgLoading（在运行时已被禁止）
- 修复了AudioDxe最近更新后未禁用未使用频道的问题
- 允许gain在没有SystemAudioVolumeDB的情况下跟踪旧macOS上的操作系统音量
- 修复了验证密码时没有鼠标支持的崩溃问题
- 修复了启用ProvideCustomSlide时设置的AppleInternal CSR位
- 增加了对的支持。满足口味和口味。启动条目协议条目的contentDetails文件，包括OpenLinuxBoot
- 在OpenLinuxBoot中添加了LINUX_BOOT_ADD_RW标志，以支持例如奋进
- 在OpenLinuxBoot中添加了flags+=和flags-=参数，以在需要时简化驱动程序标志的设置
- 修复了当LINUX_BOOT_USE_LATEST标志清除时OpenLinuxBoot条目名称的歧义
- 更新了SMBIOS和其他系统的内置固件版本
- 修复了部分（重新）安装Linux发行版的OpenLinuxBoot中的崩溃
- 改进了错误PE图像文件解析的健壮性