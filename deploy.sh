#!/bin/bash
# 部署脚本：构建站点并推送到 pages 分支
set -e

echo "🚀 构建站点..."
pnpm build

echo "📦 准备 pages 分支..."
# 创建临时目录用于存放 pages 分支内容
TMP_DIR=$(mktemp -d)
cp -r dist/* "$TMP_DIR"
cp dist/.well-known "$TMP_DIR" 2>/dev/null || true

# 切换到 pages 分支（如果存在则切换，否则创建）
if git rev-parse --verify pages > /dev/null 2>&1; then
    git checkout pages
else
    git checkout --orphan pages
    git rm -rf . 2>/dev/null || true
fi

# 清空并复制构建产物
rm -rf * .gitignore 2>/dev/null || true
cp -r "$TMP_DIR"/* .

# 添加 .gitignore（可选）
echo "node_modules/" > .gitignore

# 提交并推送
git add -A
git commit -m "deploy: $(date '+%Y-%m-%d %H:%M')"
git push origin pages --force

# 切回 main 分支
git checkout main

# 清理
rm -rf "$TMP_DIR"

echo "✅ 部署完成！"
echo "🌐 https://casumi.codeberg.page/"
