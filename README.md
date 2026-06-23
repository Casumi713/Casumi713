# 🌸 Casumi's Nest

[![Node.js >= 20](https://img.shields.io/badge/node.js-%3E%3D20-brightgreen)](https://nodejs.org)
[![pnpm >= 9](https://img.shields.io/badge/pnpm-%3E%3D9-blue)](https://pnpm.io)
[![Astro](https://img.shields.io/badge/Astro-5.x-orange)](https://astro.build)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Codeberg Pages](https://img.shields.io/badge/Codeberg-Pages-2185d0)](https://codeberg.org/Casumi/pages)

> ✨ 在代码和二次元之间反复横跳 ✨

基于 **Astro** + **Mizuki 主题** 的个人博客，部署在 **Codeberg Pages**。粉色二次元风格，支持追番、相册、日记、项目展示等功能。

🔗 **在线地址**: [https://casumi.codeberg.page/](https://casumi.codeberg.page/)

---

## 📖 项目结构

```
Casumi-Blog/
│
├── .forgejo/workflows/       ← Codeberg CI/CD 部署配置
├── public/                   ← 静态资源
│   ├── assets/
│   │   ├── desktop-banner/   ← PC 端横幅轮播图
│   │   ├── mobile-banner/    ← 手机端横幅轮播图
│   │   ├── music/            ← 音乐播放器曲目
│   │   └── js/               ← 第三方 JS 脚本
│   ├── favicon/              ← 网站图标
│   └── images/               ← 相册与日记图片
│
├── src/                      ← ⭐ 核心源码
│   ├── config.ts             # 📝 主要配置文件（站点信息、主题色、导航等）
│   │
│   ├── content/              # 📝 博客内容（Markdown）
│   │   ├── posts/            ← 博客文章（.md 文件，每篇一篇）
│   │   └── spec/             ← 特殊页面（关于、友链等）
│   │
│   ├── pages/                ← 路由页面
│   │   ├── anime.astro       ← 追番列表数据（这里改）
│   │   ├── friends.astro     ← 友链卡片数据（这里改）
│   │   ├── diary.astro       ← 日记页面
│   │   ├── albums.astro      ← 相册页面
│   │   ├── projects.astro    ← 项目展示
│   │   ├── skills.astro      ← 技能展示
│   │   └── timeline.astro    ← 时间线
│   │
│   ├── data/                 ← 结构化数据
│   │   ├── projects.ts       ← 项目数据
│   │   ├── skills.ts         ← 技能数据
│   │   ├── timeline.ts       ← 时间线数据
│   │   └── albums.ts         ← 相册数据
│   │
│   ├── components/           ← UI 组件
│   ├── layouts/              ← 页面布局
│   ├── i18n/                 ← 多语言翻译（中/日/英）
│   └── styles/               ← CSS 样式文件
│
├── deploy.sh                 # 🚀 一键部署脚本
├── astro.config.mjs          ← Astro 构建配置
├── tailwind.config.cjs       ← Tailwind CSS 配置
└── package.json              ← 依赖管理
```

---

## ✨ 功能特性

| 功能 | 说明 | 配置位置 |
|------|------|----------|
| 🏠 **个人主页** | 横幅轮播 + 打字机效果 | `src/config.ts` |
| 📝 **博客系统** | Markdown 文章 + 标签分类 | `src/content/posts/` |
| 🎬 **追番列表** | 动漫追踪 + 评分 + 进度 | `src/pages/anime.astro` |
| 📸 **相册图库** | PhotoSwipe 图片浏览 | `src/data/albums.ts` |
| 📔 **日记页面** | 日常碎碎念 | `src/pages/diary.astro` |
| 👥 **友链卡片** | 交换友情链接 | `src/pages/friends.astro` |
| 📊 **技能展示** | 技能等级分布 | `src/data/skills.ts` |
| 🗺 **时间线** | 学习/工作经历 | `src/data/timeline.ts` |
| 🎯 **项目展示** | 作品项目集 | `src/data/projects.ts` |
| 🌐 **多语言** | 中/日/英 + Edge 翻译 | `src/i18n/` |
| 🔍 **全文搜索** | Pagefind 离线搜索 | — |
| 🌸 **樱花特效** | Canvas 飘落花瓣 | `src/config.ts` |
| ✨ **粒子特效** | 碧蓝档案风格火花 | `src/components/BASpark.astro` |
| 🎵 **音乐播放器** | 背景音乐播放 | `public/assets/music/` |
| 📡 **RSS 订阅** | 自动生成 RSS Feed | 自动生成 |
| 🌓 **明暗主题** | 跟随系统 + 手动切换 | 内置 |

---

## 🚀 快速开始

### 前置要求

- **Node.js** >= 20
- **pnpm** >= 9（如未安装：`npm install -g pnpm`）

### 本地开发

```bash
# 1. 克隆仓库
git clone https://codeberg.org/Casumi/pages.git
cd pages

# 2. 安装依赖
pnpm install

# 3. 启动开发服务器
pnpm dev
# → 浏览器访问 http://localhost:4321

# 4. 构建生产版本
pnpm build
# → 输出到 dist/
```

### 常用命令

| 命令 | 作用 |
|------|------|
| `pnpm dev` | 启动本地开发服务器 |
| `pnpm build` | 构建生产站点到 `dist/` |
| `pnpm preview` | 本地预览构建结果 |
| `pnpm check` | 运行 Astro 类型检查 |
| `pnpm new-post <标题>` | 创建新博客文章 |
| `bash deploy.sh` | **一键构建并部署到 Codeberg Pages** |

---

## 🎨 自定义指南

### 主题色

在 `src/config.ts` 中找到 `themeColor.hue`：

```typescript
themeColor: { hue: 330 }  // 0=红 120=绿 200=蓝 330=粉 345=粉红
```

### 横幅文字

```typescript
homeText: {
  title: "✨ Casumi's Nest ✨",
  subtitle: ["🌸 编程 · 动漫 · 日常 🌸", "🎮 ..."],
}
```

### 个人资料

```typescript
profileConfig: {
  name: "Casumi",
  bio: "✨ 在代码和二次元之间反复横跳 ✨",
  avatar: "assets/images/avatar.gif",
}
```

### 社交链接

在 `profileConfig.links` 中添加/修改：

```typescript
links: [
  { name: "GitHub", icon: "fa6-brands:github", url: "https://github.com/..." },
  { name: "Codeberg", icon: "fa6-brands:git", url: "https://codeberg.org/..." },
]
```

### 头像

替换 `src/assets/images/` 下的图片文件，然后更新 `config.ts` 中的 `avatar` 路径。

### 横幅图片

- PC 端：替换 `public/assets/desktop-banner/1.webp` ~ `6.webp`
- 手机端：替换 `public/assets/mobile-banner/1.webp` ~ `6.webp`
- 建议尺寸：1920×1080（桌面）、1080×1920（移动）
- 格式：`.webp`（可用在线工具转换）

---

## 📝 写博客

在 `src/content/posts/` 下创建 `.md` 文件：

```markdown
---
title: "文章标题"
description: "文章描述，用于摘要显示"
published: 2026-06-23
tags: ["技术", "Astro"]
category: "技术"
draft: false
---

正文内容支持标准 Markdown 语法。

> [!NOTE]
> 支持这种提示框

::github{repo="user/repo"}  ← 嵌入 GitHub 仓库卡片

$行内数学公式$ 和 $$块级数学公式$$

支持 KaTeX、Mermaid 图表、代码高亮等。
```

---

## 🚢 部署

### 自动部署（当前方式）

项目使用 **`deploy.sh`** 来部署：

```bash
bash deploy.sh
```

脚本会自动：
1. 执行 `pnpm build` 构建站点
2. 将 `dist/` 推送到 `pages` 分支
3. Codeberg Pages 自动更新

### Forgejo Actions（可选）

项目已包含 `.forgejo/workflows/deploy.yml`，启用 Actions 后可实现推送即部署。

---

## 📄 许可证

本项目基于 **MIT License**，基于以下开源项目：

- [Mizuki-astro](https://github.com/yokiusagi55/Mizuki-astro) — 二次元风格 Astro 主题
- [Fuwari](https://github.com/saicaca/fuwari) — 原始模板
- [BASpark](https://github.com/DoomVoss/BASpark) — 粒子特效
- [Astro](https://astro.build) — 静态站点框架
- [Tailwind CSS](https://tailwindcss.com) — CSS 框架
