#/bin/zsh
#此项目采用单页面路由构建
#用来自动构建vite build然后刷新到target静态资源
#可以实现不停止springboot的同时完成vite静态资源刷新
#仅适用于Linux系统
# rm -rf target
cd vite
# npm install
npm run build
echo "vite构建完毕"
cd ../
rm -rf src/main/resources/static
rm -rf target/classes/static
echo "旧文件清理完毕"
cp -r vite/dist src/main/resources/static
cp -r vite/dist target/classes/static
rm -rf vite/dist
echo "静态资源刷新完毕"