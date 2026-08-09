#!/bin/bash
#明明有VSCode的GUI界面，为什么还要写这个脚本？因为我还没有学过使用bash脚本的语法，写一次就学会了，哈哈哈
# ============ Git 用户配置（交互式） ============
echo "============ Git 用户配置 ============"
read -r -p "请输入你的 GitHub 用户名: " GIT_USER

if [ -z "$GIT_USER" ]; then
    echo "❌ 你名字呢???"
    exit 1
fi
read -r -p "请输入你的 GitHub 邮箱: " GIT_EMAIL

if [ -z "$GIT_EMAIL" ]; then
    echo "❌ 你邮箱呢???"
    exit 1
fi 

git config user.name "$GIT_USER"
git config user.email "$GIT_EMAIL"
echo "✅ 已设置：$GIT_USER <$GIT_EMAIL>"

# ============ SSH 密钥配置（更安全，不保存任何密码到磁盘） ============
echo ""
echo "============ SSH 密钥配置 ============"
SSH_KEY="$HOME/.ssh/id_ed25519"

if [ -f "$SSH_KEY.pub" ]; then
    echo "✅ 检测到已存在的 SSH 公钥：$SSH_KEY.pub"
else
    echo "未找到 SSH 密钥，正在生成（ed25519 算法）……"
    mkdir -p "$HOME/.ssh"
    ssh-keygen -t ed25519 -C "$GIT_EMAIL" -N "" -f "$SSH_KEY"
    echo "✅ SSH 密钥已生成"
fi

echo ""
echo "下面是你的公钥，请复制并添加到 GitHub："
echo "  1. 打开 https://github.com/settings/keys"
echo "  2. 点 New SSH key，粘贴下面的内容，保存"
echo ""
cat "$SSH_KEY.pub"
echo ""

read -r -p "添加完成后按回车，测试 SSH 连接……" _
ssh -o StrictHostKeyChecking=accept-new -T git@github.com
echo ""
echo "（如果上面显示 Hi <用户名>! You've successfully authenticated，说明 SSH 配置成功）"
echo ""
echo "配置远程仓库（SSH 格式）："


# ============ 关联远程仓库（SSH 格式） ============
read -r -p "输入你的 GitHub 仓库名（如 New-blog-v3）: " GIT_REPO
if [ -z "$GIT_REPO" ]; then
    echo "❌ 你仓库名呢???"
    exit 1
fi

GIT_REMOTE="git@github.com:${GIT_USER}/${GIT_REPO}.git"

# 已存在 origin 则先移除，避免重复
git remote remove origin 2>/dev/null
git remote add origin "$GIT_REMOTE"
echo "✅ 远程仓库已关联：origin → $GIT_REMOTE"

echo ""
echo "✅ 全部配置完成！"
echo "  - 用户名: $GIT_USER"
echo "  - 邮箱:   $GIT_EMAIL"
echo "  - 远程:   $GIT_REMOTE"
echo "  - 认证:   SSH（不保存任何密码到磁盘）"
echo ""
echo "以后推送：./push.sh 或 git push origin main"
echo ""
echo "⚠️ 安全提示：如果你之前用旧版脚本保存过 Token，建议清理明文凭据："
echo "   rm -f ~/.git-credentials && git config --unset credential.helper"

