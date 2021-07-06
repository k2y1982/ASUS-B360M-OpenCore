# OC 0.7.1 官方正式版

- 添加怪癖以同步修改后的表 OEM 标识符SyncTableIds
- 已添加 CPU 信息 （MSR） 倾销到SysReport
- 为SMBIOS和其他版本更新内置固件版本
- 固定在马科斯12上PowerTimeoutKernelPanic
- 固定透明度点击检测打开卡诺皮引导条目
- 已添加PCI设备信息倾销到SysReport
- 固定在马科斯12上SetApfsTrimTimeout
- 已记录的设置.icns宽度以匹配选择器.icns宽度的要求
- 在无法匹配上述内容时，向内置拾取器添加了明确的警告和安全回退
- 将VSCode源级别IDE调试配置示例添加到调试文档中
- 添加其他次要调试文档更新
- 在 IA32 上修复内置拾取器的不正确超时
- 在 ESP 分区上添加了自定义内核支持
- 固定的德布格在打开扫描中单启动条目按下更改进入键
- 添加推荐和口味Apple12Windows11
- 已添加工具以删除TPM状态TpmInfo
- 当默认进入屏幕右侧之外时，固定不正确的打开扫描初始显示
- macOS 12上的固定MSR修补程序ProvideCurrentCpuInfo