


<?php
// 启动会话
session_start();

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

// 检查用户是否已登录
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = null;
}

// 如果用户已登录，查询用户信息
if ($user_id) {
    // 使用预处理语句防止SQL注入
    $sql = "SELECT username, balance FROM ob_user WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $stmt->bind_result($username, $balance);
    $stmt->fetch();
    $stmt->close();
    
    // 构建头像地址
    $avatar_url = "/qq/img/" . urlencode($username) . ".jpg";
    
    // 如果头像不存在，则使用默认头像 tx.jpg
    if (!file_exists($_SERVER['DOCUMENT_ROOT'] . $avatar_url)) {
        $avatar_url = "/pay/tx.jpg";
    }
} else {
    // 用户未登录时的默认值
    $username = null;
    $balance = 0;
    $avatar_url = "/pay/tx.jpg"; 
}

// 关闭数据库连接
$conn->close();
?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>尊享充值 - 极致游戏体验</title>
    <style>
        /* 全局样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'PingFang SC', 'Helvetica Neue', Arial, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #1a2a6c, #b21f1f, #fdbb2d);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            overflow-x: hidden;
            padding: 10px; /* 添加内边距防止在小屏幕上溢出 */
        }
        
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        /* 容器样式 */
        .container {
            width: 100%;
            max-width: 500px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 20px;
            padding: 25px;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            position: relative;
            overflow: hidden;
            min-height: 90vh; /* 确保容器至少占满视口高度 */
        }
        
        /* 装饰元素 */
        .container::before, .container::after {
            content: '';
            position: absolute;
            width: 100px;
            height: 100px;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
            border-radius: 50%;
            opacity: 0.5;
        }
        
        .container::before {
            top: -25px;
            right: -25px;
        }
        
        .container::after {
            bottom: -25px;
            left: -25px;
        }
        
        /* 标题样式 */
        .header {
            margin-bottom: 25px;
        }
        
        .header h1 {
            font-size: 24px;
            font-weight: 700;
            color: #fdbb2d;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 8px;
        }
        
        .header p {
            font-size: 14px;
            opacity: 0.9;
        }
        
        /* 用户信息样式 */
        .userinfo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
            padding: 12px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            position: relative;
            overflow: hidden;
        }
        
        .userinfo::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            opacity: 0.5;
        }
        
        .avatar {
            position: relative;
            margin-right: 15px;
        }
        
        .avatar img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #fdbb2d;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
        }
        
        .userinfo-content {
            flex: 1;
        }
        
        .userinfo p {
            margin: 4px 0;
            font-size: 14px;
        }
        
        .balance {
            font-size: 18px;
            font-weight: 700;
            color: #fdbb2d;
        }
        
        /* 充值选项样式 */
        .recharge-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 12px;
            margin-bottom: 25px;
        }
        
        .recharge-btn {
            position: relative;
            overflow: hidden;
            border: none;
            border-radius: 12px;
            padding: 15px;
            font-size: 16px;
            font-weight: 700;
            color: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
            text-align: center;
            min-height: 80px; /* 确保按钮最小高度 */
        }
        
        .recharge-btn::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, rgba(255,255,255,0.1), transparent);
            transform: rotate(30deg);
            transition: all 0.5s ease;
            opacity: 0.5;
        }
        
        .recharge-btn:hover::before {
            left: 100%;
            top: -100%;
        }
        
        .recharge-btn span {
            position: relative;
            z-index: 1;
            display: block;
            transition: transform 0.3s ease;
        }
        
        .recharge-btn small {
            display: block;
            font-size: 12px;
            opacity: 0.8;
            margin-top: 4px;
        }
        
        .recharge-btn:active {
            transform: scale(0.95);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        /* 按钮颜色类 */
        .gold { background: linear-gradient(135deg, #ffd700, #ff9800); }
        .silver { background: linear-gradient(135deg, #c0c0c0, #9e9e9e); }
        .diamond { background: linear-gradient(135deg, #b9f2ff, #69f0ae); }
        
        /* 底部信息样式 */
        .footer {
            margin-top: 20px;
            font-size: 12px;
            opacity: 0.8;
            line-height: 1.5;
        }
        
        .footer a {
            color: #fdbb2d;
            text-decoration: none;
        }
        
        .footer a:hover {
            text-decoration: underline;
        }
        
        /* 响应式设计 - 针对小屏幕优化 */
        @media (max-width: 360px) {
            body {
                padding: 5px;
            }
            
            .container {
                padding: 20px;
                min-height: auto;
            }
            
            .header h1 {
                font-size: 22px;
            }
            
            .avatar img {
                width: 50px;
                height: 50px;
            }
            
            .recharge-btn {
                padding: 12px;
                font-size: 14px;
                min-height: 70px;
            }
            
            .recharge-btn span {
                font-size: 14px;
            }
            
            .recharge-btn small {
                font-size: 10px;
            }
        }
        
        /* 响应式设计 - 针对超小屏幕 */
        @media (max-width: 320px) {
            .container {
                padding: 15px;
            }
            
            .header h1 {
                font-size: 20px;
            }
            
            .header p {
                font-size: 12px;
            }
            
            .userinfo p {
                font-size: 12px;
            }
            
            .balance {
                font-size: 16px;
            }
            
            .recharge-btn {
                padding: 10px;
                min-height: 60px;
            }
            
            .recharge-btn span {
                font-size: 12px;
            }
        }

        /* 支付方式选择模态框样式 */
        .modal {
            display: none; /* 隐藏模态框 */
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            background-color: rgba(0, 0, 0, 0.7); /* 半透明背景 */
        }

        .modal-content {
            background-color: #fff;
            margin: 10% auto; /* 10% from the top and centered */
            padding: 30px;
            border-radius: 20px;
            width: 80%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            animation: modalFadeIn 0.3s ease;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .modal h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .modal-buttons {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }

        .modal-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .alipay-btn {
            background-color: #00a0e9;
            color: white;
        }

        .wxpay-btn {
            background-color: #07c160;
            color: white;
        }

        .modal-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .close-btn {
            background-color: #f4f4f4;
            color: #333;
            margin-top: 20px;
            width: 100%;
        }

        .close-btn:hover {
            background-color: #e0e0e0;
        }

        .close-modal {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 24px;
            color: #aaa;
            cursor: pointer;
        }

        /* 添加关闭按钮样式 */
        .modal-header {
            position: relative;
            margin-bottom: 20px;
        }

        .modal-header .close-modal {
            position: absolute;
            top: -40px;
            right: 0;
            font-size: 28px;
            color: #aaa;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>尊享充值</h1>
            <p>选择您心仪的充值套餐，开启极致游戏体验</p>
        </div>
        
      <div class="userinfo">
        <?php if ($user_id): ?>
            <div class="avatar">
                <img src="<?php echo htmlspecialchars($avatar_url); ?>" alt="玩家头像">
            </div>
            <div class="userinfo-content">
                <p>玩家ID: <?php echo htmlspecialchars($user_id); ?></p>
                <p>用户名: <?php echo htmlspecialchars($username); ?></p>
                <p>当前游戏币: <span class="balance"><?php echo number_format(htmlspecialchars($balance)); ?></span></p>
            </div>
            <?php else: ?>
                <p>请先登录</p>
            <?php endif; ?>
        </div>
        
        <div class="recharge-options">
            <button class="recharge-btn gold" onclick="showPaymentModal(50)">
                <span>50元</span>
            </button>
            <button class="recharge-btn silver" onclick="showPaymentModal(100)">
                <span>100元</span>
            </button>
            <button class="recharge-btn diamond" onclick="showPaymentModal(200)">
                <span>200元</span>
            </button>
            <button class="recharge-btn gold" onclick="showPaymentModal(500)">
                <span>500元</span>
            </button>
            <button class="recharge-btn silver" onclick="showPaymentModal(1000)">
                <span>1000元</span>
            </button>
            <button class="recharge-btn diamond" onclick="showPaymentModal(2000)">
                <span>2000元</span>
            </button>
        </div>
        
        <div class="footer">
            <p>客服电话：<a href="tel:400-005-1827">400-005-1827</a></p>
            <p>客服邮箱：service@game.com</p>
            <p>版权所有 © <?php echo date('Y'); ?> 欢乐水果机</p>
        </div>
    </div>

    <!-- 支付方式选择模态框 -->
    <div id="paymentModal" class="modal">
        <span class="close-modal" onclick="closePaymentModal()">&times;</span>
        <div class="modal-content">
            <div class="modal-header">
                <h2>选择支付方式</h2>
            </div>
            <div class="modal-buttons">
                <button class="modal-btn alipay-btn" onclick="confirmPayment('alipay')">支付宝</button>
                <button class="modal-btn wxpay-btn" onclick="confirmPayment('wxpay')">微信支付</button>
            </div>
            <button class="modal-btn close-btn" onclick="closePaymentModal()">取消</button>
        </div>
    </div>

  <script>
      
        let selectedAmount = 0;

       
        function showPaymentModal(amount) {
            selectedAmount = amount;
            document.getElementById('paymentModal').style.display = 'block';
        }

       
        function closePaymentModal() {
            document.getElementById('paymentModal').style.display = 'none';
            selectedAmount = 0;
        }

      
        function confirmPayment(paymentType) {
            if (selectedAmount === 0) {
                alert('请选择充值金额');
                return;
            }

         
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const day = String(now.getDate()).padStart(2, '0');
            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            const seconds = String(now.getSeconds()).padStart(2, '0');

            const formattedDateTime = `${year}${month}${day}${hours}${minutes}${seconds}`;
            const orderId = "<?php echo $user_id; ?>_" + formattedDateTime;

            // 这里不用改 去改pay.php文件中的域名即可
            const returnUrl = encodeURIComponent('http://baidu.cc');
            const notifyUrl = encodeURIComponent('http://baidu.cc');

        
            window.location.href = `/pay/pay.php?payId=${orderId}&price=${selectedAmount}&productName=${encodeURIComponent(selectedAmount + '元充值')}&paymentType=${paymentType}&returnUrl=${returnUrl}&notifyUrl=${notifyUrl}`;
        }
    </script>
</body>
</html>