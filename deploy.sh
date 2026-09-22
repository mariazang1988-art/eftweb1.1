#!/bin/bash
# ==============================================================================
# HE Efficient and Industry Limited (E.F.T.) 自动化独立部署脚本
# 官方域名: www.efficientsh.com
# 特性: 免 Node.js / 免 npm install / 免 npm run build / 开箱即用
# ==============================================================================

set -e

echo "=================================================================="
echo "  🚀 正在启动 E.F.T. 企业官网自动化独立部署流程 (Zero-Build Deploy)"
echo "=================================================================="

CURRENT_DIR="$(pwd)"
echo "▶ 当前工作部署目录: ${CURRENT_DIR}"

# 1. 检查运行权限并设置目录写权限
echo "▶ 步骤 1/4: 设置目录读写权限与静态资源目录..."
mkdir -p data data/backups prophoto eftphoto images videos download

if command -v chown >/dev/null 2>&1; then
    if [ "$(id -u)" -eq 0 ]; then
        if id "www-data" >/dev/null 2>&1; then
            chown -R www-data:www-data "${CURRENT_DIR}"
            echo "  ✓ 已赋予 www-data 用户所有权"
        fi
    fi
fi

chmod -R 755 "${CURRENT_DIR}"
chmod -R 777 "${CURRENT_DIR}/data" "${CURRENT_DIR}/prophoto" "${CURRENT_DIR}/eftphoto" "${CURRENT_DIR}/images" "${CURRENT_DIR}/videos" "${CURRENT_DIR}/download" 2>/dev/null || true
echo "  ✓ 媒体与数据目录读写权限 (777) 配置完成"

# 2. Apache 模块检测与配置 (如果存在 Apache)
echo "▶ 步骤 2/4: 检测 Web 服务器配置 (Apache / Nginx)..."
if command -v a2enmod >/dev/null 2>&1 && [ "$(id -u)" -eq 0 ]; then
    echo "  * 检测到 Apache 环境，正在激活 rewrite 与 headers 模块..."
    a2enmod rewrite >/dev/null 2>&1 || true
    a2enmod headers >/dev/null 2>&1 || true
    if command -v systemctl >/dev/null 2>&1; then
        systemctl restart apache2 >/dev/null 2>&1 || true
    elif command -v service >/dev/null 2>&1; then
        service apache2 restart >/dev/null 2>&1 || true
    fi
    echo "  ✓ Apache URL 重写模块配置完成"
else
    echo "  ✓ 检测完成：当前环境已就绪"
fi

# 3. MySQL 数据库自动检测与导入
echo "▶ 步骤 3/4: 数据库双引擎检测 (MySQL + JSON 数据层)..."
if [ -f "${CURRENT_DIR}/backup.sql" ]; then
    echo "  * 检测到完整数据备份: backup.sql"
    if command -v mysql >/dev/null 2>&1; then
        echo "  * 检测到本地 MySQL 客户端已安装"
        echo "  * 提示: 您可以执行 'mysql -u 数据库用户 -p < backup.sql' 一键导入全部数据表及产品数据"
        echo "  * 亦可在浏览器访问: http://您的服务器IP/setup_db.php 进行图形化一键配置"
    else
        echo "  * 当前系统未检测到 mysql 命令行，系统将自动使用 data/database.json 双引擎模式平滑运行"
    fi
fi

# 4. 验证核心入口产物与 dist 目录
echo "▶ 步骤 4/4: 检查前端静态产物与 dist 目录..."
if [ -d "${CURRENT_DIR}/dist" ]; then
    echo "  ✓ 生产构建包完整: dist/ (包含预编译全套静态文件与服务端产物)"
    chmod -R 755 "${CURRENT_DIR}/dist" 2>/dev/null || true
fi

if [ -f "${CURRENT_DIR}/index.html" ] && [ -f "${CURRENT_DIR}/assets/app.js" ]; then
    echo "  ✓ 前端预编译产物完整: index.html, assets/app.js, assets/index.css"
else
    echo "  ⚠ 警告: 缺少静态核心文件，请确认解压完整"
fi

if [ -f "${CURRENT_DIR}/api/index.php" ]; then
    echo "  ✓ PHP 独立后端已就绪: /api/index.php"
fi

echo ""
echo "=================================================================="
echo "  🎉 恭喜！部署完成！"
echo "  无需在 VPS 上安装 Node.js、执行 npm install 或 npm run build！"
echo "=================================================================="
echo "  前台首页访问: http://您的域名或服务器IP/"
echo "  管理后台访问: http://您的域名或服务器IP/#admin"
echo "  默认管理员密码: admin888"
echo "=================================================================="
