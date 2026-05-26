<?php
//文件格式
header("Content-type: text/html; charset=utf-8");
//错误级别
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
//初始化
ini_set('display_errors', '1');
//定义web根目录
define('WWW_ROOT', dirname(__FILE__) . DIRECTORY_SEPARATOR);
$runtimePath = str_replace(DIRECTORY_SEPARATOR . 'public', DIRECTORY_SEPARATOR . 'runtime', WWW_ROOT);
//定义后台名称
$config = [
    'siteName' => "水果机",
    'siteVersion' => "V1.0",
    'runtimePath' => $runtimePath,
];
//错误信息
$msg = '';
//安装文件
$lockFile = "." . DIRECTORY_SEPARATOR . "install.lock";
//数据库配置文件路径
$mainDatabaseConfigFile = "../application" . DIRECTORY_SEPARATOR . "database.php";  // 主配置文件路径
$currentDatabaseConfigFile = __DIR__ . DIRECTORY_SEPARATOR . "database.php";      // 当前目录配置文件路径
$epayConfigFile = __DIR__ . DIRECTORY_SEPARATOR . "epay.php";                    // 支付配置文件路径

session_start();

// 判断文件或目录是否有写的权限
function is_really_writable($file)
{
    if (DIRECTORY_SEPARATOR === '/' and @ ini_get("safe_mode") == false) {
        return is_writable($file);
    }
    if (!is_file($file) or ($fp = @fopen($file, "r+")) === false) {
        return false;
    }
    fclose($fp);
    return true;
}

if (is_file($lockFile)) {
    $msg = "当前已经安装{$config['siteName']}，如果需要重新安装，请手动移除/install.lock文件";
}

// 同意协议页面
if (@!isset($_GET['s']) || @$_GET['s'] === 'step1') {
    require_once './install/step1.html';
}

// 检测环境页面
if (@$_GET['s'] === 'step2') {
    if (version_compare(PHP_VERSION, '7.2.0', '<')) {
        $msg = "当前版本(" . PHP_VERSION . ")过低，请使用PHP7.2.0以上版本";
    } else {
        if (!extension_loaded("PDO")) {
            $msg = "当前未开启PDO，无法进行安装";
        } else {
            // 检查主配置文件是否可写
            if (!is_really_writable($mainDatabaseConfigFile)) {
                $open_basedir = ini_get('open_basedir');
                if ($open_basedir) {
                    $dirArr = explode(PATH_SEPARATOR, $open_basedir);
                    if ($dirArr && in_array(__DIR__, $dirArr)) {
                        $msg = '当前服务器因配置了open_basedir，导致无法读取父目录<br>';
                    }
                }
                if (!$msg) {
                    $msg = '当前权限不足，无法写入配置文件application/database.php<br>';
                }
            }
        }
    }
    require_once './install/step2.html';
}

