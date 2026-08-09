// ── 全局站点配置 ──
// fork 后只需改这个文件，整个站点自动更新

export const site = {
  // 网站名称（导航栏 logo、页脚、页面标题后缀、SEO）
  name: 'ruijieking',

  // 默认页面标题（未指定 title 时的后备值）
  defaultTitle: 'ruijieking的博客',

  // SEO 站点描述（meta description）
  description: '写代码、拍照片、记录生活。',

  // ── SEO：分享与链接 ──
  url: '',                                    // 站点域名（暂无，先留空，有域名后填 https://xxx.com）
  ogImage: '/wallpaper/light/默认light.png',   // 社交分享预览图（默认 light 壁纸，1200×630 最佳）
  ogSiteName: 'ruijieking',                   // 分享卡片上显示的站点名
  canonical: '/',                         // 规范化链接（暂定文章页，之后可改为首页）

  // 作者信息
  author: {
    name: 'ruijieking',
    github: 'ruijieking',
    location: '深圳 / 远程',
  },

  // 关于页面的介绍文字
  about: '这里是 ruijieking 的个人博客。写代码、拍照片、记录生活。',

  // 导航栏（href + 显示文字，数组顺序即显示顺序）
  nav: [
    { href: '/talk', label: '今日说法' },
    { href: '/blog', label: '文章' },
    { href: '/archive', label: '归档' },
    { href: '/photo', label: '照片' },
    { href: '/about', label: '关于我' },
  ],
};
