# OC 0.7.2 官方正式版

- 修复了OSBundleLibraries/OSBundleLibraries 64处理
- 添加以修复某些非Apple图形UEFI应用程序GraphicsInputMirroring中丢失的按键
- 增加了对堆栈金丝雀（安全cookie/堆栈防护）的支持
- 修复了AudioDxe中导致音频播放失败的未初始化内存访问
- 将Apple Secure Boot型号更改为，以提高安全性和兼容性Defaultx86Legacy
- 增加默认APF和macOS Big Sur，以获得更好的安全性IndateMinVersion
- 更新了SMBIOS和其他系统的内置固件版本
- 改进了SSDT-PNLF与Windows和更新图形的兼容性
- 通过缩短OC magic修复了CLANGPDB OpenCore构建