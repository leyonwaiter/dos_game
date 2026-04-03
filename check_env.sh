#!/bin/bash
echo "=== Git 基础信息 ==="
git --version
git config --list --show-origin | grep -E "user|proxy|credential"

echo -e "\n=== 远程仓库状态 ==="
git remote -v

echo -e "\n=== 网络连通性测试 (GitHub) ==="
curl -I -s --connect-timeout 5 https://github.com | grep "HTTP/" || echo "连接 GitHub 失败"

echo -e "\n=== 代理环境变量 ==="
env | grep -iE "http_proxy|https_proxy|all_proxy"

echo -e "\n=== 仓库文件大小统计 ==="
du -sh .git
find . -maxdepth 1 -not -path '*/.*' -size +10M -exec ls -lh {} \;

echo -e "\n=== SSH 连通性 (若使用过 SSH) ==="
ssh -T git@github.com 2>&1 | head -n 1
