# Heroku

## 概述
 https://github.com/debuerreotype/docker-debian-artifacts/tree/819ea4f3f6feeb849244ca1fa17b6105a7742daa/buster

 d00a79916ed868d95489
## 镜像

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https%3A%2F%2Fgithub.com%2Fhistory2%2F2021-heroku-d)

##  使用

把`rclone.conf`配置改成自己的


修改`.aria2c/script.conf`
```
# 网盘名称(RCLONE 配置时填写的 name)
drive-name=moenekou2

# 网盘目录(上传目标目录，网盘中的文件夹路径)。注释或留空为网盘根目录，末尾不要有斜杠。
drive-dir=/heroku
```
然后重新打包成`home.tar.gz`

使用heroku cil push部署即可
