import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
//022201230237王超磊
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
  ],
  resolve: {

    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  build: {
    chunkSizeWarningLimit: 1500,
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (id.includes('node_modules')) {
            return id.toString().split('node_modules/')[1].split('/')[0].toString();
            //单文件太大,分文件虽然更占用inode浪费硬盘空间,
            //但启用了并行加载的浏览器加载会更快.
            //来源:https://blog.csdn.net/sinat_36728518/article/details/123112966
          }
        }
      }
    }

  }

})
