# ASUS PRIME B360M-K i5 8600k OC0.8.8 开发版

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

- 从B7开始删除了N卡驱动，目前只能用Geforce.Kepler.patcher-V5.dmg来重新安装N卡驱动（已放在驱动目录里了），使用方法如下：

|使用方法|说明|
|-----|-------------------|
|第1步|终端运行，支持任意源安装 sudo spctl --master-disable|
|第2步|进入恢复模式recovery,打开终端|
|第3步|执行 csrutil disable|
|第4步|执行 csrutil authenticated-root disable|
|第5步|将oc的csr-active-config 改为 EF0F0000|
|第6步|将oc的SecureBootModel 改为 Disabled|
|第7步|安装 Geforce.Kepler.patcher-V5.dmg|
|备注|以上为手动关闭SIP的方法|

** **

## **其它说明**

- ```SecureBootModel``` 默认设置为 ```disable```，Catalina,Big sur,Monterey,Ventura 都可以正常安装。

- ```prev-lang:kbd``` 默认设置为 ```7A682D48 616E733A 323532``` (中文)

- 新版的OC可以勾选 ```AllowToggleSip``` 来开关SIP。

- Ventura也可以用[OpenCore-Legacy-Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher/releases)来安装gt730显卡驱动，但不完美，很多app都会闪退，还是换显卡吧。
- 启动参数还需要加入 ```amfi_get_out_of_my_way=1```


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
|AppleALC.kext|1.7.8|用于驱动 ALC 芯片声卡||
|BlueToolFixup.kext|2.6.4|Monterey蓝牙修复||
|Lilu.kext|1.6.3|核心扩展||
|RealtekRTL8111.kext|2.4.2|用于驱动 RTL8111 有线以太网卡||
|USBInjectAll.kext|0.7.8|用于注入所有 USB 端口||
|VirtualSMC.kext|1.3.1|模拟系统 SMC 以及提供了一些传感器插件||
|WhateverGreen.kext|1.6.3|显卡补丁集||
** **

## **引导及系统版本**

- 已经测试支持Catalina，Big Sur，Monterey，Ventura

** **

## **目前版本为：**

**2022-12-07编译OpenCore-0.8.7-12-07正式版**

- 启动非文本启动项时删除了不需要的透明屏幕
- 固定了ProvideCurrentCpuInfo中AMD CPU的TSC/FSB，
- 添加了Misc - Boot -Hibernate SkipsPicker，以在从macOS休眠中醒来时不显示选择器
- 将macrecover更改为将文件下载到com.apple.recovery。默认情况下启动，
- 在MacPro5,1等设备上运行不支持Mac efi的GPU时，支持Apple内置选择器（使用BootKicker.efi或PickerMode Apple）
- 已启用PickerMode Apple以成功启动所选条目
- 已启用BootKicker。efi成功启动选定的条目（通过重新启动）
- 将防欺骗UEFI 2.x检查添加到OpenVariableRuntimeDxe