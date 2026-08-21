// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';
import sitemap from '@astrojs/sitemap';
import { site } from './src/site.config';

// https://astro.build/config
export default defineConfig({
  // 站点域名统一从 site.config.ts 读取（url 留空时用占位域名）
  site: site.url || 'https://example.com',
  server: {
    // 监听所有网络接口，允许同一局域网内的设备访问
    // 访问地址：http://<本机局域网IP>:4321
    host: true
  },
  integrations: [sitemap()],
  vite: {
    plugins: [tailwindcss()]
  }
});
