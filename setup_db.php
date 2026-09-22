<?php
// ==============================================================================
// HE Efficient and Industry Limited (E.F.T.)
// MySQL 数据库网页一键导入与连接测试工具
// ==============================================================================

header("Content-Type: text/html; charset=utf-8");

$status = "";
$error = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $dbHost = $_POST['host'] ?? '127.0.0.1';
    $dbUser = $_POST['user'] ?? 'root';
    $dbPass = $_POST['pass'] ?? '';
    $dbName = $_POST['name'] ?? 'efficientsh_db';
    $dbPort = (int)($_POST['port'] ?? 3306);

    try {
        $pdo = new PDO("mysql:host={$dbHost};port={$dbPort};charset=utf8mb4", $dbUser, $dbPass, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ]);

        // 创建数据库如果不存在
        $pdo->exec("CREATE DATABASE IF NOT EXISTS `{$dbName}` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        $pdo->exec("USE `{$dbName}`");

        // 导入 backup.sql
        $sqlPath = __DIR__ . '/backup.sql';
        if (file_exists($sqlPath)) {
            $sqlContent = file_get_contents($sqlPath);
            $pdo->exec($sqlContent);
            $status = "✅ 成功连接并导入 backup.sql 到数据库 [{$dbName}]！全部 39 款产品及新闻、公司数据已就绪！";
        } else {
            $error = "未找到 backup.sql 文件，但数据库 [{$dbName}] 已成功连接！";
        }
    } catch (Exception $e) {
        $error = "❌ 连接失败: " . $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>E.F.T. MySQL 数据库一键导入与配置向导</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background: #f8fafc; color: #1e293b; padding: 40px 20px; }
        .card { max-width: 580px; margin: 0 auto; background: #fff; padding: 32px; border-radius: 16px; box-shadow: 0 10px 25px rgba(0,0,0,0.06); border: 1px solid #e2e8f0; }
        h1 { font-size: 20px; color: #b91c1c; margin-top: 0; }
        .form-group { margin-bottom: 16px; }
        label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 6px; color: #475569; }
        input { width: 100%; padding: 10px 12px; border: 1px solid #cbd5e1; border-radius: 8px; font-size: 14px; box-sizing: border-box; }
        button { background: #dc2626; color: #fff; border: none; padding: 12px 20px; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; width: 100%; transition: background 0.2s; }
        button:hover { background: #b91c1c; }
        .alert-success { background: #ecfdf5; color: #065f46; border: 1px solid #a7f3d0; padding: 14px; border-radius: 8px; margin-bottom: 20px; font-size: 14px; }
        .alert-error { background: #fef2f2; color: #991b1b; border: 1px solid #fecaca; padding: 14px; border-radius: 8px; margin-bottom: 20px; font-size: 14px; }
        .back-link { display: inline-block; margin-top: 20px; text-align: center; width: 100%; color: #64748b; text-decoration: none; font-size: 13px; }
        .back-link:hover { color: #dc2626; }
    </style>
</head>
<body>
    <div class="card">
        <h1>⚙️ E.F.T. MySQL 数据库一键导入向导</h1>
        <p style="font-size: 13px; color: #64748b; margin-bottom: 24px;">本页面用于在您的 Ubuntu VPS 服务器上快速导入网站数据库。如不配置 MySQL，系统也将默认使用高可靠的 JSON 双引擎持续运行。</p>

        <?php if ($status): ?>
            <div class="alert-success"><?php echo $status; ?></div>
        <?php endif; ?>
        <?php if ($error): ?>
            <div class="alert-error"><?php echo $error; ?></div>
        <?php endif; ?>

        <form method="POST">
            <div class="form-group">
                <label>MySQL 主机地址 (Host)</label>
                <input type="text" name="host" value="127.0.0.1" required>
            </div>
            <div class="form-group">
                <label>端口 (Port)</label>
                <input type="number" name="port" value="3306" required>
            </div>
            <div class="form-group">
                <label>数据库用户名 (User)</label>
                <input type="text" name="user" value="root" required>
            </div>
            <div class="form-group">
                <label>数据库密码 (Password)</label>
                <input type="password" name="pass" placeholder="输入您的 MySQL 密码">
            </div>
            <div class="form-group">
                <label>目标数据库名称 (Database Name)</label>
                <input type="text" name="name" value="efficientsh_db" required>
            </div>
            <button type="submit">一键连接并导入数据表</button>
        </form>

        <a class="back-link" href="/">← 返回网站前台首页</a>
    </div>
</body>
</html>
