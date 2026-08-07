// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  server: {
    // 监听所有网络接口，允许同一局域网内的设备访问
    // 访问地址：http://<本机局域网IP>:4321
    host: true
  },
  vite: {
    plugins: [tailwindcss()]
  }
});