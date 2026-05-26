<?php
function get_qq_info($qqCode) {
    // 构建新的头像URL
    $avatarUrl = 'http://q2.qlogo.cn/headimg_dl?dst_uin=' . $qqCode . '&spec=100';
    
    // 下载头像并保存到当前目录下的img目录
    $avatarData = downloadAvatar($avatarUrl);
    if ($avatarData) {
        $avatarPath = __DIR__ . '/img/' . $qqCode . '.jpg'; // 保存路径
        file_put_contents($avatarPath, $avatarData); // 保存文件，如果存在则覆盖
    } else {
        return null; // 如果头像下载失败，则返回null
    }

    // 由于新接口不提供昵称信息，我们这里假设昵称为null或者从其他地方获取
    $nickname = null; // 或者你可以通过其他方式获取昵称

    return [
        'nickname' => $nickname,
        'avatarPath' => '/img/' . $qqCode . '.jpg' // 返回保存的头像文件相对路径
    ];
}

function downloadAvatar($url) {
    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    
    $data = curl_exec($curl);
    curl_close($curl);
    
    return $data;
}

// 确保img目录存在
if (!is_dir(__DIR__ . '/img')) {
    mkdir(__DIR__ . '/img', 0777, true);
}

// 检查是否提供了'qq'参数
if (isset($_GET['qq'])) {
    $qqCode = $_GET['qq'];
    $qqInfo = get_qq_info($qqCode);
    
    if ($qqInfo) {
        // 返回JSON格式的昵称和头像文件相对路径
        header('Content-Type: application/json');
        echo json_encode($qqInfo, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    } else {
        // 返回错误信息
        header('Content-Type: application/json');
        echo json_encode(['error' => '无法获取QQ头像'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    }
} else {
    // 返回错误信息：未提供QQ号码
    header('Content-Type: application/json');
    echo json_encode(['error' => '未提供QQ号码'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
}
?>