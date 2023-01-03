## **驱动说明**

|驱动|版本|说明||
|-----------------|----|------|-----|
|AppleALC.kext|1.7.9|用于驱动 ALC 芯片声卡|new~!|
|CPUFriend.kext|1.2.7|修复CPU睿频-非必要||
|HibernationFixup.kext|1.4.8|修复睡眠唤醒-非必要||
|Lilu.kext|1.6.4|核心扩展|new~!|
|RTCMemoryFixup.kext|1.0.8|修复RTC-非必要||
|VirtualSMC.kext|1.3.1|模拟系统 SMC 以及提供了一些传感器插件||
|WhateverGreen.kext|1.6.4|显卡补丁集|new~!|
|BlueToolFixup.kext|2.6.4|Monterey蓝牙修复||
|RealtekRTL8111.kext|2.4.2|用于驱动 RTL8111 有线以太网卡||
|USBInjectAll.kext|0.7.8|用于注入所有 USB 端口||

Kexts-官方驱动地址
=====

| Ethernet | MinKernel (Min macOS) | MaxKernel (Max macOS) | Note |
|----------|-----------------------|-----------------------|------|
| [AppleRTL8169Ethernet](https://www.realtek.com/en/directly-download) | — | — | — |
| [AtherosE2200Ethernet.kext](https://github.com/Mieze/AtherosE2200Ethernet) | — | — | — |
| [AtherosL1cEthernet.kext](https://github.com/al3xtjames/AtherosL1cEthernet) | — | — | — |
| [IntelMausi.kext](https://github.com/acidanthera/IntelMausi) | 13.0.0 (10.9) | — | — |
| [IntelSnowMausi.kext](https://github.com/acidanthera/IntelMausi) | 10.0.0 (10.6) | 12.0.0 (10.8) | Not tested |
| [IntelMausiEthernet.kext](https://github.com/Mieze/IntelMausiEthernet) | — | — | — |
| [NullEthernetInjector.kext](https://github.com/RehabMan/OS-X-Null-Ethernet) | — | — | — |
| [RealtekR1000SL.kext](https://github.com/SergeySlice/RealtekLANv3) | — | — | — |
| [RealtekRTL8100.kext](https://github.com/Mieze/RealtekRTL8100) | — | — | — |
| [RealtekRTL8111.kext](https://github.com/Mieze/RTL8111_driver_for_OS_X) | — | — | — |

| Wi-Fi and bluetooth | MinKernel (Min macOS) | MaxKernel (Max macOS) | Note |
|---------------------|-----------------------|-----------------------|------|
| [AirPortAtheros40.kext](https://i.applelife.ru/2018/12/442854_AirPortAtheros40.kext.zip) | 18.0.0 (10.14) | — | From 10.13 |
| [AirportBrcmFixup.kext](https://github.com/acidanthera/AirportBrcmFixup) | 12.0.0 (10.8) | — | — |
| [ATH9KFixup.kext](https://github.com/chunnann/ATH9KFixup) | — | — | — |
| [BrcmPatchRAM.kext](https://github.com/acidanthera/BrcmPatchRAM) | 14.0.0 (10.10) | — | — |
| [IntelBluetoothFirmware](https://github.com/zxystd/IntelBluetoothFirmware) | — | — | — |
| [MT7610](https://d86o2zu8ugzlg.cloudfront.net/mediatek-craft/drivers/MT7612_7610U_D5.0.1.25_SDK1.0.2.18_UI5.0.0.27_20151209.zip) | — | — | — |
| [RT5370](https://d86o2zu8ugzlg.cloudfront.net/mediatek-craft/drivers/RTUSB_D2870-4.2.9.2_UI-4.0.9.6_2013_11_29.zip) | — | — | — |
| [RTL8192CU](https://drive.google.com/file/d/1ZtdMqlvKBbHULJhl1u9omuLOy6j0vx48/view?usp=sharing) | — | — | — |

| Keyboard, trackpad and mouse | MinKernel (Min macOS) | MaxKernel (Max macOS) | Note |
|------------------------------|-----------------------|-----------------------|------|
| [BrightnessKeys.kext](https://github.com/acidanthera/BrightnessKeys) | — | — | — |
| [GK701HIDDevice.kext](https://github.com/osy86/GK701HIDDevice) | — | — | — |
| [NoTouchID.kext](https://github.com/al3xtjames/NoTouchID) | 17.0.0 (10.13) | — | — |
| [SerialMouse.kext](https://github.com/Goldfish64/SerialMouse) | — | — | — |
| [VoodooI2C.kext](https://github.com/VoodooI2C/VoodooI2C) | 16.0.0 (10.12) | — | — |
| [VoodooPS2Controller.kext](https://github.com/acidanthera/VoodooPS2) | 15.0.0 (10.11) | — | — |
| [VoodooPS2Keyboard.kext](https://github.com/acidanthera/VoodooPS2) | 15.0.0 (10.11) | — | — |
| [VoodooPS2Mouse.kext](https://github.com/acidanthera/VoodooPS2) | 15.0.0 (10.11) | — | — |
| [VoodooPS2Trackpad.kext](https://github.com/acidanthera/VoodooPS2) | 15.0.0 (10.11) | — | — |
| [VoodooInput.kext](https://github.com/acidanthera/VoodooInput) | 15.0.0 (10.11) | — | — |
| [VoodooSMBus.kext](https://github.com/leo-labs/VoodooSMBus) | 18.0.0 (10.14) | — | — |
| [VoodooRMI.kext](https://github.com/VoodooSMBus/VoodooRMI) | 15.0.0 (10.11) | — | — |
| [AlpsT4USB.kext](https://github.com/blankmac/AlpsT4USB) | — | — | — |

| Video and audio | MinKernel (Min macOS) | MaxKernel (Max macOS) | Note |
|-----------------|-----------------------|-----------------------|------|
| [AppleALC.kext](https://github.com/acidanthera/AppleALC) | 8.0.0 (10.4) | — | — |
| [AppleALCU.kext](https://github.com/acidanthera/AppleALC) | 10.0.0 (10.6) | — | — |
| [EMUUSBAudio.kext](https://github.com/Wouter1/EMU-driver) | — | — | — |
| [kXAudioDriver.kext](https://github.com/kxproject/kx-audio-driver) | — | — | — |
| [Nvidia CUDA drivers](https://www.nvidia.com/object/mac-driver-archive.html) | 10.0.0 (10.6) | 17.9.9 (10.13) | — |
| [Nvidia Web-drivers](https://gfe.nvidia.com/mac-update) | 12.0.0 (10.8) | 17.9.9 (10.13) | — |
| [SNBGraphicsMojaveInstaller](https://github.com/Andrej-Antipov/SNBGraphicsMojaveInstaller) | 18.0.0 (10.14) | — | From 10.13 |
| [VoodooHDA.kext](https://sourceforge.net/projects/voodoohda/) | — | — | — |
| [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen) | 10.0.0 (10.6) | — | — |
| [Polaris22Fixup.kext](https://github.com/osy86/Polaris22Fixup) | 18.0.0 (10.14) | — | — |

| CPU and SMC | MinKernel (Min macOS) | MaxKernel (Max macOS) | Note |
|-------------|-----------------------|-----------------------|------|
| [AAAMouSSE.kext](https://forums.macrumors.com/threads/mp3-1-others-sse-4-2-emulation-to-enable-amd-metal-driver.2206682/) | 16.0.0 (10.12) | — | — |
| [AppleMCEReporterDisabler.kext](https://github.com/acidanthera/bugtracker/issues/424#issuecomment-535624313) | — | — | — |
| [AsusSMC.kext](https://github.com/hieplpvip/AsusSMC) | — | — | — |
| [CPUFriend.kext](https://github.com/acidanthera/CPUFriend) | 15.0.0 (10.11) | — | — |
| [HWPEnabler.kext](https://github.com/headkaze/HWPEnable) | — | — | — |
| [OpcodeEmulator.kext](https://www.insanelymac.com/forum/topic/329704-opcode-emulator-opemu-plug-in-project/) | — | — | — |
| [telemetrap.kext](https://forums.macrumors.com/posts/28447707) | 18.0.0 (10.14) | — | — |
| [TSCAdjustReset.kext](https://github.com/interferenc/TSCAdjustReset) | — | — | — |
| [VoodooTSCSync.kext](https://github.com/RehabMan/VoodooTSCSync) | — | — | — |
| [CpuTscSync.kext](https://github.com/acidanthera/CpuTscSync) | 12.0.0 (10.8) | — | — |
| [FakeSMC-32.kext](https://github.com/khronokernel/Legacy-Kexts/blob/master/32Bit-only/Zip/FakeSMC-32.kext.zip?raw=true) | 8.0.0 (10.4) | 11.9.9 (10.7) | For VMs with EFI64 |
| [VirtualSMC.kext](https://github.com/acidanthera/VirtualSMC) | 8.0.0 (10.4) | — | — |
| [SMCLightSensor.kext](https://github.com/acidanthera/VirtualSMC) | 10.0.0 (10.6) | — | Not tested 10.6 and 10.7 |
| [SMCSuperIO.kext](https://github.com/acidanthera/VirtualSMC) | 10.0.0 (10.6) | — | Not tested 10.6 and 10.7 |
| [SMCBatteryManager.kext](https://github.com/acidanthera/VirtualSMC) | 8.0.0 (10.4) | — | — |
| [SMCProcessor.kext](https://github.com/acidanthera/VirtualSMC) | 11.0.0 (10.7) | — | Not tested 10.7 |
| [SMCDellSensor.kext](https://github.com/acidanthera/VirtualSMC) | 11.0.0 (10.7) | — | Not tested 10.7 |

| USB and other ports | MinKernel (Min macOS) | MaxKernel (Max macOS) | Note |
|---------------------|-----------------------|-----------------------|------|
| [IOElectrify.kext](https://github.com/the-darkvoid/macOS-IOElectrify) | — | — | — |
| [Legacy_InternalHub-EHCx.kext](https://applelife.ru/posts/537459) | 15.0.0 (10.11) | — | — |
| [Legacy_USB3.kext](https://applelife.ru/posts/537459) | 15.0.0 (10.11) | — | — |
| [NVMeFix.kext](https://github.com/acidanthera/NVMeFix) | 18.0.0 (10.14) | — | — |
| [USBWakeFixup.kext](https://github.com/osy86/USBWakeFixup) | — | — | — |
| [SASMegaRAID.kext](https://github.com/dukzcry/osx-goodies) | — | — | — |
| [Sinetek-rtsx.kext](https://www.insanelymac.com/forum/topic/321080-sineteks-driver-for-realtek-rtsx-sdhc-card-readers/?do=findComment&comment=2376387) | — | — | — |
| [VoodooSDHC.kext](https://github.com/lvs1974/VoodooSDHCMod) | — | — | — |
| [RealtekCardReader.kext](https://github.com/0xFireWolf/RealtekCardReader) | — | — | — |

| Other kexts | MinKernel (Min macOS) | MaxKernel (Max macOS) | Note |
|-------------|-----------------------|-----------------------|------|
| [AppleIntelInfo.kext](https://github.com/headkaze/AppleIntelInfo) | — | — | — |
| [DebugEnhancer.kext](https://github.com/acidanthera/DebugEnhancer) | 12.0.0 (10.8) | — | — |
| [HibernationFixup.kext](https://github.com/acidanthera/HibernationFixup) | 14.0.0 (10.10) | — | — |
| [Lilu.kext](https://github.com/acidanthera/Lilu) | 8.0.0 (10.4) | — | — |
| [RestrictEvents.kext](https://github.com/acidanthera/RestrictEvents) | 12.0.0 (10.8) | — | — |
| [RTCMemoryFixup.kext](https://github.com/lvs1974/RTCMemoryFixup) | 12.0.0 (10.8) | — | — |
| [WebCamera.kext](https://www.applelife.ru/threads/asus-x550vc-i-asus-x550cc.41752/page-130#post-593586) | — | — | — |
| [TOSMotionSensor.kext](https://github.com/jslegendre/TOSMotionSensor) | — | — | — |
| [FeatureUnlock.kext](https://github.com/acidanthera/FeatureUnlock) | — | — | — |
| [MacHyperVSupport.kext](https://github.com/acidanthera/MacHyperVSupport) | 10.0.0 (10.6) | — | — |

More complete list with legacy kexts is hosted [here](https://docs.google.com/spreadsheets/d/15S-ocrkm_VTUJpKxNII-YUyQFd5VYdjbe0DHlZVCQyM). Full Lilu plugin list with legacy kexts is hosted [here](https://github.com/acidanthera/Lilu/blob/master/KnownPlugins.md). For developers only.   
Acidanthera members are not affiliated with the authors of any kernel extensions but ones hosted at https://github.com/acidanthera. This list is provided for information purposes without warranty of any kind.  
