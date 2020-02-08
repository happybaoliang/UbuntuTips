# 装机必备软件及配置
## 修改默认的系统启动顺序
运行下面的命令并修改默认的启动序号：

```
sudo gedit /boot/grub/grub.cfg
```

## 配置系统更新源
(1) 运行下面的命令找开更新源文件：

```
sudo gedit /etc/apt/sources.list
```
(2) 增加下面的内容

```
#163源
deb http://mirrors.163.com/ubuntu/ precise main restricted
deb-src http://mirrors.163.com/ubuntu/ precise main restricted
deb http://mirrors.163.com/ubuntu/ precise-updates main restricted
deb-src http://mirrors.163.com/ubuntu/ precise-updates main restricted
deb http://mirrors.163.com/ubuntu/ precise universe
deb-src http://mirrors.163.com/ubuntu/ precise universe
deb http://mirrors.163.com/ubuntu/ precise-updates universe
deb-src http://mirrors.163.com/ubuntu/ precise-updates universe
deb http://mirrors.163.com/ubuntu/ precise multiverse
deb-src http://mirrors.163.com/ubuntu/ precise multiverse
deb http://mirrors.163.com/ubuntu/ precise-updates multiverse
deb-src http://mirrors.163.com/ubuntu/ precise-updates multiverse
deb http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ precise-security main restricted
deb-src http://mirrors.163.com/ubuntu/ precise-security main restricted
deb http://mirrors.163.com/ubuntu/ precise-security universe
deb-src http://mirrors.163.com/ubuntu/ precise-security universe
deb http://mirrors.163.com/ubuntu/ precise-security multiverse
deb-src http://mirrors.163.com/ubuntu/ precise-security multiverse
deb http://extras.ubuntu.com/ubuntu precise main
deb-src http://extras.ubuntu.com/ubuntu precise main
#sohu源
deb http://mirrors.sohu.com/ubuntu/ precise main restricted
deb-src http://mirrors.sohu.com/ubuntu/ precise main restricted
deb http://mirrors.sohu.com/ubuntu/ precise-updates main restricted
deb-src http://mirrors.sohu.com/ubuntu/ precise-updates main restricted
deb http://mirrors.sohu.com/ubuntu/ precise universe
deb-src http://mirrors.sohu.com/ubuntu/ precise universe
deb http://mirrors.sohu.com/ubuntu/ precise-updates universe
deb-src http://mirrors.sohu.com/ubuntu/ precise-updates universe
deb http://mirrors.sohu.com/ubuntu/ precise multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise multiverse
deb http://mirrors.sohu.com/ubuntu/ precise-updates multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-updates multiverse
deb http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multiverse
deb http://mirrors.sohu.com/ubuntu/ precise-security main restricted
deb-src http://mirrors.sohu.com/ubuntu/ precise-security main restricted
deb http://mirrors.sohu.com/ubuntu/ precise-security universe
deb-src http://mirrors.sohu.com/ubuntu/ precise-security universe
deb http://mirrors.sohu.com/ubuntu/ precise-security multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-security multiverse
deb http://extras.ubuntu.com/ubuntu precise main
deb-src http://extras.ubuntu.com/ubuntu precise main
```

(3) 然后运行下面的命令更新系统信息：

```
sudo apt-get update
```

## 安装UCloner

## 安装基本编译环境
```
sudo apt-get install build-essential
```

## 64位Ubuntu安装32位软件
（1）首先安张32位库
```
sudo apt-get install ia32-libs*
sudo apt-get install getlibs
```
如果没有，到这个地址下http://frozenfox.freehostia.com/cappy/

（2）然后就可以安装32位包，安装时加--force-architecture

（3）然后用getlibs安装依赖库,如
```
$ sudo dpkg -i --force-architecture cairo-dock*.deb
$ sudo getlibs cairo-dock
```

## ICEauthority无法更新的解决办法
(1)开机过程中出现如下提示：
```
1.could not update ICEauthority file:/var/lib/gdm/.ICEauthority
2./usr/lib/libgconf2-4/gconif-sanity-check-2退出状态为256
```

(2) 解决办法是：

