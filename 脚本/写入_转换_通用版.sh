function title()
{
	echo "*****************************"
	echo "${1}"
	echo "*****************************"
}

function build_app() {
	title "在显示包内容>Contents>Resources里寻找"
	# 在桌面创建build_from_Applications.sh
	touch ~/Desktop/build_from_Applications.sh
	# 写入创建空镜像
	echo "hdiutil create -o ~/Desktop/macOS_install -size 14g -layout SPUD -fs HFS+J -type SPARSE" > ~/Desktop/build_from_Applications.sh
	echo "hdiutil attach ~/Desktop/macOS_install.sparseimage -noverify -nobrowse -mountpoint /Volumes/install_build" >> ~/Desktop/build_from_Applications.sh
	# 打开应用程序文件夹
	# 如果打开的目录有问题请用下面那句，下下句删掉
	# open /Applications
	open /Applications/Install*macOS*/Contents/Resources
	# 写入 获取createinstallmedia实际地址 并 写入空镜像
	read -r -p '将安装包里的createinstallmedia拖入终端：' createinstallmedia
	echo "sudo -S $createinstallmedia --volume /Volumes/install_build --nointeraction" >> ~/Desktop/build_from_Applications.sh
	# 卸载挂载的镜像
	echo "hdiutil detach /Volumes/Shared* -force" >> ~/Desktop/build_from_Applications.sh
	echo "hdiutil detach /Volumes/Install* -force" >> ~/Desktop/build_from_Applications.sh
	# 写入 缩小新镜像体积并改名
	echo 'hdiutil compact ~/Desktop/macOS_install.sparseimage' >> ~/Desktop/build_from_Applications.sh
	echo 'hdiutil resize -size min ~/Desktop/macOS_install.sparseimage' >> ~/Desktop/build_from_Applications.sh
	echo 'mv ~/Desktop/macOS_install.sparseimage ~/Desktop/macOS_install.dmg' >> ~/Desktop/build_from_Applications.sh
	echo "rm -f ~/Desktop/build_from_Applications.sh" >> ~/Desktop/build_from_Applications.sh
	# 打开 build_from_Applications.sh
	chmod u+x ~/Desktop/build_from_Applications.sh
	open ~/Desktop/build_from_Applications.sh
}

function dmg_iso() {
	title "转换为iso格式"
	# 在桌面创建build_iso.sh
	touch ~/Desktop/build_iso.sh
	read -r -p '将：要转换的dmg镜像拖入终端' iso
	echo "hdiutil convert $iso -format UDTO -o ~/Desktop/macos_iso.cdr" > ~/Desktop/build_iso.sh
	# 将cdr改名为iso,并删除临时镜像
	echo "mv ~/Desktop/macos_iso.cdr ~/Desktop/macos_iso.iso" >> ~/Desktop/build_iso.sh
	echo "rm -f ~/Desktop/build_iso.sh" >> ~/Desktop/build_iso.sh
	chmod u+x ~/Desktop/build_iso.sh
	open ~/Desktop/build_iso.sh
}

function app_to_u() {
	title "在显示包内容>Contents>Resources里寻找"
	# 在桌面创建app_to_u.sh
	touch ~/Desktop/app_to_u.sh
	# 打开应用程序文件夹
	# 如果打开的目录有问题请用下面那句，下下句删掉
	# open /Applications
	open /Applications/Install*macOS*/Contents/Resources
	read -r -p '将安装包里的createinstallmedia拖入终端：' apptou
	echo "sudo -S $apptou --volume /Volumes/1234 --nointeraction" > ~/Desktop/app_to_u.sh
	# 卸载挂载的镜像
	echo 'hdiutil detach /Volumes/Shared* -force' >> ~/Desktop/app_to_u.sh
	echo "hdiutil detach /Volumes/Install* -force" >> ~/Desktop/app_to_u.sh
	echo "rm -f ~/Desktop/app_to_u.sh" >> ~/Desktop/app_to_u.sh
	chmod u+x ~/Desktop/app_to_u.sh
	open ~/Desktop/app_to_u.sh
}

function dmg_to_u() {
	title "在显示包内容>Contents>Resources里寻找"
	# 在桌面创建build_u.sh
	touch ~/Desktop/build_u.sh
	# 如果打开的目录有问题请用下面那句，下下句删掉
	# open /Volumes
	open /Volumes/Install*macOS*/Install*macOS*/Contents/Resources
	read -r -p '将安装包里的createinstallmedia拖入终端' upan
	echo "sudo -S $upan --volume /Volumes/1234 --nointeraction" > ~/Desktop/build_u.sh
	# 卸载挂载的镜像
	echo "hdiutil detach /Volumes/Shared*1 -force" >> ~/Desktop/build_u.sh
	echo "hdiutil detach /Volumes/Shared* -force" >> ~/Desktop/build_u.sh
	echo "hdiutil detach /Volumes/Install*1 -force" >> ~/Desktop/build_u.sh
	echo "hdiutil detach /Volumes/Install* -force" >> ~/Desktop/build_u.sh
	echo "rm -f ~/Desktop/build_u.sh" >> ~/Desktop/build_u.sh
	chmod u+x ~/Desktop/build_u.sh
	open ~/Desktop/build_u.sh
}

function diskutility() {
	open /System/Applications/Utilities/Disk\ Utility.app
}

function quite() {
	# echo '我是密码'|sudo -S kill -9 $(ps -ef|grep Terminal |awk '$0 !~/grep/ {print $2}' |tr -s '\n' ' ')
	osascript -e "tell application \"System Events\" to keystroke \"q\" using command down"
}

function usage() {
	echo "
请注意macOS_install.dmg将生成在桌面，
如需更改地址请在代码里修改所有~/Desktop。
写入U盘前请将dmg双击两下挂载成功，
写入U盘前请将U盘分区抹掉为 Mac OS扩展 (日志式) 名称：1234。

1) ${NORMAL} 从应用程序生成 macOS_install.dmg
2) ${NORMAL} 将镜像改为 ISO格式
3) ${NORMAL} 打开 磁盘工具
4) ${NORMAL} 从应用程序写入 U盘
5) ${NORMAL} 将镜像写入 U盘
q) ${NORMAL} [退出]

选择: ${NORMAL}"
}

function main_menu() {
	while [ 1 ]; do
		clear          # 清除屏幕
		usage          # 提示字符串
		read cmd       # 等待输入，以回车结束
		case $cmd in   # 这里内容自由发挥
		'1') build_app ;;
		'2') dmg_iso ;;
		'3') diskutility ;;
		'4') app_to_u ;;
		'5') dmg_to_u ;;
		'q') quite ;;
		*) echo -e $RED"错误选项."$NORMAL ;;
		esac

		# read -n 1       # 暂停，除非收到任何字符
	done
}
main_menu