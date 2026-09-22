<?php
// ==============================================================================
// HE Efficient and Industry Limited (E.F.T.) PHP 独立后端 API 路由
// 专为 Ubuntu + Apache + PHP + MySQL 架构打造
// 无需任何 Node.js / npm 依赖，开箱即用，双引擎支持 (JSON 数据层 + MySQL)
// ==============================================================================

header("Content-Type: application/json; charset=utf-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-API-Key");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

$rootDir = dirname(__DIR__);
$dbFile = $rootDir . '/data/database.json';
$prophotoDir = $rootDir . '/prophoto';

// 确保目录存在
if (!is_dir($rootDir . '/data')) {
    @mkdir($rootDir . '/data', 0777, true);
}
if (!is_dir($prophotoDir)) {
    @mkdir($prophotoDir, 0777, true);
}

// 辅助函数: 读取数据库
function readDb() {
    global $dbFile;
    if (file_exists($dbFile)) {
        $content = file_get_contents($dbFile);
        $data = json_decode($content, true);
        if (is_array($data)) return $data;
    }
    return [
        'products' => [],
        'news' => [],
        'inquiries' => [],
        'chats' => [],
        'config' => [],
        'introduce' => []
    ];
}

// 辅助函数: 写入数据库
function writeDb($data) {
    global $dbFile;
    $json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    return file_put_contents($dbFile, $json, LOCK_EX) !== false;
}

// 解析路由
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_SERVER['REQUEST_METHOD'];

// 获取请求体数据
$input = json_decode(file_get_contents('php://input'), true) ?? $_POST;

// 1. 健康检查
if (strpos($uri, '/api/health') !== false) {
    echo json_encode(['status' => 'ok', 'engine' => 'PHP Standalone', 'time' => date('Y-m-d H:i:s')]);
    exit;
}

// 2. 产品接口 (Products)
if (preg_match('#^/api/products(?:/(\d+))?$#', $uri, $matches)) {
    $db = readDb();
    $id = isset($matches[1]) ? (int)$matches[1] : null;

    if ($method === 'GET') {
        if ($id) {
            foreach ($db['products'] as $p) {
                if ((int)$p['id'] === $id) {
                    echo json_encode($p, JSON_UNESCAPED_UNICODE);
                    exit;
                }
            }
            http_response_code(404);
            echo json_encode(['error' => 'Product not found']);
            exit;
        } else {
            echo json_encode($db['products'] ?? [], JSON_UNESCAPED_UNICODE);
            exit;
        }
    }

    if ($method === 'POST') {
        $newId = 1;
        foreach ($db['products'] as $p) {
            if (isset($p['id']) && $p['id'] >= $newId) {
                $newId = $p['id'] + 1;
            }
        }
        $newProduct = array_merge([
            'id' => $newId,
            'cat_id' => 1,
            'cat_name' => '工业机械设备',
            'name' => '新产品',
            'subtitle' => '',
            'model_no' => 'EFT-' . rand(1000, 9999),
            'price' => '面议 / Negotiable',
            'img_url' => '/images/factory.jpg',
            'specs' => '标准工业规格',
            'is_hot' => false,
            'stock' => 100
        ], $input);
        $newProduct['id'] = $newId;
        array_unshift($db['products'], $newProduct);
        writeDb($db);
        http_response_code(201);
        echo json_encode($newProduct, JSON_UNESCAPED_UNICODE);
        exit;
    }

    if ($method === 'PUT' && $id) {
        $found = false;
        foreach ($db['products'] as &$p) {
            if ((int)$p['id'] === $id) {
                $p = array_merge($p, $input);
                $p['id'] = $id;
                $found = true;
                break;
            }
        }
        if ($found) {
            writeDb($db);
            echo json_encode(['success' => true]);
        } else {
            http_response_code(404);
            echo json_encode(['error' => 'Product not found']);
        }
        exit;
    }

    if ($method === 'DELETE' && $id) {
        $db['products'] = array_values(array_filter($db['products'], function($p) use ($id) {
            return (int)$p['id'] !== $id;
        }));
        writeDb($db);
        echo json_encode(['success' => true]);
        exit;
    }
}

// 3. 企业简介 (Introduce)
if (strpos($uri, '/api/introduce') !== false) {
    $db = readDb();
    if ($method === 'GET') {
        echo json_encode($db['introduce'] ?? [], JSON_UNESCAPED_UNICODE);
        exit;
    }
    if ($method === 'PUT' || $method === 'POST') {
        $db['introduce'] = array_merge($db['introduce'] ?? [], $input);
        writeDb($db);
        echo json_encode(['success' => true, 'introduce' => $db['introduce']]);
        exit;
    }
}

