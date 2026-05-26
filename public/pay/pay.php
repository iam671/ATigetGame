<?php

$config = include __DIR__ . '/../epay.php';


$merchant_pid = $config['merchant_pid']; 
$merchant_key = $config['merchant_key']; 
$pay_url = $config['pay_url']; 

$order_no = isset($_GET['payId']) ? $_GET['payId'] : ''; 
$amount = isset($_GET['price']) ? number_format(floatval($_GET['price']), 2, '.', '') : '0.00'; 
$product_name = isset($_GET['productName']) ? $_GET['productName'] : '在线充值'; 


$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || 
             $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
$current_host = $_SERVER['HTTP_HOST']; 
$return_url = $protocol . $current_host . '/yyy';  // 动态返回地址
$notify_url = $protocol . $current_host . '/pay/notify_url.php';  // 动态通知地址

$payment_type = isset($_GET['paymentType']) ? $_GET['paymentType'] : 'wxpay'; 

$sign_data = array(
    'pid' => $merchant_pid,
    'type' => $payment_type,
    'out_trade_no' => $order_no,
    'name' => $product_name,
    'money' => $amount,
    'return_url' => $return_url,
    'notify_url' => $notify_url,
);

ksort($sign_data);
$sign_string = '';
foreach ($sign_data as $key => $value) {
    if ($value == '' || $key == 'sign') continue;
    if ($sign_string) $sign_string .= '&';
    $sign_string .= "$key=$value";
}
$sign = md5($sign_string . $merchant_key);

$sign_data['sign'] = $sign;

$query_string = http_build_query($sign_data);
$payment_url = $pay_url . '?' . $query_string;

header("Location: " . $payment_url);
exit();
?>