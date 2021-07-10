# ASUS PRIME B360M-K i5 8600k OC0.7.2开发版

- 不是自己编译版 基本包为 独行秀才 的编译包。

- 有独显或独显+核显加速无需添加显卡ID，自动驱动。只有核显请看下一条。

- 此主板只用核显+DVI的配置已经测试成功，配置文件会放在[这里](https://gitee.com/k2y1982/OC/tree/master/%E6%A0%B8%E6%98%BE+DVI%E6%8E%A5%E5%8F%A3FB%E5%B8%A7%E7%BC%93%E5%86%B2)。

- 写了一个从应用程序创建dmg安装镜像，把dmg镜像写入u盘，dmg镜像转iso的脚本，使用中有问题的请反馈我。

|启动参数|说明|
|-----------------|-------|
|igfxfw=2|引导参数（和属性），以强制加载苹果GuC固件-不怎么用|
|igfxrpsc=1|引导参数（属性）以启用RPS控制修补程序（提高IGPU性能）-不怎么用|
|npci=0x3000|解决独立显卡PCIconfiguration begin卡主不动|
|-lilubetaall|在不受支持的 OS 版本启用 Lilu的所有插件-主要是在12上用|
|igfxonln=1|所有显示接口在线-只有核显专用|

- 随着驱动的升级，以上参数已不是必备的了，我现在只用独显时，只加了 ```alcid=5``` ，同样能正常使用。

- 同时开启核显和独显的时候，还是需要加上 ```npci=0x3000``` 。

- 只用核显的时候必须用，不然会进桌面黑屏 ```igfxonln=1 npci=0x3000``` 。

- 下载系统和系统写入u盘可以看看上面的[wiki](https://gitee.com/k2y1982/OC/wikis)，或直接用我写的小[脚本](https://gitee.com/k2y1982/OC/tree/master/%E8%84%9A%E6%9C%AC)。

- 如果你的黑果也死机频繁，可以试试把内存频率由自动改为手动设置，如：我的内存是2666，手动设置2600后暂没有再死机了。

## **支持Monterey 12.0beta 安装：**

- ~~增加了 ```-lilubetaall``` 参数，以支持 VirtualSMC的IO信息获取，ALC的音频模拟。~~ 更新驱动后已不再需要。

- Monterey B2 安装时需要将 ```SecureBootModel``` 设置为 ```disable```。

- 截至7月6日 monterey的蓝牙问题大部分解决，需要用到[BlueToolFixup.kext](https://gitee.com/k2y1982/OC/tree/master/%E9%A9%B1%E5%8A%A8)。

- 软件闪退只能等软件更新，并没有别的办法。

## **其它说明**

- ```SecureBootModel``` 默认设置为 ```disable```，Catalina,Big sur,Monterey,都可以正常安装，安装完后可以改回```default```。

- ```prev-lang:kbd``` 默认设置为 ```7A682D48 616E733A 323532``` (中文)

- 最新版的OC可以勾选 ```AllowToggleSip``` 来开关SIP。

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
|声卡|直接驱动，且使用id为11，完美适配本主板|
|网卡|正常|
|睡眠|正常|
|USB|正常|
|运行状态|内存频率由自动改为2600后已不再死机|

## **驱动说明**

|驱动|版本|说明|
|-----------------|----|------|
|Lilu.kext|1.5.5|核心扩展|
|AppleALC.kext|1.6.3|用于驱动 ALC 芯片声卡|
|WhateverGreen.kext|1.5.2|显卡补丁集|
|RealtekRTL8111.kext|2.4.2|用于驱动 RTL8111 有线以太网卡|
|VirtualSMC.kext|1.2.6|模拟系统 SMC 以及提供了一些传感器插件|
|SMCProcessor.kext|1.2.6|给CPU提供温度传感器支持|
|SMCSuperIO.kext|1.2.6|风扇信息读取|
|USBInjectAll.kext|0.7.7|用于注入所有 USB 端口|
|BlueToolFixup.kext|2.6.0|Monterey蓝牙修复|

## **引导及系统版本**
已经测试支持Catalina，Big Sur，Monterey beta

## **目前版本为：**

**2021-07-10编译OpenCore-0.7.2-07-10编译版**

- 对OSBundleLibraries/osbundlelibraries64进行了修复

**2021-07-08编译OpenCore-0.7.2-07-08编译版**

- 更新版本号至0.7.2
- 修正macOS 12上的AppleXcpmForceBoost补丁

**2021-07-06编译OpenCore-0.7.1-07-06正式版**

- 更新0.7.1正式版

**2021-07-04编译OpenCore-0.7.1-07-04编译版**

- 修复macOS 12上的ProvideCurrentCpuInfo MSR修补程序

**2021-07-02编译OpenCore-0.7.1-07-02编译版**

- 例行更新

**2021-06-30编译OpenCore-0.7.1-06-30编译版**

- 修正OpenCanopy当默认输入超出屏幕右侧时不能正确显示的问题

**2021-06-28编译OpenCore-0.7.1-06-28编译版**

- 添加 DEBUG TPM状态的TpmInfo工具

**2021-06-26编译OpenCore-0.7.1-06-26编译版**

- 添加Apple12和Windows11相关特性。

**2021-06-24编译OpenCore-0.7.1-06-24编译版**

- 修复在OpenCanopy中按change entry键和单个启动项时的DEBUG ASSERT

**2021-06-22编译OpenCore-0.7.1-06-22编译版**

- 修正了IA32上内置picker的错误超时
- 增加了对ESP分区上自定义内核的支持

**2021-06-20编译OpenCore-0.7.1-06-20编译版**

- 例行更新

**2021-06-18编译OpenCore-0.7.1-06-18编译版**

- 例行更新

**2021-06-16编译OpenCore-0.7.1-06-16编译版**

- 记录SetDefault.icns宽度与Selector.icns宽度的匹配
- 增加VSCode源代码级别的IDE调试配置示例来调试文档
- 增加其他次要的调试文档更新

**2021-06-14编译OpenCore-0.7.1-06-14编译版**

- 更新SMBIOS和其他系统的内置固件版本
- 修正macOS 12上的PowerTimeoutKernelPanic
- 修复OpenCanopy引导条目上的透明点击检测
- 已将PCI设备信息转储添加到SysReport
- 修正macOS 12上的SetApfsTrimTimeout
- 记录并添加现有要求的安全回退，设置默认宽度以匹配选择器宽度


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