# OC 0.8.8 官方正式版

- 将基础EDK II包更新为edk2-stable202211
- 从macOS 13.1更新AppleKeyboardLayout.txt
- 更新了SMBIOS和其他系统的内置固件版本
- 更新了ocvalidate，如果FullNvramAccess不同，则允许重复工具
- 修复了内核->如果由于Arch而跳过了一个条目，则不会处理块条目
- 修复了启用kext阻止时由XML损坏导致的间歇性预链接失败
- 从OpenCore文件中删除了用于选择器隐藏的魔法Acidanthera序列
- 添加了.contentVisibility以隐藏和禁用启动项
- 为QemuBuild.com添加了Linux支持，用于Duet调试
- 内置新的安全PE/COFF加载器
- 添加了带有Apple Silicon支持的预构建mtoc通用二进制文件
- 修正了Apple Silicon上的OpenDuet版本
- 为引导设备选择添加了SD卡设备路径支持