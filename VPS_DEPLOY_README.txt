========================================================
   HE Efficient and Industry Limited (E.F.T.)
   网站整站全功能独立部署包（免编译 / 免 npm 安装 / 开箱即用）
   官方域名: www.efficientsh.com
========================================================

尊敬的用户您好！
本部署包已预先完成全部前端生产编译 (Pre-built Assets) 与全功能 PHP+MySQL 双引擎后端封装。
您在 VPS 服务器上【绝对不需要】安装 Node.js、执行 npm install 或 npm run build！解压即用！

========================================================
【Ubuntu 系统搭载 PHP + Apache + MySQL 极速 3 步部署指南】
========================================================

【第一步：解压文件至 Apache 网站根目录】
--------------------------------------------------------
假设您的 Apache 网站根目录为 /var/www/html (或您的虚拟主机目录)：

cd /var/www/html
# 方式 1：如果您已将 www.efficientsh.com_production_ready.zip 上传至当前目录：
sudo unzip -o www.efficientsh.com_production_ready.zip

# 方式 2：也可以直接在 VPS 终端执行 wget 一键下载：
sudo wget https://ais-pre-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/www.efficientsh.com_production_ready.zip
sudo unzip -o www.efficientsh.com_production_ready.zip

【第二步：配置 Apache 与目录读写权限】
--------------------------------------------------------
# 1. 开启 Apache 的 URL 重写模块（支持前端路由与 /api 接口）：
sudo a2enmod rewrite
sudo a2enmod headers

# 2. 确保 Apache 配置文件允许 .htaccess（例如 /etc/apache2/apache2.conf 或虚拟主机配置）：
#    在 <Directory /var/www/html> 中确保：AllowOverride All
# 3. 重启 Apache 服务：
sudo systemctl restart apache2

# 4. 赋予运行用户与上传媒体目录读写权限：
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
sudo chmod -R 777 /var/www/html/data /var/www/html/prophoto /var/www/html/eftphoto /var/www/html/images /var/www/html/videos

【第三步：配置 MySQL 数据库（提供两种极简方式，任选其一）】
--------------------------------------------------------
>>> 方式 A（推荐，浏览器图形化一键向导）：
1. 打开文件 db_config.php，填入您的 MySQL 密码：
   sudo nano db_config.php
   修改第 13 行：define('DB_PASS', '您的MySQL密码'); 保存并退出。
2. 在浏览器中访问向导页面：
   http://您的服务器IP或域名/setup_db.php
   （系统将自动创建 efficientsh 数据库、全部数据表，并导入全部初始产品与配置，完全自动化！）

>>> 方式 B（终端一行命令快速导入）：
sudo mysql -u root -p < backup.sql
（系统会自动创建 efficientsh 库并导入全部表结构及最新产品数据）

--------------------------------------------------------
【网站前台与后台访问地址】
--------------------------------------------------------
- 官网前台首页：http://您的服务器IP或域名/
- 中英双语切换、德西俄葡6国语言支持
- 在线客户客服系统：右下角浮动客服对话窗口实时交互
- 外贸询盘留言表单：前台提交自动持久化至 MySQL
- 业务管理后台：http://您的服务器IP或域名/#admin
- 默认管理员通行密码：admin888 （可在后台配置中修改）

--------------------------------------------------------
【常见问题排查 (FAQ)】
--------------------------------------------------------
Q: 刚解压还没配 MySQL，前台能访问吗？
A: 可以！本站内置了智能双引擎机制（MySQL + JSON Fallback），在 MySQL 未配置完成前，系统会自动使用 data/database.json 提供完整的浏览与管理功能；配置好 MySQL 后自动无缝切换至 MySQL 高性能数据库。

Q: 为什么不需要运行 npm install 或 npm run build？
A: 压缩包根目录已放置直接可运行的 index.html 以及 assets/ 目录下的所有编译完备的纯静态 JS 和 CSS，Apache 和 PHP 可以直接向浏览器输出已编译的高效产物。