```
sudo dpkg-reconfigure gdm
```

## 解决E: Sub-process /usr/bin/dpkg returned an error code (1)
(1)先将原有的info目录移走

```
sudo mv /var/lib/dpkg/info /var/lib/dpkg/info.bak //现将info文件夹更名
sudo mkdir /var/lib/dpkg/info //再新建一个新的info文件夹
sudo apt-get update
```

(2)重装出问题的软件
```
apt-get -f install xxx
sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info.bak
```

(3) 执行完上一步操作后会在新的info文件夹下生成一些文件，现将这些文件全部移到info.bak文件夹下
```
sudo rm -rf /var/lib/dpkg/info //把自己新建的info文件夹删掉
sudo mv /var/lib/dpkg/info.bak /var/lib/dpkg/info //把以前的info文件夹重新改回名字
```

## 建立Ubuntu本地源
(1) 用新立得查看apt-mirror，我的机器已经安装，如果没有装，标记安装，应用。

(2) 配置apt-mirror软件，
```
sudo gedit /etc/apt/mirror.list
```

清空mirror.list文件，写入下列内容。
```
############# config ##################
set base_path    /media/Software/mirror
set mirror_path  $base_path/mirror
set skel_path    $base_path/skel
set var_path     $base_path/var
set cleanscript $var_path/clean.sh
set defaultarch  <running host architecture>
set postmirror_script $var_path/postmirror.sh
set run_postmirror 0
set nthreads    20
set _tilde 0
############# end config ##############
#64bit deb
deb-amd64 http://mirrors.sohu.com/ubuntu/ precise main restricted universe multiverse
deb-amd64 http://mirrors.sohu.com/ubuntu/ precise-security main restricted universe multiverse
deb-amd64 http://mirrors.sohu.com/ubuntu/ precise-updates main restricted universe multiverse
deb-amd64 http://mirrors.sohu.com/ubuntu/ precise-proposed main restricted universe multiverse
deb-amd64 http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multiverse
#32bit deb
deb-i386 http://mirrors.sohu.com/ubuntu/ precise main restricted universe multiverse
deb-i386 http://mirrors.sohu.com/ubuntu/ precise-security main restricted universe multiverse
deb-i386 http://mirrors.sohu.com/ubuntu/ precise-updates main restricted universe multiverse
deb-i386 http://mirrors.sohu.com/ubuntu/ precise-proposed main restricted universe multiverse
deb-i386 http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multiverse
#src pack
deb-src http://mirrors.sohu.com/ubuntu/ precise main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-security main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-updates main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-proposed main restricted universe multiverse
clean http://mirrors.sohu.com/ubuntu
```

说明：上面内容大意是使用20线程，把服务器上precise版的ubuntu 32/64位软件源的main、restricted、universe、 multiverse几个部分镜像到本地。本地默认存放软件源的文件夹是/media/Software/mirror，请保证至少有120G的剩余空间。

(3) 运行apt-mirror元件，开始镜像。
```
sudo apt-mirror
```

之后你可以干的就是一段不太短的时间的等待。同步过程可以中断，关闭终端就可以。下次你想再同步的时候重新运行sudo apt-mirror就可以。

(4) 备份并打开软件源配置文件，
```
$ sudo cp /etc/apt/source.list /etc/apt/source.list_httpsource
sudo gedit /etc/apt/source.list
```

清空文件，写入下列内容，
```
deb file:///media/Software/mirror/mirror/mirrors.sohu.com/ubuntu/ precise main restricted
deb file:///media/Software/mirror/mirror/mirrors.sohu.com/ubuntu/ precise-updates main restricted
deb file:///media/Software/mirror/mirror/mirrors.sohu.com/ubuntu/ precise universe
deb file:///media/Software/mirror/mirror/mirrors.sohu.com/ubuntu/ precise-updates universe
deb file:///media/Software/mirror/mirror/mirrors.sohu.com/ubuntu/ precise multiverse
deb file:///media/Software/mirror/mirror/mirrors.sohu.com/ubuntu/ precise-updates multiverse
```

保存，退出。好了，打开新立得，刷新。开始本地高速安装吧。

