# ASUS PRIME B360M-K i5 8600k OC0.7.1开发版

- 不是自己编译版 基本包为 独行秀才 的编译包

- 无需添加显卡ID，自动驱动。

|启动参数|说明|
|-----------------|-------|
|igfxfw=2|引导参数（和属性），以强制加载苹果GuC固件|
|igfxrpsc=1|引导参数（属性）以启用RPS控制修补程序（提高IGPU性能）测试中|
|npci=0x3000|解决独立显卡PCIconfiguration begin卡主不动|
|-lilubetaall|在不受支持的 OS 版本启用 Lilu的所有插件|

- 据说igfxfw=2会导致核显频率过高死机，现在正在测试igfxrpsc=1。

- 下载系统和系统写入u盘可以看看上面的[wiki](https://gitee.com/k2y1982/OC/wikis)。

## **支持Monterey 12.0beta 安装：**

- 增加了 -lilubetaall 参数，以支持 VirtualSMC的IO信息获取，ALC的音频模拟。

- 截至今日 monterey的蓝牙问题还没有解决，勾选 XhciPortLimit 解决USB无法识别的问题。

- 微信闪退可以安装3.1.0beta10版本，别的软件闪退只能等软件更新，并没有别的办法。

## **为配合 big sur 安装特性已做如下修改：** 

- 最新的正式版和Big Sur beta版已支持中文，SecureBootModel 也可以设置为 Default

- 如果你还是beta10的镜像请将 NVRAM - 7C436110-AB2A-4BBB-A880-FE41995C9F82 - prev-lang:kbd 已设置为英语 656E2D55533A30

- 如果你之前已经安装过macOS，在更改efi后，请在oc的辅助项里 使用一次 reset_NVRAM 以清理 NVRAM。

- 不然会遇到-v代码跑完-进度条跑完后只有灰屏和鼠标(big sur beta10 全新安装时)。

## **如果你是安装 Catalina 可以将：** 

- 1.Misc - Security - SecureBootModel 已设置为 Default (默认已改回Default）

- 这样就不会遇到挂在efi分区时occ卡死的问题。

- 2.NVRAM - 7C436110-AB2A-4BBB-A880-FE41995C9F82 - prev-lang:kbd 已设置为中文(默认已改回中文) 7A682D48 616E733A 323532

## **配置**

|设备|型号|
|--|-------------------|
|CPU|I5-8600K|
|主板|ASUS PRIME B360M-K|
|显卡|Intel UHD 630|
|显卡|Nvidia GT730|
|声卡|ALC887|
|网卡|Realtek 8111|

## **功能**

|功能|完成度|
|--------|-----------------------------------------|
|CPU 变频|正常|
|显卡|核显硬件加速正常，独显驱动正常|
|声卡|直接驱动，且使用 id 为 1，完美适配本主板|
|网卡|正常|
|睡眠|尚不完美,持续调试中|
|USB|正常|

## **驱动说明**

|驱动|版本|说明|
|-----------------|----|------|
|Lilu.kext|1.5.4|核心扩展|
|AppleALC.kext|1.6.2|用于驱动 ALC 芯片声卡|
|WhateverGreen.kext|1.5.1|显卡补丁集|
|RealtekRTL8111.kext|2.4.2|用于驱动 RTL8111 有线以太网卡|
|VirtualSMC.kext|1.2.5|模拟系统 SMC 以及提供了一些传感器插件|
|SMCProcessor.kext|1.2.5|给CPU提供温度传感器支持|
|SMCSuperIO.kext|1.2.5|风扇信息读取|
|CPUFriend.kext|1.2.4|用于提取和应用 CPU 电源管理数据|
|HibernationFixup.kext|1.4.1|用于修复部分休眠问题|
|RTCMemoryFixup.kext|1.0.8|RTC 修复|
|USBInjectAll.kext|0.7.7|用于注入所有 USB 端口|

## **引导及系统版本**
已经测试支持Catalina，Big Sur，Monterey beta

## **目前版本为：**

**2021-06-10编译OpenCore-0.7.1-06-10编译版**

- 更新版本号至0.7.1
- 添加SyncTableIds quirk以同步修改的OEM表单标识符

**2021-06-08编译OpenCore-0.7.0-06-08正式版**

- 正式版

**2021-06-05编译OpenCore-0.7.0-06-05编译版**

- 例行更新。

**2021-06-03编译OpenCore-0.7.0-06-03编译版**

- 添加csr-data Apple NVRAM var到文档
- 修正文件对齐导致CLANGPDB图像协同设计问题
- 用AdviseFeatures替换AdviseWindows以支持APFS

**2021-06-01编译OpenCore-0.7.0-06-01编译版**

- 更新OC默认SIP关闭值
- 记录影响macOS更新的SIP值
- 添加csr-data Apple NVRAM var到文档

**2021-05-30编译OpenCore-0.7.0-05-30编译版**

- 增加可选的切换SIP系统启动菜单选项
- 添加了CsrUtil.efi工具，类似于Apple CsrUtil
- 删除了对.lbl/.l2x预绘制条目标签的支持
- 修复了OpenCanopy中控制台模式工具和条目之前未清除的先前文本
- 修复了GopPassThrough和UgaPassThrough的调试生成崩溃
- 为内存测试实用程序添加了自定义
- 在sample.plist文件中更新了推荐的memtest86配置
- 增加自定义的引导程序风格
- 在OC构建中应用自定义
- 添加了CPU拓扑修复，以提供 ProvideCurrentCpuInfo quirk

**2021-05-28编译OpenCore-0.7.0-05-28编译版**

- 例行更新

**2021-05-26编译OpenCore-0.7.0-05-26编译版**

- 修复由于架构不匹配而跳过修补程序时未处理的其他内核修补程序

**2021-05-24编译OpenCore-0.7.0-05-24编译版**

- 添加了Hyper-V设备路径扩展以允许设置默认启动卷
- 添加了GopPassThrough的Apple变体，以仅处理AppleFramebufferInfo句柄

**2021-05-22编译OpenCore-0.7.0-05-22编译版**

- 例行更新

**2021-05-20编译OpenCore-0.7.0-05-20编译版**

- 已删除对.icns和.icns支持
- 添加个性化内容，允许自定义启动图标兼容的图标包
- 增加了macOS引导条目的自动个性化检测
- 添加了ProvideCurrentCpuInfo quirk，为Hyper-V虚拟机提供正确的TSC/FSB

**2021-05-18编译OpenCore-0.7.0-05-18编译版**

- 例行更新

**2021-05-16编译OpenCore-0.7.0-05-16编译版**

- 修复在LoadeImage和其他地方处理多节点设备路径的问题
- 已更改OpenCanopy映像目录以支持目录前缀
- 已将OpenCanopy首选图像集更改为acidathera\GoldenGate

**2021-05-12编译OpenCore-0.7.0-05-12编译版**

- 例行更新

**2021-05-10编译OpenCore-0.7.0-05-10编译版**

- 改进了某些情况下的direct GOP渲染器性能
- 增加了对direct GOP渲染器中显示旋转的支持

**更新日志 2021-05-08编译OpenCore-0.7.0-05-08编译版**

- 例行更新。
- 修复固件写保护BootOptionSupport时NVRAM复位。

**2021-05-06编译OpenCore-0.7.0-05-06编译版**

- 更新版本号至0.7.0