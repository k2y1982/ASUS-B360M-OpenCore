# OC 0.8.3 官方正式版

Added ext4 file system driver
Added support for macOS 13 DP3 Kernel Collection
Added --force-device option to AudioDxe, allowing UEFI audio on HDA contollers which misreport themselves as non-HDA audio devices
Provided optional unsafe fast file logging (suitable only for firmware with a fully compliant FAT32 driver)
Fixed incorrect OSBundleLibraries_x86_64 handling during cacheless injection
Changed RsaTool not to link against system ssl on macOS
Fixed crash during cacheless injection when kext blocking is enabled
Removed default codec connection delay from AudioDxe
Added optional --codec-setup-delay argument to AudioDxe
Changed units of Audio -> SetupDelay from microseconds to milliseconds (divide previous value by 1000 if using this setting)
Fixed incorrect FAT binary slice being selected under macOS 10.4.11 when performing a cacheless boot
Fixed rare assertion caused by label animation initialisation in OpenCanopy
Added --show-csr option for Toggle SIP boot menu entry
Added macOS 10.4 and 10.5 support to AllowRelocationBlock Booter quirk
Added CPU cache info injection for macOS 10.4 to ProvideCurrentCpuInfo quirk
Added emulated NVRAM driver for use separately from OpenDuet
Added support for NVRAM reset and set default boot entry when using emulated NVRAM
Upgraded emulated NVRAM logout script to allow unsupervised installation of recent macOS OTA updates
Added Driver -> LoadEarly for drivers which need to be loaded before NVRAM init