## Ubuntu无法进入系统的解决办法
ubuntu 12.04进入恢复模式以后，文件系统是只读的，可以通过下面的方法修改。

```
# mount /dev/sda1 / -o rw,remount
```

如果在登陆界面输入密码后只是闪一下又回到登陆界面的，可以将本用户目录下的.Xauthority文件删除。

## ubuntu清理系统垃圾
linux不会产生无用垃圾文件，但是在升级缓存中，linux不会自动删除这些文件。

(1) 非常有用的清理命令：
```
sudo apt-get autoclean
sudo apt-get clean
```

这三个命令主要清理升级缓存以及无用包的。

(2) 清理opera firefox的缓存文件：
```
ls ~/.opera/cache4
ls ~/.mozilla/firefox/*.default/Cache
```

(3) 清理Linux下孤立的包：

图形界面下我们可以用：gtkorphan
```
sudo apt-get install gtkorphan -y
```

终端命令下我们可以用：deborphan
```
sudo apt-get install de borphan -y
```

(4) 卸载tracker

这个东西一般我只要安装ubuntu就会第一删掉tracker 他不仅会产生大量的cache文件而且还会影响开机速度。所以在新得利里面删掉就行。

(5) 删除多余的内核：

打开终端敲命令：
```
dpkg --get-selections|grep linux
```
有image的就是内核文件

删除老的内核文件：
```
sudo apt-get remove 内核文件名 （例如：linux-image-2.6.27-2-generic）
```

内核删除，释放空间了，应该能释放130－140M空间。

最后不要忘了看看当前内核：uname -a

(6) 更彻底的删除内核方法：
```
dpkg --list | grep linux-image
sudo apt-get purge linux-image-*
dpkg --list | grep linux-headers
sudo apt-get purge linux-headers
```

## 安装文件的默认打开方式
可以用Ubuntu Tweak中的“文件类型管理器”改

## 安装字体

## 调节CPU频率
```
#cpufrequtils－－调节CPU频率
#监视cpu频率：右键单击面板，选择“添加到面板”，里面找到“cpu频率范围监视器”。
sudo apt-get install cpufrequtils --force-yes -y
sudo cpufreq-set -g ondemand
```

执行cpufreq-info可看到CPU所支持的模式，大致有如下几种：

powersave，是无论如何都只会保持最低频率的所谓“省电”模式；

userspace，是自定义频率时的模式，这个是当你设定特定频率时自动转变的；

ondemand，一有cpu计算任务，立即达到最大频率，执行完毕立即回到最低频率

conservative，保守模式（默认），一般选择这个，会自动在频率上下限调整；

performance，顾名思义只注重效率，无论如何一直保持以最大频率运行。

## 监视CPU温度：
添加到面板的项的名字叫“Hardware sensors monitor"
```
sudo apt-get install sensors-applet --force-yes -y
```

## 安装NTFS读写支持
安装完后，点击“应用程序” - “系统工具” - “NTFS写入支持配置程序”输入密码，选中对内部设备的读写支持，和外部设备的读写支持，系统会自动扫描你硬盘上的NTFS分区，并重新挂载，这样，你的NTFS分区就能在Feisty下完美读写了！
```
sudo apt-get install ntfs-config --force-yes -y
```

## 安装dkms和wine
```
sudo apt-get install dkms wine
```

## 安装CCSM以启动Ubuntu桌面特效和3D加速效果
```
sudo apt-get install compizconfig-settings-manager
```

## 安装Ubuntu Restricted Extras
安装Ubuntu Restricted Extras软件包后，我们就可以播放mp3,avi,Flash等。
```
sudo apt-get install ubuntu-restricted-extras
```

## 解决在virtualbox中无法进入共享目录
```
sudo ln -f -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions/mount.vboxsf /sbin/mount.vboxsf
```

## 安装exfat
对于ubuntu 14.04版本，直接运行下面的命令就可以了：
```
安装完之后重启生效。
```
对于ubuntu 12.04 ~ 13.10的版本，分别：
```
sudo add-apt-repository ppa:relan/exfatsudo apt-get updatesudo apt-get install exfat-utils fuse-exfat
```
