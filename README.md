# ASUS PRIME B360M-K i5 8600k OC1.0.0 3.13 开发版

- ~~不是自己编译，基本包为 [独行秀才](https://gitee.com/shuiyunxc/OpenCore) 的编译包 和 [bugprogrammer/HackinPlugins](https://github.com/bugprogrammer/HackinPlugins/releases) 的编译包。有更新的时候同步更新。~~

- OC 1.0.0 3.13 开发版的包来自[dortania/build-repo](https://github.com/dortania/build-repo/releases)

- Sonoma安装GT1030驱动原文[https://blog.csdn.net/ilovefifa2020/article/details/129365522](https://blog.csdn.net/ilovefifa2020/article/details/129365522)

- Sonoma安装GT1030还需要[kernel debug kit](https://developer.apple.com/download/all/?q=kernel%20debug%20kit),请根据自己的系统版本下载。

- 有独显或独显+核显加速无需添加显卡ID，自动驱动。只有核显请看下一条。

- 此主板只用核显+DVI的配置已经测试成功，配置文件放在[>这里<](https://gitee.com/k2y1982/OC/tree/master/%E6%A0%B8%E6%98%BE+DVI%E6%8E%A5%E5%8F%A3FB%E5%B8%A7%E7%BC%93%E5%86%B2)。

- ~~写了一个从应用程序创建dmg安装镜像，把dmg镜像写入u盘，dmg镜像转iso的脚本，使用中有问题的请反馈我。~~

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

## **支持Sonoma 14.3.1 & 14.4 安装：**

- 不支持的METAL的显卡切勿安装 14.4

- 安装OpenCore-Legacy-Patcher前，需要先做以下操作：

|使用方法|说明|
|-----|-------------------|
|第1步|终端运行，支持任意源安装 sudo spctl --master-disable|
|第2步|进入恢复模式recovery,打开终端|
|第3步|执行 csrutil disable|
|第4步|执行 csrutil authenticated-root disable|
|第5步|将oc的csr-active-config 改为 EF0F0000|
|第6步|将oc的SecureBootModel 改为 Disabled|
|第7步|启动项加入参数 ```amfi_get_out_of_my_way=0x1```|
|第8步|启动项加入参数 ```ipc_control_port_options=0```|
|第9步|安装 OpenCore-Legacy-Patcher.app|

- Ventura，Sonoma也可以用[OpenCore-Legacy-Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher/releases)来安装GT730 GT1030显卡驱动。

- ```amfi_get_out_of_my_way=0x1``` 禁用amfi检测，GT730 GT1030 需要添加。

- ```ngfxcompat=1``` Sonoma安装GT1030需要添加。

- ```ngfxgl=1``` Sonoma安装GT1030需要添加。

- ```nvda_drv_vrl=1``` Sonoma安装GT1030需要添加。

- ```ipc_control_port_options=0``` 避免一些需要sip的软件闪退。 

- ```升级到Sonoma后，GT1030显卡不支持METAL，有需要的切勿升级。```

** **

## **支持Monterey 12.x 安装：**

- ~~增加了 ```-lilubetaall``` 参数，以支持 VirtualSMC的IO信息获取，ALC的音频模拟。~~ 更新驱动后已不再需要。

- Monterey B2 安装时需要将 ```SecureBootModel``` 设置为 ```disable```。

- 截至7月6日 monterey的蓝牙问题大部分解决，需要用到[BlueToolFixup.kext](https://gitee.com/k2y1982/OC/tree/master/%E9%A9%B1%E5%8A%A8)。

- ~~从B7开始删除了N卡驱动，目前只能用Geforce.Kepler.patcher-V7.dmg来重新安装N卡驱动（已放在驱动目录里了），使用方法如下：~~

- 推荐使用 OpenCore-Legacy-Patcher ，支持到Sonoma，使用方法跟 Geforce.Kepler.patcher-V7 一样：

|使用方法|说明|
|-----|-------------------|
|第1步|终端运行，支持任意源安装 sudo spctl --master-disable|
|第2步|进入恢复模式recovery,打开终端|
|第3步|执行 csrutil disable|
|第4步|执行 csrutil authenticated-root disable|
|第5步|将oc的csr-active-config 改为 EF0F0000|
|第6步|将oc的SecureBootModel 改为 Disabled|
|第7步|安装 Geforce.Kepler.patcher-V7.dmg|
|备注|以上为手动关闭SIP的方法|

** **

## **其它说明**

- ```SecureBootModel``` 默认设置为 ```disable```，Catalina,Big sur,Monterey,Ventura,Sonoma 都可以正常安装。

- ```prev-lang:kbd``` 默认设置为 ```7A682D48 616E733A 323532``` (中文)

** **

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
|显卡|Nvidia GT1030(non-metal)|
|声卡|ALC887|
|网卡|Realtek 8111|

## **功能**

|功能|完成度|
|--------|-----------------------------------------|
|CPU 变频|正常|
|显卡|核显硬件加速正常，独显驱动正常，non-metal|
|声卡|直接驱动，且使用id为11，完美适配本主板|
|网卡|正常|
|睡眠|正常|
|USB|正常|
|运行状态|内存频率由自动改为2600后已不再死机|

## **驱动说明**

|驱动|版本|说明||
|-----------------|----|------|-----|
|AppleALC.kext|1.9.0|用于驱动 ALC 芯片声卡|new~!|
|BlueToolFixup.kext|2.6.8|蓝牙修复||
|Lilu.kext|1.6.8|核心扩展|new~!|
|RealtekRTL8111.kext|2.4.2|用于驱动 RTL8111 有线以太网卡||
|USBInjectAll.kext|0.7.8|用于注入所有 USB 端口||
|VirtualSMC.kext|1.3.3|模拟系统 SMC 以及提供了一些传感器插件|new~!|
|WhateverGreen.kext|1.6.7|显卡补丁集|new~!|
** **

## **引导及系统版本**

- 已经测试支持Catalina,Big Sur,Monterey,Ventura,Sonoma

** **

## **目前版本为：**

**OC 1.0.0 3.13 官方开发版**

**OC 0.8.8 官方正式版**

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