// 安装
if (@$_GET['s'] === 'step3') {
    if ($_GET['s'] === 'step3' && $_SERVER['REQUEST_METHOD'] === 'GET') {
        require_once './install/step3.html';
    }
    
    if ($_GET['s'] === 'step3' && isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'POST') {
        if ($msg) {
            echo $msg;
            exit;
        }
        
        // 执行安装
        $host = isset($_POST['hostname']) ? $_POST['hostname'] : '127.0.0.1';
        $port = isset($_POST['port']) ? $_POST['port'] : '3306';
        
        // 判断是否在主机头后面加上了端口号
        $hostData = explode(":", $host);
        if (isset($hostData) && $hostData && is_array($hostData) && count($hostData) > 1) {
            $host = $hostData[0];
            $port = $hostData[1];
        }
        
        // mysql的账户相关
        $mysqlUserName = isset($_POST['username']) ? $_POST['username'] : 'root';
        $mysqlPassword = isset($_POST['password']) ? $_POST['password'] : 'root';
        $mysqlDatabase = isset($_POST['database']) ? $_POST['database'] : 'root';
        
        // 支付接口配置（如果用户选择了配置）
        $merchant_pid = isset($_POST['merchant_pid']) ? trim($_POST['merchant_pid']) : '';
        $merchant_key = isset($_POST['merchant_key']) ? trim($_POST['merchant_key']) : '';
        $pay_url = isset($_POST['pay_url']) ? trim($_POST['pay_url']) : '';
        $config_epay = isset($_POST['config_epay']) ? true : false;
        
        // php 版本
        if (version_compare(PHP_VERSION, '7.2.0', '<')) {
            die("当前版本(" . PHP_VERSION . ")过低，请使用PHP7.2.0以上版本");
        }
        
        if (!extension_loaded("PDO")) {
            die ("当前未开启PDO，无法进行安装");
        }
        
        // 检测能否读取安装文件
        $sql = @file_get_contents(WWW_ROOT . DIRECTORY_SEPARATOR . "install" . DIRECTORY_SEPARATOR . 'app.sql');
        if (!$sql) {
            throw new Exception("无法读取/install/app.sql文件，请检查是否有读权限");
        }
        
        try {
            // 连接数据库
            $link = @new mysqli("{$host}:{$port}", $mysqlUserName, $mysqlPassword);
            $error = $link->connect_error;
            if (!is_null($error)) {
                // 转义防止和alert中的引号冲突
                $error = addslashes($error);
                exit("数据库链接失败:$error");
            }
            
            $link->query('set global wait_timeout=2147480');
            $link->query("set global interactive_timeout=2147480");
            $link->query("set global max_allowed_packet=104857600");
            $link->query("SET NAMES 'utf8mb4'");
            
            if ($link->server_info < 5.5) {
                exit("MySQL数据库版本不能低于5.5,请将您的MySQL升级到5.5及以上");
            }
            
            // 创建数据库并选中
            if (!$link->select_db($mysqlDatabase)) {
                $create_sql = 'CREATE DATABASE IF NOT EXISTS ' . $mysqlDatabase . ' DEFAULT CHARACTER SET utf8mb4;';
                $link->query($create_sql) or exit('创建数据库失败');
                $link->select_db($mysqlDatabase);
            }
            
            $link->query("USE `{$mysqlDatabase}`");//使用数据库
            
            // 写入数据库
            $sqlArr = file(WWW_ROOT . DIRECTORY_SEPARATOR . "install" . DIRECTORY_SEPARATOR . 'app.sql');
            $sql = '';
            
            foreach ($sqlArr as $value) {
                if (substr($value, 0, 2) == '--' || $value == '' || substr($value, 0, 2) == '/*') {
                    continue;
                }
                
                $sql .= $value;
                
                if (substr(trim($value), -1, 1) == ';' and $value != 'COMMIT;') {
                    $sql = str_ireplace('INSERT INTO ', 'INSERT IGNORE INTO ', $sql);
                    
                    try {
                        $link->query($sql);
                    } catch (\PDOException $e) {
                        exit($e->getMessage());
                    }
                    
                    $sql = '';
                }
            }
            
            sleep(2);
            
            // 生成数据库配置
            $configContent = <<<Fun
<?php

return [
    // 数据库类型
    'type'            => 'mysql',
    // 服务器地址
    'hostname'        => '{$host}',
    // 数据库名
    'database'        => '{$mysqlDatabase}',
    // 用户名
    'username'        => '{$mysqlUserName}',
    // 密码
    'password'        => '{$mysqlPassword}',
    // 端口
    'hostport'        => '{$port}',
    // 连接dsn
    'dsn'             => '',
    // 数据库连接参数
    'params'          => [],
    // 数据库编码默认采用utf8
    'charset'         => 'utf8',
    // 数据库表前缀
    'prefix'          => 'ob_',
    // 数据库调试模式
    'debug'           => true,
    // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
    'deploy'          => 0,
    // 数据库读写是否分离 主从式有效
    'rw_separate'     => false,
    // 读写分离后 主服务器数量
    'master_num'      => 1,
    // 指定从服务器序号
    'slave_no'        => '',
    // 是否严格检查字段是否存在
    'fields_strict'   => true,
    // 数据集返回类型
    'resultset_type'  => 'array',
    // 自动写入时间戳字段
    'auto_timestamp'  => false,
    // 时间字段取出后的默认时间格式
    'datetime_format' => 'Y-m-d H:i:s',
    // 是否需要进行SQL性能分析
    'sql_explain'     => false,
];

Fun;

            // 写入主配置文件
            $putMainConfig = @file_put_contents($mainDatabaseConfigFile, $configContent);
            if (!$putMainConfig) {
                exit('安装失败、请确定application/database.php是否有写入权限！:' . $error);
            }
            
            // 写入当前目录配置文件
            $putCurrentConfig = @file_put_contents($currentDatabaseConfigFile, $configContent);
            if (!$putCurrentConfig) {
                // 如果当前目录写入失败，可以选择继续或报错
                // 这里选择继续安装，但记录警告
                $msg .= "警告：无法写入当前目录的database.php文件，路径：{$currentDatabaseConfigFile}\n";
            }
            
            // 如果用户选择了配置支付接口，则写入支付配置文件
            if ($config_epay && !empty($merchant_pid) && !empty($merchant_key) && !empty($pay_url)) {
                $epayConfigContent = <<<Fun
<?php

return [
    // 商户ID
    'merchant_pid' => '{$merchant_pid}',
    // 商户秘钥
    'merchant_key' => '{$merchant_key}',
    // 支付接口地址
    'pay_url' => '{$pay_url}',
];

Fun;

                $putEpayConfig = @file_put_contents($epayConfigFile, $epayConfigContent);
                if (!$putEpayConfig) {
                    $msg .= "警告：无法写入支付配置文件epay.php，请确保当前目录有写入权限！\n";
                }
            }
            
            // 写入安装锁文件
            $result = @file_put_contents($lockFile, 'ok');
            if (!$result) {
                exit("安装失败、请确定install.lock是否有写入权限！:$error");
            }
            
        } catch (\Exception $e) {
            $errMsg = $e->getMessage();
        }
        
        $_SESSION['backend'] = '';
        echo $msg = 'success|';
        if (!empty($msg)) {
            echo $msg;
        }
        exit();
        echo $errMsg;
        exit();
    }
}

