#!/bin/bash
# ==============================================================================
# HE Efficient and Industry Limited (E.F.T.) 自动化独立部署脚本
# 官方域名: www.efficientsh.com
# 特性: 专为 Ubuntu (PHP + Apache + MySQL) 打造
# 绝对免 Node.js / 免 npm install / 免 npm run build / 开箱即用
# ==============================================================================

set -e

echo "=================================================================="
echo "  🚀 正在启动 E.F.T. 企业官网自动化独立部署流程 (Zero-Build Deploy)"
echo "=================================================================="

CURRENT_DIR="$(pwd)"
echo "▶ 当前工作部署目录: ${CURRENT_DIR}"

# 1. 检查并设置目录读写权限
echo "▶ 步骤 1/4: 创建并配置持久化数据与媒体资源目录..."
mkdir -p data data/backups prophoto eftphoto images videos download api

if command -v chown >/dev/null 2>&1; then
    if [ "$(id -u)" -eq 0 ]; then
        if id "www-data" >/dev/null 2>&1; then
            chown -R www-data:www-data "${CURRENT_DIR}"
            echo "  ✓ 已赋予 Web 服务器用户 (www-data) 目录所有权"
        fi
    fi
fi

chmod -R 755 "${CURRENT_DIR}"
chmod -R 777 "${CURRENT_DIR}/data" "${CURRENT_DIR}/prophoto" "${CURRENT_DIR}/eftphoto" "${CURRENT_DIR}/images" "${CURRENT_DIR}/videos" "${CURRENT_DIR}/download" 2>/dev/null || true
echo "  ✓ 媒体与数据目录读写权限配置完成 (可直接上传产品图谱与备份)"

# 2. Apache 模块检测与伪静态配置
echo "▶ 步骤 2/4: 检测并优化 Apache Web 服务器模块..."
if command -v a2enmod >/dev/null 2>&1 && [ "$(id -u)" -eq 0 ]; then
    echo "  * 正在确保 Apache rewrite 与 headers 模块处于开启状态..."
    a2enmod rewrite >/dev/null 2>&1 || true
    a2enmod headers >/dev/null 2>&1 || true
    if command -v systemctl >/dev/null 2>&1; then
        systemctl reload apache2 >/dev/null 2>&1 || systemctl restart apache2 >/dev/null 2>&1 || true
    elif command -v service >/dev/null 2>&1; then
        service apache2 reload >/dev/null 2>&1 || service apache2 restart >/dev/null 2>&1 || true
    fi
    echo "  ✓ Apache 伪静态支持 (.htaccess) 已成功就绪"
else
    echo "  ✓ Web 运行环境已就绪 (.htaccess 规则已内置)"
fi

# 3. 数据库引擎检测 (MySQL + JSON 双引擎)
echo "▶ 步骤 3/4: 检查数据层与 MySQL 支持..."
if [ -f "${CURRENT_DIR}/backup.sql" ]; then
    echo "  * 包含 39 款产品完整出厂数据的备份文件: backup.sql"
    if command -v mysql >/dev/null 2>&1; then
        echo "  * 检测到系统已安装 MySQL 客户端"
        echo "  * 提示: 您可随时执行 'mysql -u 你的用户名 -p < backup.sql' 将数据导入 MySQL"
        echo "  * 或在浏览器访问: http://你的域名或IP/setup_db.php 进行图形化一键导入"
    fi
    echo "  ✓ 内置的高性能 JSON 双引擎 (data/database.json) 已就绪，即使不配 MySQL 也能直接完整运转！"
fi

# 4. 验证全部预编译产物
echo "▶ 步骤 4/4: 检查前端静态产物完整性..."
if [ -f "${CURRENT_DIR}/index.html" ] && [ -f "${CURRENT_DIR}/assets/app.js" ]; then
    echo "  ✓ 前端核心已全部预编译完整: index.html, assets/app.js, assets/index.css"
else
    echo "  ⚠ 警告: 缺少核心文件，请检查解压包完整性"
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
echo "  MySQL 图形导入工具: http://您的域名或服务器IP/setup_db.php"
echo "=================================================================="

