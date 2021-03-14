# ASUS-B360M-i5 8600k-OC0.6.8

- 不是自己编译版 基本包为 独行秀才 的编译包

- 支持核显自动识别 经测试 boot-args：igfxfw=2 npci=0x3000 就可以自动驱动核显

- 下载系统和系统写入u盘可以看看上面的[wiki](https://gitee.com/k2y1982/OC/wikis)。

# **为配合 big sur 安装特性已做如下修改：** 

- 最新的正式版和Big Sur beta版已支持中文，SecureBootModel 也可以设置为 Default

- 如果你还是beta10的镜像请将 NVRAM - 7C436110-AB2A-4BBB-A880-FE41995C9F82 - prev-lang:kbd 已设置为英语 656E2D55533A30

- 如果你之前已经安装过macOS，在更改efi后，请在oc的辅助项里 使用一次 reset_NVRAM 以清理 NVRAM。

- 不然会遇到-v代码跑完-进度条跑完后只有灰屏和鼠标(big sur beta10 全新安装时)。

# **如果你是安装 Catalina 可以将：** 

- 1.Misc - Security - SecureBootModel 已设置为 Default (默认已改回Default）

- 这样就不会遇到挂在efi分区时occ卡死的问题。

- 2.NVRAM - 7C436110-AB2A-4BBB-A880-FE41995C9F82 - prev-lang:kbd 已设置为中文(默认已改回中文) 7A682D48 616E733A 323532

# **目前版本为：**

**2021-03-13编译OpenCore-0.6.8-03-13编译版**

- 修正了SMBIOS SMC版本编码顺序
- 从苹果平台信息增加了TSC频率读取
- 为使用nForce芯片组的苹果设备增加了TSC频率读取。

 **2021-03-11编译OpenCore-0.6.8-03-11编译版**

- 进一步改进了传统CPU的CPU频率计算

 **2021-03-09编译OpenCore-0.6.8-03-09编译版**

- 修复OpenCanopy有时会是开机显示菜单错误.

 **2021-03-07编译OpenCore-0.6.8-03-07编译版**

- 修复在根文件系统无法创建日志文件的问题
- 修复DisableSingleUser在某些情况下不被启用
- Mac EFI固件增加了ForceBooterSignature quirk

 **2021-03-05编译OpenCore-0.6.8-03-05编译版**

- Windows版本切换为VS2019 toolchain
- 减少了旧式引导安装交互工作
- 提高了OpenCanopy渲染性能
- 减少OpenCanopy鼠标指针输入延迟
- 修正了光标边界可能与OpenCanopy的不同
- 改进的内置选取器渲染性能
- 在“自动”模式下为SMBIOS添加了内存类型解码
- 支持将自定义项设置为默认引导选项

 **2021-03-03编译OpenCore-0.6.8-03-03编译版**

- 更新版本号为0.6.8 开发版

 **2021-03-01编译OpenCore-0.6.7-03-01编译版**

- 添加ResetTrafficClass以在legacy HDA上将TCSEL重置为T0
- 修复启动选票超时时，选择默认启动项
- 添加ocpasswordgen实用程序来生成OpenCore密码数据
- 添加ActivateHpetSupport quirk项来激活对HPET的支持
- 修复opencore版本在极少数情况下报告错误版本的问题

 **2021-02-25编译OpenCore-0.6.7-02-25编译版**

- 移除KeyMergeThreshold
- 添加了acdtinfo实用程序来查找某些产品

 **2021-02-23编译OpenCore-0.6.7-02-23编译版**

- 增加了GopPassThrough选项，以支持UGA上的GOP协议。
- 修复部分Xeon和Core 2 CPU频率。

 **2021-02-21编译OpenCore-0.6.7-02-21编译版**

- 为某些Apple SMBIOS表添加了OEM保护
- 修复切换到图形模式时使用OpenCanopy，
- 修正在没有GOP的情况下安装Apple-FB协议的问题。

 **2021-02-19编译OpenCore-0.6.7-02-19编译版**

- 在旧固件的调试版本中增加了早期版本的屏幕登录功能
- 新增引导时未指定DeviceHandle固件的解决方法
- 在SetupVirtualMap中增加了对R/O页表的支持

 **2021-2-1 OC 0.6.6 by 独行秀才**

- 更新内容：
- 修复了在SMBIOS的non-Automatic模式下从DataHub使用SystemUuid的问题
- 从通用模式删除故障保护默认值以匹配non-Automatic模式
- 用LauncherOption和LauncherPath替换了BootProtect
- 新增OpenPartitionDxe用于Apple分区管理方案
- 改进了Misc、NVRAM和UEFI部分中的ocvalidate检查

 **2021-1-26 OC 0.6.6 by 独行秀才**

- 更新内容：
- 添加SetApfsTrimTimeout来优化APFS trim命令

 **2021-1-24 OC 0.6.6 by 独行秀才**

- 更新内容：
- 修复OpenUsbKbDxe在处理不支持的设备时崩溃的问题
- 移除HdaCodecDump 以支持SysReport

 **2021-1-22 OC 0.6.6 by 独行秀才**

- 更新内容：
- 修复了所有二进制文件与页面保护的兼容性

 **2021-1-20 OC 0.6.6 by 独行秀才**

- 更新内容：
- 将音频编解码器转储添加到SysReport中

 **2021-1-18 OC 0.6.6 by 独行秀才**

- 更新内容：
- 优化部分代码

 **2021-1-16 OC 0.6.6 by 独行秀才**

- 更新内容：
- 优化部分代码

 **2021-1-14 OC 0.6.6 by 独行秀才**

- 更新内容：
- 用OpenHfsPlus替换VBoxHfs驱动程序

 **2021-1-12 OC 0.6.6 by 独行秀才**

- 更新内容：
- 将MaxBIOSVersion选项添加到Generic
- 修复macrecovery中的MLB验证功能

 **2021-1-10 OC 0.6.6 by 独行秀才**

- 更新内容：
- 图标文件添加了对应OpenCanopy的图标

 **2021-1-6 OC 0.6.6 by 独行秀才**

- 更新内容：
- 更新版本号至0.6.6

 **2020-12-29 OC 0.6.5 by 独行秀才**

- 更新内容：
- 优化部分代码

 **2020-12-29 OC 0.6.5 by williambj1**

- 更新内容：
- Utilities: Fix misc duplicate validation
- Utilities: Deduplication support for Misc
- Utilities: Fix casting in ocvalidate
- Utilities: Fix docs in ocvalidate
- Utilities: Deduplication support for DeviceProperties
- Utilities: Fix variable names and doc in ocvalidate
- OcConfigurationLib: Fix typos in configuration types, thx @MikeBeaton
- Utilities: Implement initial deduplication for ocvalidate (#172)
- Docs: Change SetupDelay position in Sample for alphabetical order (#171)
- ocvalidate: Add AsciiGuidIsLegal API
- Remove double

 **2020-12-27 OC 0.6.5 by 独行秀才**

- 更新内容：
- 新增SetupDelay来配置音频设置延迟

 **2020-12-26 OC 0.6.5 by williambj1**

- 更新内容：
- OpenCoreUefiAudio: Implement UEFI audio SetupDelay
- User: Implement fuzzing and coverage gathering support with docs

 **2020-12-25 OC 0.6.5 by 独行秀才**

- 更新内容：
- 修复了处理无效序列时macserial崩溃的问题
- 修正了处理2021年系列时的macserial问题
- 在ocvalidate实用程序中增加了高级错误检查

 **2020-12-25 OC 0.6.5 by williambj1**

- 更新内容：
- Update README.md
- Update ValidateKernel.c
- Update build_oc.tool
- Utilities: Rename ocvalidate Checklist to README
- Update ValidateKernel.c
- Utitlities: Bundle and fix checklist
- Docs: Sync changelog
- Utilities: Advanced ocvalidate for error checking (#169)

 **2020-12-24 OC 0.6.5 by williambj1**

- 更新内容：
- OpenCanopy: Fix double-click regression introduced in 0.6.5

 **2020-12-23 OC 0.6.5 by 独行秀才**

- 更新内容：
- 修正了使用自定义SMBIOS内存配置时的内存容量
- 删除不再需要UEFI-Quirks-DeduplicateBootOrder项

 **2020-12-23 OC 0.6.5 by williambj1**

- 更新内容：
- Up macserial version
- Utilities: Fix macserial crash with invalid serial
- OcStringLib: Add UnicodeIsFilteredString API
- OpenCoreUefi: Fix compilation
- OpenCoreUefi: Remove DeduplicateBootOrder quirk

 **2020-12-22 OC 0.6.5 by williambj1**

- 更新内容：
- OcSmbiosPatch: Fix incorrect cast for max memory capacity

 **2020-12-21 OC 0.6.5 by 独行秀才**

- 更新内容：
- 修复启动时计时器分辨率的问题

 **2020-12-20 OC 0.6.5 by williambj1**

- 更新内容：
- OcInputLib: Workaround timer resolution restoration

 **2020-12-19 OC 0.6.5 by 独行秀才**

- 更新内容：
- 向编译ACPI包中添加了已编译的SSDT范例

 **2020-12-17 OC 0.6.5 by 独行秀才**

- 更新内容：
- 更新了SMBIOS内置固件版本
- 修复了macrecovery服务器协议兼容性
- 在OpenCanopy中添加了基本的音频助手支持

 **2020-12-17 OC 0.6.5 by williambj1**

- 更新内容：
- Docs: Updated Samples
- OpenCanopy: Basic audio assist support (#74)

 **2020-12-16 OC 0.6.5 by williambj1**

- 更新内容：
- DataBase: Updated builtin firmware versions

 **2020-12-15 OC 0.6.5 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-12-13 OC 0.6.5 by 独行秀才**

- 更新内容：
- 修复在受保护卷上安装OpenDuet的问题
- 将EDK II基础包更新为edk2-stable20201

 **2020-12-13 OC 0.6.5 by williambj1**

- 更新内容：
- Update Kexts.md
- Build: Fix Duet compilation with new EDK II
- Docs: Mention updating to edk2-stable202011
- OcStringLib: Add IsAsciiAlpha API

 **2020-12-11 OC 0.6.5 by williambj1**

- 更新内容：
- OcStringLib: Add OcAsciiStriStr API
- Utilities: Fixed installing OpenDuet on protected volumes, thx Rodion

 **2020-12-11 OC 0.6.5 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-12-09 OC 0.6.5 by 独行秀才**

- 更新内容：
- 更新版本号至0.6.5

 **2020-12-08 OC 0.6.4 正式版 by 独行秀才**

- 更新内容：
- 修正了OpenDuet中导致随机崩溃和挂起等未定义行为
- 编译OpenCore-0.6.4-12-08正式版

 **2020-12-08 OC 0.6.5 by williambj1**

- 更新内容：
- Docs: Updeted Samples and ABC sorting
- Bump version to 0.6.5

 **2020-12-07 OC 0.6.4 by 独行秀才**

- 更新内容：
- 在Booter patch部分添加了bootloader补丁支持
- 修复了firmware上的启动挂起问题，允许计时器函数重新进入
- 通过PickerAttributes使OpenCanopy的指针控制可选
- 在PlayChime中增加对StartupMute变量的支持
- 增加了对APFS预引导时的每卷图标的支持
- 已从OpenUsbKbDxe驱动程序中删除对HII的依赖项

 **2020-12-07 OC 0.6.4 by williambj1**

- 更新内容：
- OpenUsbKbDxe: Removed HII dependency from OpenUsbKbDxe driver
- BdsDxe: Sync with select upstream changes

 **2020-12-05 OC 0.6.4 by 独行秀才**

- 更新内容：
- 避免在RequestBootVarRouting中使用引导前缀来解决AMI问题

 **2020-12-03 OC 0.6.4 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-12-03 OC 0.6.4 by williambj1**

- 更新内容：
- Build: Restrict coverity run to acidanthera and fix status badge

 **2020-12-01 OC 0.6.4 by 独行秀才**

- 更新内容：
- 增加了BootstrapShort，以解决Insyde固件de 错误
- 改变Bootstrap(Short) 选择动态入口(需要NVRAM重置)

 **2020-12-01 OC 0.6.4 by williambj1**

- 更新内容：
- OcMiscLib: Unroll pattern matching loop
- OcAfterBootCompatLib: Fix macOS version detection
- Docs: Sync changelog
- OcAfterBootCompatLib: Provide cleaner patches for sur safe mode
- OcAfterBootCompatLib: Fix warning with MSVC
- OcAfterBootCompatLib: Fix regression with Big Sur safe mode quirk

 **2020-11-30 OC 0.6.4 by williambj1**

- 更新内容：
- Fixed previous
- Docs: Added Secure Boot note

 **2020-11-29 OC 0.6.4 by 独行秀才**

- 更新内容：
- 修复了启用Apple安全引导时"DisableSingleUser"的问题

 **2020-11-27 OC 0.6.4 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-11-25 OC 0.6.4 by williambj1**

- 更新内容：
- Updated MinKernel

 **2020-11-25 OC 0.6.4 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-11-23 OC 0.6.4 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-11-21 OC 0.6.4 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-11-19 OC 0.6.4 by 独行秀才**

- 更新内容：
- 修复了更新链接

 **2020-11-17 OC 0.6.4 by 独行秀才**

- 更新内容：
- 修复了AMD 19h系列CPU频率计算问题

 **2020-11-15 OC 0.6.4 by 独行秀才**

- 更新内容：
- 修复了MacOS11.0上启用安全模式的问题
- 为老旧macOS和安全模式添加了AllowRelocationBlock选项

 **2020-11-13 OC 0.6.4 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-11-13 OC 0.6.4 by williambj1**

- 更新内容：
- OcAfterBootCompatLib: Fixed EnableSafeModeSlide on macOS 11.0
- AppleFeatures: Add some EfiBoot feature bits
- Legacy: Fix double ready-to-boot signaling

 **2020-11-11 OC 0.6.4 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-11-9 OC 0.6.4 by 独行秀才**

- 更新内容：
- 通过RealPath为工具添加了直接路径
- 允许通过TextMode以文本模式启动选项和目录
- 更新了SMBIOS和其他系统的内置固件版本
- 修复了ACPI修补程序在锁定内存中时无法使用的问题

 **2020-11-9 OC 0.6.4 by williambj1**

- 更新内容：
- OcAfterBootCompatLib: Drop legacy memory location trackers
- Docs: Update changelog
- DxeIpl: Fallback to 0xCF9 for reset register
- OcMemoryLib: Allow overriding page allocator for allocate from top
- OcAcpiLib: Relocate ACPI tables if they are not writeable (#152)

 **2020-11-7 OC 0.6.4 by 独行秀才**

- 更新内容：
- 修正了mkext中注入kexts的补丁
- 增加了对从相对路径启动的支持

 **2020-11-5 OC 0.6.4 by 独行秀才**

- 更新内容：
- 添加了BlacklistAppleUpdate来修复11.0更新的故障
- 从OpenDuet删除HII服务，提高了OpenDuet大小和性能

 **2020-11-5 OC 0.6.4 by williambj1**

- 更新内容：
- Docs: Add Find My Mac to Sample legacy schema (#151)
- Update SampleCustom.plist

 **2020-11-4 OC 0.6.4 by williambj1**

- 更新内容：
- Docs: add nvram-log=1

 **2020-11-3 OC 0.6.4 by 独行秀才**

- 更新内容：
- 更新版本号为0.6.4

 **2020-11-3 OC 0.6.4 by williambj1**

- 更新内容：
- OcAcpiLib: Add ACPI signature log printing
- Bump version to 0.6.4

 **2020-11-1 OC 0.6.3 by 独行秀才**

- 更新内容：
- 给一些X299主板上的只读错误增加了解决方案
- 增加了对x86legacy安全引导模型的支持

 **2020-10-30 OC 0.6.3 by 独行秀才**

- 更新内容：
- 修正了Ps2MouseDxe在OpenDuetPkg下未正确加载

 **2020-10-30 OC 0.6.3 by williambj1**

- 更新内容：
- DataBase: Updated builtin firmware versions
- OcConsoleLib: Improve error reporting with TextoutputBuiltin (#143)

 **2020-10-29 OC 0.6.3 by williambj1**

- 更新内容：
- DataBase: Updated builtin firmware versions
- DataBase: Update MM71

 **2020-10-28 OC 0.6.3 by williambj1**

- 更新内容：
- Patches: Fix previous commit
- Patches: Add PS/2 mouse patch for SioBusDxe

 **2020-10-28 OC 0.6.3 by 独行秀才**

- 更新内容：
- 添加ForceResolution选项以启用非默认分辨率

 **2020-10-27 OC 0.6.3 by williambj1**

- 更新内容：
- Docs: Fixed typo
- Docs: Rebuild pdf and update changelog
- VBIOS patching via ForceResolution option (#144)

 **2020-10-26 OC 0.6.3 by 独行秀才**

- 更新内容：
- 修正了在选择MacPro5,1时的扫描策略 NVMe的问题
- 修复了平台上的I/O无法读取超过1MB的问题
- 修复了在Big Sur上plist-only kext注入的问题

 **2020-10-26 OC 0.6.3 by williambj1**

- 更新内容：
- Docs: Update changelog

 **2020-10-25 OC 0.6.3 by williambj1**

- 更新内容：
- OcAppleKernelLib: Rebuild KC when no kexts are injected
- OcAppleKernelLib: Fix invalid kremlin section
- OcFileLib: Actually fix MSVC warnings
- OcAppleKernelLib: Zero trailing KC expansion
- OcFileLib: Silence MSVC
- OcFileLib: Fixed I/O issues on platforms incapable of reading over 1MB
- Docs: Add errata entry for 11.0 b10
- Patches: Fix warning with newer git client version
- OcBootManagementLib: Fixed ScanPolicy NVMe handling on MacPro5,1

 **2020-10-24 OC 0.6.3 by 独行秀才**

- 更新内容：
- 例行更新

 **2020-10-22 OC 0.6.3 by 独行秀才**

- 更新内容：
- 修正了老旧Atom cpu检测的问题

 **2020-10-21 OC 0.6.3 by williambj1**

- 更新内容：
- OcCpuLib: Add compatibility for Bonnell Atom CPUs
- OcCpuLib: First-gen Atom does not support TURBO_RATIO_LIMIT MSR