// 完成安装
if (@$_GET['s'] === 'step4') {
    require_once './install/step4.html';
}

function curl_request($url, $post = '', $referer = '', $cookie = '', $returnCookie = 0, $ua = 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0') {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_USERAGENT, $ua);
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
    curl_setopt($curl, CURLOPT_TIMEOUT, 60);
    curl_setopt($curl, CURLOPT_REFERER, $referer);
    // 禁用SSL验证
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
    $httpheader[] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8";
    $httpheader[] = "Accept-Encoding:gzip, deflate";
    $httpheader[] = "Accept-Language:zh-CN,zh;q=0.9";
    $httpheader[] = "Connection:close";
    curl_setopt($curl, CURLOPT_HTTPHEADER, $httpheader);
    
    if ($post) {
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post));
    }
    
    if ($cookie) {
        curl_setopt($curl, CURLOPT_COOKIE, $cookie);
    }
    
    curl_setopt($curl, CURLOPT_HEADER, $returnCookie);
    curl_setopt($curl, CURLOPT_TIMEOUT, 10);
    curl_setopt($curl, CURLOPT_ENCODING, "gzip");
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    
    $data = curl_exec($curl);
    
    if (curl_errno($curl)) {
        return curl_error($curl);
    }
    
    curl_close($curl);
    
    if ($returnCookie) {
        list($header, $body) = explode("\r\n\r\n", $data, 2);
        preg_match_all("/Set\-Cookie:([^;]*);/", $header, $matches);
        $info['cookie'] = substr($matches[1][1], 1);
        $info['content'] = $body;
        return $info;
    } else {
        return $data;
    }
}
?>