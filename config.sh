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

# ============ 粘贴 GitHub Token（交互式） ============
echo ""
echo "============ 配置 GitHub Token ============"
echo "1. 打开 https://github.com/settings/tokens 生成一个 Personal Access Token"
echo "2. 勾选 repo（或适合你的权限范围）"
echo "3. 粘贴生成的 token（ghp_ 开头），按回车："
echo ""
read -r -s GITHUB_TOKEN
echo ""

if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ 未检测到 Token，已取消。"
    exit 1
fi

# 保存到 git 凭据存储
echo "正在配置 git 凭据……"
git config credential.helper store
echo "https://${GIT_USER}:${GITHUB_TOKEN}@github.com" > "$HOME/.git-credentials"
chmod 600 "$HOME/.git-credentials"

echo ""
echo "✅ GitHub Token 已配置完成（保存在 ~/.git-credentials，权限 600）"
echo "以后通过 HTTPS push / pull 不再需要输入用户名密码。"
echo ""
echo "配置远程仓库示例（如果你的仓库还没关联）："


# ============ 粘贴 GitHub 仓库地址（交互式） ============
read -r -p "输入你的 GitHub 仓库地址: " GIT_REMOTE
if [ -z "$GIT_REMOTE" ]; then
    echo "❌ 你仓库地址呢???"
    exit 1
fi

# 关联远程仓库（origin 已存在则更新地址）
git remote add origin "$GIT_REMOTE"
echo "✅ 远程仓库已关联：origin → $GIT_REMOTE"
echo "✅ 用户名: $GIT_USER
✅ 邮箱: $GIT_EMAIL
✅ Token: $GITHUB_TOKEN
✅ 仓库: $GIT_REMOTE"
echo "✅ 所有 GitHub 上传文件配置成功"

