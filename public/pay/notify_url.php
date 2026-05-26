<?php
// 引入上级目录中的database.php配置文件
$config = include __DIR__ . '/../database.php';

// 从配置中提取数据库连接信息
$servername = $config['hostname'];     // 数据库服务器地址
$username = $config['username'];       // 数据库用户名
$password = $config['password'];       // 数据库密码
$dbname = $config['database'];         // 数据库名称

// 创建数据库连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接是否成功
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
}

// 获取并处理GET参数
$money = isset($_GET['money']) ? floatval($_GET['money']) : 0;
$out_trade_no = isset($_GET['out_trade_no']) ? $_GET['out_trade_no'] : '';
$user_id = isset($_GET['out_trade_no']) ? substr($_GET['out_trade_no'], 0, strpos($_GET['out_trade_no'], '_')) : 0;

// 验证参数
if ($user_id == 0 || $money <= 0) {
    echo "参数错误";
    exit();
}

// 执行更新操作
$sql = "UPDATE ob_user SET balance = balance + $money WHERE id = $user_id";

if ($conn->query($sql) === TRUE) {
    echo "success";
} else {
    echo "Error updating record: " . $conn->error;
}

// 关闭数据库连接
$conn->close();
?>