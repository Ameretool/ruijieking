// ── 全局站点配置 ──
// fork 后只需改这个文件，整个站点自动更新

export const site = {
  // 网站名称（导航栏 logo、页脚、页面标题后缀、SEO）
  name: '我的博客',

  // 默认页面标题（未指定 title 时的后备值）
  defaultTitle: '我的博客',

  // SEO 站点描述（meta description）
  description: '写代码、拍照片、记录生活。',

  // ── SEO：分享与链接 ──
  url: 'https://Ameretool.github.io/ruijieking/',            // 站点域名（必须带 https://，SEO/canonical/sitemap 依赖它）
  ogImage: '/og.png',                           // 社交分享预览图（public/og.png，建议 1200×630）
  ogSiteName: '我的博客',                      // 分享卡片上显示的站点名
  <link rel="stylesheet" href="https://org.ooo/ruijieking/_astro/BaseLayout.CiIhfANZ.css">

  // 作者信息
  author: {
    name: '你的名字',
    github: 'username',
    location: '你的城市',
  },

  // 关于页面的介绍文字
  about: '这是我的个人博客，用 Astro 构建。写代码、拍照片、记录生活。',

  // 导航栏（href + 显示文字，数组顺序即显示顺序 导航路径这里修改）
  nav: [
    { href: './talk', label: '今日说法' },
    { href: './blog', label: '文章' },
    { href: './archive', label: '归档' },
    { href: './photo', label: '照片' },
    { href: './about', label: '关于我' },
  ],
};