// 4. 新闻动态 (News)
if (preg_match('#^/api/news(?:/(\d+))?$#', $uri, $matches)) {
    $db = readDb();
    $id = isset($matches[1]) ? (int)$matches[1] : null;

    if ($method === 'GET') {
        if ($id) {
            foreach ($db['news'] as $n) {
                if ((int)$n['id'] === $id) {
                    echo json_encode($n, JSON_UNESCAPED_UNICODE);
                    exit;
                }
            }
            http_response_code(404);
            echo json_encode(['error' => 'News not found']);
            exit;
        } else {
            echo json_encode($db['news'] ?? [], JSON_UNESCAPED_UNICODE);
            exit;
        }
    }

    if ($method === 'POST') {
        $newId = 1;
        foreach ($db['news'] as $n) {
            if (isset($n['id']) && $n['id'] >= $newId) {
                $newId = $n['id'] + 1;
            }
        }
        $newItem = array_merge([
            'id' => $newId,
            'title' => '行业资讯',
            'summary' => '',
            'content' => '',
            'created_at' => date('Y-m-d')
        ], $input);
        $newItem['id'] = $newId;
        array_unshift($db['news'], $newItem);
        writeDb($db);
        echo json_encode($newItem, JSON_UNESCAPED_UNICODE);
        exit;
    }

    if ($method === 'PUT' && $id) {
        foreach ($db['news'] as &$n) {
            if ((int)$n['id'] === $id) {
                $n = array_merge($n, $input);
                $n['id'] = $id;
                writeDb($db);
                echo json_encode(['success' => true, 'news' => $n]);
                exit;
            }
        }
        http_response_code(404);
        echo json_encode(['error' => 'News not found']);
        exit;
    }

    if ($method === 'DELETE' && $id) {
        $db['news'] = array_values(array_filter($db['news'], function($n) use ($id) {
            return (int)$n['id'] !== $id;
        }));
        writeDb($db);
        echo json_encode(['success' => true]);
        exit;
    }
}

// 5. 询盘留言 (Inquiries)
if (strpos($uri, '/api/inquiries') !== false) {
    $db = readDb();
    if ($method === 'GET') {
        echo json_encode($db['inquiries'] ?? [], JSON_UNESCAPED_UNICODE);
        exit;
    }
    if ($method === 'POST') {
        $newId = 1;
        foreach ($db['inquiries'] as $inq) {
            if (isset($inq['id']) && $inq['id'] >= $newId) {
                $newId = $inq['id'] + 1;
            }
        }
        $inquiry = array_merge([
            'id' => $newId,
            'name' => $input['name'] ?? '访客',
            'email' => $input['email'] ?? '',
            'phone' => $input['phone'] ?? '',
            'subject' => $input['subject'] ?? '产品询盘',
            'message' => $input['message'] ?? '',
            'created_at' => date('Y-m-d H:i:s')
        ], $input);
        $inquiry['id'] = $newId;
        if (!isset($db['inquiries'])) $db['inquiries'] = [];
        array_unshift($db['inquiries'], $inquiry);
        writeDb($db);
        echo json_encode(['success' => true, 'inquiry' => $inquiry]);
        exit;
    }
}

// 6. 在线聊天 (Chats)
if (strpos($uri, '/api/chat') !== false) {
    $db = readDb();
    if (!isset($db['chats'])) $db['chats'] = [];

    if ($method === 'GET') {
        echo json_encode($db['chats'], JSON_UNESCAPED_UNICODE);
        exit;
    }

    if ($method === 'POST') {
        $userMsg = [
            'id' => 'msg_' . round(microtime(true) * 1000),
            'role' => 'user',
            'message' => $input['message'] ?? '',
            'user_email' => $input['email'] ?? '',
            'user_phone' => $input['phone'] ?? '',
            'created_at' => date('Y-m-d H:i:s')
        ];
        $botMsg = [
            'id' => 'msg_' . (round(microtime(true) * 1000) + 1),
            'role' => 'bot',
            'message' => '您好！欢迎咨询上海和益实业有限公司 (E.F.T.)。我们已收到您的留言，业务经理稍后将与您取得联系。您也可以直接致电 021-6257 8368 咨询。',
            'created_at' => date('Y-m-d H:i:s')
        ];
        $db['chats'][] = $userMsg;
        $db['chats'][] = $botMsg;
        writeDb($db);
        echo json_encode(['success' => true, 'userMessage' => $userMsg, 'botMessage' => $botMsg]);
        exit;
    }
}

// 7. 系统设置 (Config)
if (strpos($uri, '/api/config') !== false) {
    $db = readDb();
    if ($method === 'GET') {
        echo json_encode($db['config'] ?? [], JSON_UNESCAPED_UNICODE);
        exit;
    }
    if ($method === 'PUT' || $method === 'POST') {
        $db['config'] = array_merge($db['config'] ?? [], $input);
        writeDb($db);
        echo json_encode(['success' => true, 'config' => $db['config']]);
        exit;
    }
}

// 8. 默认导出 SQL 文件
if (strpos($uri, '/api/export/sql') !== false) {
    $sqlPath = $rootDir . '/backup.sql';
    if (file_exists($sqlPath)) {
        header('Content-Disposition: attachment; filename="efficientsh_database.sql"');
        readfile($sqlPath);
        exit;
    }
    echo "-- Database dump";
    exit;
}

// 默认 404
http_response_code(404);
echo json_encode(['error' => 'API route not found: ' . $uri]);
