# HE Efficient and Industry Limited (E.F.T.)
# 官方外贸官网 Ubuntu VPS (Apache + PHP + MySQL) 独立部署指南

## 核心特性
- **绝对免编译**：无需安装 Node.js，无需执行 `npm install`，无需执行 `npm run build`！
- **开箱即用**：全套静态资源、图片库、PHP 接口引擎、数据库备份均已完全预先打包。
- **极简部署**：一键执行 `bash deploy.sh` 即可上线！

---

## 快速部署步骤（仅需 3 步，30秒完成）

### 步骤 1：上传并解压到您的 Web 根目录
假定您的 Apache 网站根目录为 `/var/www/html`（或虚拟主机目录）：
```bash
# 进入网站目录
cd /var/www/html

# 下载完整生产部署包（直接使用为您生成的全量包）
# 或者通过 WinSCP / FileZilla / FTP 直接将下载的 zip 包上传到此处

# 解压部署包
unzip -o www.efficientsh.com_production_ready.zip
```

### 步骤 2：执行一键部署脚本
```bash
sudo bash deploy.sh
```
*此脚本会自动配置 Apache 伪静态 rewrite 模块、配置文件夹读写权限（777/755）。*

### 步骤 3：访问并登录系统
- **前台官网**：直接在浏览器输入 `http://您的服务器IP或域名/`
- **后台管理**：访问 `http://您的服务器IP或域名/#admin`
- **默认管理员密码**：`admin888`（登录后可在后台随时修改）
- **MySQL 导入（可选）**：访问 `http://您的服务器IP或域名/setup_db.php` 可图形化一键导入 39 款产品及数据，亦可直接使用内置的高性能 JSON 数据引擎，无需强求配置 MySQL。

---

## Apache 虚拟主机配置参考（可选）
如果您在 `/etc/apache2/sites-available/efficientsh.conf` 配置专属域名，可参考以下标准配置：

```apache
<VirtualHost *:80>
    ServerName www.efficientsh.com
    ServerAlias efficientsh.com
    DocumentRoot /var/www/html

    <Directory /var/www/html>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/efficientsh_error.log
    CustomLog ${APACHE_LOG_DIR}/efficientsh_access.log combined
</VirtualHost>
```

配置完成后执行：
```bash
sudo a2enmod rewrite headers
sudo a2ensite efficientsh.conf
sudo systemctl reload apache2
```
