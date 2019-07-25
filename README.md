# 微信动物餐厅
微信动物餐厅自动点击发传单，自动点菜

## 原理
通过Android的sendevent模拟点击

## 使用方法

### Mac OS

1. 安装adb
`brew cask install android-platform-tools`

2. 把脚本文件发送到Android机器 
adb push start.sh /sdcard

3. 打开动物餐厅界面，启动脚本
adb shell sh /sdcard/start.sh

## 其他
本项目仅仅供学习研究，如有侵权请联系删除处理
