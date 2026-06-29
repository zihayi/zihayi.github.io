# Personal Tech Blog

一个基于 GitHub Pages 和 Jekyll 的轻量个人技术博客模板。

## 目录说明

- `_posts/`: 正式文章，文件名格式为 `YYYY-MM-DD-title.md`
- `_notes/`: Markdown 笔记，适合记录短内容
- `_layouts/`: 页面布局模板
- `assets/css/style.css`: 浅色精简样式
- `index.md`: 首页
- `posts.md`: 文章列表页
- `notes.md`: 笔记列表页
- `about.md`: 关于页

## 发布到 GitHub Pages

1. 新建仓库，仓库名使用 `<your-github-username>.github.io`。
2. 把本目录内容放到仓库根目录。
3. 推送到 GitHub。
4. 在仓库 `Settings > Pages` 中选择 `GitHub Actions` 发布。

如果使用项目仓库而不是用户站点仓库，请在 `_config.yml` 中把 `baseurl` 改成 `"/repo-name"`。

## 新建文章

在 `_posts/` 下创建 Markdown 文件：

```text
2026-06-29-my-post.md
```

文件开头写 front matter：

```yaml
---
title: 文章标题
description: 简短摘要
date: 2026-06-29
tags: [engineering]
---
```

文章图片可以放在同目录的同名 `.assets` 文件夹里，例如：

```text
_posts/2026-06-29-welcome.md
_posts/2026-06-29-welcome.assets/image.png
```

然后在 Markdown 中直接使用相对路径：

```markdown
![图片说明](./2026-06-29-welcome.assets/image.png)
```

## 新建笔记

在 `_notes/` 下创建任意 Markdown 文件：

```text
linux-commands.md
```

文件开头写 front matter：

```yaml
---
title: Linux 常用命令
description: 日常命令速查
date: 2026-06-29
---
```

笔记图片也可以使用同名 `.assets` 文件夹，例如 `_notes/linux-commands.assets/image.png`，并在笔记中写 `![图片说明](./linux-commands.assets/image.png)`。
