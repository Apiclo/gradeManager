#/bin/zsh
#022201230237 wcl
#自动编译并运行springboot
#自动替换vite静态资源
#仅适用于Linux系统

rm -rf target
./mvnw clean -f pom.xml
echo "已清理完毕"
./mvnw install -f pom.xml
./mvnw compile -f pom.xml
echo "maven 命令执行完毕"
cd vite
npm install
npm run build
echo "vite静态资源构建完毕"
cd ../
rm -rf src/main/resources/static
rm -rf target/classes/static
cp -r vite/dist src/main/resources/static
cp -r vite/dist target/classes/static
rm -rf vite/dist
echo "vite静态资源替换完毕"

./mvnw spring-boot:run
echo "已终止运行"