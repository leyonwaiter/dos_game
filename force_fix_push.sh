#!/bin/bash
# 1. 强制将远程仓库协议从 SSH 切换为 HTTPS
git remote set-url origin https://github.com/leyonwaiter/dos_game.git

# 2. 清除可能残留的凭据配置
git config --global --unset credential.helper
git config --system --unset credential.helper

# 3. 设置大文件缓冲区（防止 pal.zip 推送失败）
git config http.postBuffer 524288000

# 4. 尝试推送
# 注意：GitHub 现在不支持密码，执行后如果提示输入密码，请粘贴你的 GitHub Personal Access Token (PAT)
echo "正在尝试通过 HTTPS 推送..."
git push -u origin main
