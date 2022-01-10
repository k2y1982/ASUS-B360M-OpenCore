# ASUS PRIME B360M-K i5 8600k OC0.7.7开发版

- 不是自己编译，基本包为 独行秀才 的编译包 和 dortania/build-repo 的编译包。有更新的时候同步更新。

- 有独显或独显+核显加速无需添加显卡ID，自动驱动。只有核显请看下一条。

- 此主板只用核显+DVI的配置已经测试成功，配置文件会放在[这里](https://gitee.com/k2y1982/OC/tree/master/%E6%A0%B8%E6%98%BE+DVI%E6%8E%A5%E5%8F%A3FB%E5%B8%A7%E7%BC%93%E5%86%B2)。

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

- 下载系统和系统写入u盘可以看看上面的[wiki](https://gitee.com/k2y1982/OC/wikis)，或直接用我写的小[脚本](https://gitee.com/k2y1982/OC/tree/master/%E8%84%9A%E6%9C%AC)。

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
|AppleALC.kext|1.6.8|用于驱动 ALC 芯片声卡|new~!|
|BlueToolFixup.kext|2.6.2|Monterey蓝牙修复||
|Lilu.kext|1.5.9|核心扩展|new~!|
|RealtekRTL8111.kext|2.4.2|用于驱动 RTL8111 有线以太网卡||
|USBInjectAll.kext|0.7.7|用于注入所有 USB 端口||
|VirtualSMC.kext|1.2.9|模拟系统 SMC 以及提供了一些传感器插件|new~!|
|WhateverGreen.kext|1.5.6|显卡补丁集||
** **

## **引导及系统版本**

- 已经测试支持Catalina，Big Sur，Monterey

** **

## **目前版本为：**

**2022-01-05 OpenCore-Repo-0.7.7-01-04**

- 添加了音频GPIO和VREF处理，以在更多苹果硬件上支持UEFI声音
- 更新音频输出通道检测，在更多苹果硬件上支持UEFI声音

**2022-01-04编译OpenCore-0.7.7-01-04编译版**

- 修复了Nvidia HDA音频出现时AudioDxe启动暂停的问题
- 解决了AudioDxe在某些固件上禁用Windows中的声音的问题
- 在内置AppleEvent实现中添加了指针轮询周期的调整
- 在内置AppleeEvent实现中添加了设备指针列表的调整

**2021-12-22编译OpenCore-0.7.7-12-22编译版**

- 修正了 Intel Rocket Lake或更新的Cpuid1Data建议中的拼写错误
- 更新SMBIOS和其他内置固件版本
- 更新基础EDK II包到edk2-stable202111
- 解决AudioDxe中两个可能的QEMU崩溃
- 增加AudioDxe设置缓存(避免不必要的设置延迟)
- 添加DisconnectHda quirk，允许在苹果硬件(和其他)上UEFI声音
- 添加自动检测的Cirrus Logic GPIO使能UEFI声音在苹果硬件
- 在QEMU intelhda驱动程序中增加了bug的解决方案，允许在QEMU中UEFI sound 实现多通道(如低音+主扬声器;扬声器+耳机)UEFI声音配置AudioOutMask

**2021-12-14编译OpenCore-0.7.7-12-14编译版**

- 例行更新

**2021-12-12编译OpenCore-0.7.7-12-12编译版**

- 增加ProvideCurrentCpuInfo对Intel Alder Lake的支持
- 修正Cpuid1Data，应对Intel Rocket Lake和后续更新的CPU

**2021-12-10编译OpenCore-0.7.7-12-10编译版**

- 例行更新

**2021-12-08编译OpenCore-0.7.7-12-08编译版**

- 更新版本号为0.7.7
- 修复由入口点中的寄存器损坏导致的罕见崩溃