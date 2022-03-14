# ASUS PRIME B360M-K i5 8600k OC0.8.0 开发版

- 不是自己编译，基本包为 [独行秀才](https://gitee.com/shuiyunxc/OpenCore) 的编译包 和 [bugprogrammer/HackinPlugins](https://github.com/bugprogrammer/HackinPlugins/releases) 的编译包。有更新的时候同步更新。

- 有独显或独显+核显加速无需添加显卡ID，自动驱动。只有核显请看下一条。

- 此主板只用核显+DVI的配置已经测试成功，配置文件放在[>这里<](https://gitee.com/k2y1982/OC/tree/master/%E6%A0%B8%E6%98%BE+DVI%E6%8E%A5%E5%8F%A3FB%E5%B8%A7%E7%BC%93%E5%86%B2)。

- 写了一个从应用程序创建dmg安装镜像，把dmg镜像写入u盘，dmg镜像转iso的脚本，使用中有问题的请反馈我。

** **

|启动参数|说明|
|-----------------|-------|
|igfxfw=2|引导参数（和属性），以强制加载苹果GuC固件-不怎么用|
|igfxrpsc=1|引导参数（属性）以启用RPS控制修补程序（提高IGPU性能）-不怎么用|
|npci=0x3000|解决独立显卡PCIconfiguration begin卡主不动|
|-lilubetaall|在不受支持的 OS 版本启用 Lilu的所有插件-主要是在12上用|
|igfxonln=1|所有显示接口在线-只有核显专用|

** **

- 随着驱动的升级，以上参数已不是必备的了，我现在只用独显时，只加了 ```alcid=11``` ，同样能正常使用。

- 同时开启核显和独显的时候，还是需要加上 ```npci=0x3000``` 。

- 只用核显的时候必须用，不然会进桌面黑屏 ```igfxonln=1 npci=0x3000``` 。

- 下载系统和系统写入u盘可以看看上面的[wiki](https://gitee.com/k2y1982/OC/wikis)，或直接用我写的[小脚本](https://gitee.com/k2y1982/OC/tree/master/%E8%84%9A%E6%9C%AC)。

- 如果你的黑果也死机频繁，可以试试把内存频率由自动改为手动设置，如：我的内存是2666，手动设置2600后暂没有再死机了。

- 各版本安装前请将 oc的SecureBootModel 改为 Disabled，如果安装后无法看到安装盘 将 oc的 MinDate MinVersion 的值改为 -1 。

** **

## **支持Monterey 12.0beta 安装：**

- ~~增加了 ```-lilubetaall``` 参数，以支持 VirtualSMC的IO信息获取，ALC的音频模拟。~~ 更新驱动后已不再需要。

- Monterey B2 安装时需要将 ```SecureBootModel``` 设置为 ```disable```。

- 截至7月6日 monterey的蓝牙问题大部分解决，需要用到[BlueToolFixup.kext](https://gitee.com/k2y1982/OC/tree/master/%E9%A9%B1%E5%8A%A8)。

- 软件闪退只能等软件更新，并没有别的办法。

- 从B7开始删除了N卡驱动，目前只能用Geforce.Kepler.patcher-V2.dmg来重新安装N卡驱动（已放在驱动目录里了），使用方法如下：

|使用方法|说明|
|-----|-------------------|
|第1步|进入恢复模式recovery,打开终端|
|第2步|执行 csrutil disable|
|第3步|执行 csrutil authenticated-root disable|
|第4步|将oc的csr-active-config 改为 EF0F0000|
|第5步|将oc的SecureBootModel 改为 Disabled|
|第6步|安装 Geforce.Kepler.patcher-V2.dmg|
|备注|以上为手动关闭SIP的方法|
|备注|其实oc辅助项里AllowToggleSip可以一键关闭SIP|
|备注|只要关闭了SIP和SecureBootModel改Disabled就可以安装了|

** **

## **其它说明**

- ```SecureBootModel``` 默认设置为 ```disable```，Catalina,Big sur,Monterey,都可以正常安装。

- ```prev-lang:kbd``` 默认设置为 ```7A682D48 616E733A 323532``` (中文)

- 新版的OC可以勾选 ```AllowToggleSip``` 来开关SIP。


## **安装完成后的设置**

- 如果你的bios可以关闭cfg ```AppleCpuPmCfgLock ppleXcpmCfgLock gnoreInvalidFlexRatio``` 可以不用勾上。

- ```SecureBootModel``` 可以设置为 ```Default```,如果你定制了USB ```XhciPortLimit``` 可以不用勾上。

- 如果你是固态的SATA硬盘 可以 勾上 ```ThirdPartyDrives``` 以开启硬盘的TRIM。

- ```ScanPolicy``` 可以根据你自己设备进行设置，```boot-args``` 里的 ```-v``` 删掉就不再跑码。

** **

## **BIOS设置**

|打开|关闭|
|---|---|
|VT-x|Fast Boot|
|Above 4G decoding|Secure Boot|
|Hyper-Threading|Serial/COM Port|
|Execute Disable Bit|Parallel Port|
|EHCI/XHCI Hand-off|VT-d (如果将DisableIoMapper设置为YES，则可以启用)|
|OS type: Windows 8.1/10 UEFI Mode|CSM|
|DVMT Pre-Allocated(iGPU Memory): 64MB|Thunderbolt(对于初始安装，因为Thunderbolt如果设置不正确可能会导致问题)|
|SATA Mode: AHCI|Intel SGX|
|备注|Intel Platform Trust|
|资料来自OpenCore Install Guide|CFG Lock (MSR 0xE2写保护)(必须关闭此选项，如果找不到该选项，请启用 AppleXcpmCfgLock)|
|BIOS里能找到几个就开关几个|如果你的bios无法关闭 CFG-Lock ，请打开 Kernel -> Quirks.|


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

|驱动|版本|说明||
|-----------------|----|------|-----|
|AppleALC.kext|1.7.1|用于驱动 ALC 芯片声卡|new~!|
|BlueToolFixup.kext|2.6.2|Monterey蓝牙修复||
|Lilu.kext|1.6.1|核心扩展||
|RealtekRTL8111.kext|2.4.2|用于驱动 RTL8111 有线以太网卡||
|USBInjectAll.kext|0.7.8|用于注入所有 USB 端口||
|VirtualSMC.kext|1.3.0|模拟系统 SMC 以及提供了一些传感器插件|new~!|
|WhateverGreen.kext|1.5.9|显卡补丁集|new~!|
** **

## **引导及系统版本**

- 已经测试支持Catalina，Big Sur，Monterey

** **

## **目前版本为：**

**2022-03-13编译OpenCore-0.8.0-03-13编译版**

- 更新版本号为0.8.0
- 支持早期日志的保存

**2022-03-3编译OpenCore-0.7.9-03-03编译版**

- 修复了启用AVX加速时可能出现的内存报错
- 添加了日志模块，用于按模块进行正向和反向日志过滤
- 将OpenLinuxBoot驱动程序参数从partuuidpts:{PARTUUID}重命名为autoopts:{PARTUUID}
- 支持从独立/boot分区启动Linux，而不使用/loader/entries文件（用户必须指定完整的内核启动选项）
- 在驱动程序参数中处理XML实体

**2022-02-13编译OpenCore-0.7.9-02-13编译版**

- 更新版本号为0.7.9
- 添加自动检测macOS安装程序卷名，以便在安装时使用 .disk_label文件无法正常显示。
- 添加--restore-nosnoop 标志恢复到AudioDxe，修复v0.7.7 Windows声音选择
- 增加一个新方法，当SetApfsTrimTimeout设置为0时禁用修剪 修正了macOS 12上的SetApfsTrimTimeout（仅在设置为0时有效）
- 为macrecovery添加了构建qemu恢复映像的脚本
- 修复了在虚拟机监控程序上选择SecureBootModel的问题（应该是x86legacy）
- 为预链接和更新版本添加了kext阻止策略 添加了全局MSR 35h修复程序以提供当前CPUINFO，允许KVM中的-cpu主机

**2022-02-08编译OpenCore-0.7.8-02-08正式版**

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
- 改进了错误PE图像文件解析的正确性