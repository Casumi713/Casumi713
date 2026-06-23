#!/bin/bash
# 部署脚本：构建站点并推送到 pages 分支
set -e

REMOTE_URL="https://codeberg.org/Casumi/pages.git"
BUILD_DIR="/tmp/casumi-build-$$"

echo "🚀 构建站点（使用 /tmp 避免文件系统兼容问题）..."

# 复制源码到 /tmp 构建（解决 /mnt/g/ 下 pnpm 的兼容性问题）
rm -rf "$BUILD_DIR"
cp -r "$(dirname "$0")" "$BUILD_DIR"
cd "$BUILD_DIR"

# 确保虚拟存储在 /tmp
echo 'virtual-store-dir=/tmp/pnpm-virtual-store' > .npmrc
pnpm install --no-frozen-lockfile
pnpm build

echo "📦 部署到 pages 分支..."
cd /tmp
rm -rf pages-deploy
git clone --depth 1 "$REMOTE_URL" pages-deploy
cd pages-deploy
git checkout pages 2>/dev/null || git checkout --orphan pages

# 清空并复制构建产物
rm -rf * .gitignore 2>/dev/null || true
cp -r "$BUILD_DIR/dist/"* .

# 添加 .gitignore
echo "node_modules/" > .gitignore

# 提交并推送
git add -A
git commit -m "deploy: $(date '+%Y-%m-%d %H:%M')"
git push "$REMOTE_URL" pages --force

# 清理
rm -rf "$BUILD_DIR" /tmp/pages-deploy

echo "✅ 部署完成！"
echo "🌐 https://casumi.codeberg.page/"
