#!/bin/bash
# 一键上传 GitHub 脚本，第一次启动会让你填写 name 和 email，和绑定远程仓库，最后填写 GitHub 密钥，下次再启动就可以直接上传了
# 需要上传时，在终端里打开需要上传文件夹的根目录，输入 ./push.sh
# 在 " " 那里自己修改上传更新内容
git add .
git commit -m "添加补全依赖和说明文字"
git push origin main
