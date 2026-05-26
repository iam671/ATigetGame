<?php
/*
 严禁反编译、逆向等任何形式的侵权行为，违者将追究法律责任
*/

use think\Db;
use think\Request;

if (!function_exists('iphone')) {
	function iphone()
	{
		$userAgent = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';
		if ($userAgent === '') {
			return 'Unknown';
		}

		if (preg_match('/iPhone|iPad|iPod/i', $userAgent)) {
			return 'IPhone';
		}

		if (preg_match('/HUAWEI|HONOR/i', $userAgent)) {
			return '华为';
		}

		if (preg_match('/Windows NT|Macintosh|X11|Linux x86_64/i', $userAgent)) {
			return 'PC浏览器';
		}

		if (preg_match('/OPPO/i', $userAgent)) {
			return 'OPPO';
		}

		if (preg_match('/VIVO/i', $userAgent)) {
			return 'VIVO';
		}

		if (preg_match('/Xiaomi/i', $userAgent)) {
			return 'Xiaomi';
		}

		if (preg_match('/Redmi/i', $userAgent)) {
			return 'Redmi';
		}

		if (preg_match('/SM-[A-Z0-9-]+/i', $userAgent)) {
			return 'Samsung';
		}

		if (preg_match('/Pixel/i', $userAgent)) {
			return 'Pixel';
		}

		if (preg_match('/HarmonyOS/i', $userAgent)) {
			return 'HarmonyOS';
		}

		if (preg_match('/Windows Phone/i', $userAgent)) {
			return 'Windows Phone';
		}

		if (preg_match('/Android/i', $userAgent)) {
			return 'Android';
		}

		return substr($userAgent, 0, 20);
	}
}

if (!function_exists('user_log')) {
	function user_log($remark = '')
	{
		$request = Request::instance();
		$userInfo = session('user_info');

		$data = [
			'user_id'     => isset($userInfo['id']) ? (int) $userInfo['id'] : 0,
			'username'    => isset($userInfo['username']) ? (string) $userInfo['username'] : '',
			'useragent'   => substr($request->server('HTTP_USER_AGENT', ''), 0, 255),
			'ip'          => $request->ip(),
			'url'         => substr($request->url(true), 0, 255),
			'method'      => $request->method(),
			'type'        => $request->isAjax() ? 'ajax' : 'html',
			'param'       => json_encode($request->param(), JSON_UNESCAPED_UNICODE),
			'remark'      => (string) $remark,
			'create_time' => time(),
		];

		Db::name('user_log')->insert($data);
	}
}

if (!function_exists('distribution')) {
	function distribution($money = 0, $userId = null)
	{
		$requestUserId = session('user_info.id');
		$userId = $userId ?: $requestUserId;

		if (empty($userId)) {
			return false;
		}

		$user = Db::name('user')->where('id', $userId)->find();
		if (empty($user) || empty($user['pid'])) {
			return false;
		}

		$config = Db::name('config')->where('name', 'site_copyright')->find();
		$rate = $config ? (float) $config['value'] : 0;
		$baseMoney = max((float) $money, 0);

		$parent = Db::name('user')->where('id', $user['pid'])->find();
		$grandParent = null;
		$record = [
			'user_id' => (string) $user['id'],
			'fx_time' => (string) time(),
		];

		if (!empty($parent)) {
			$record['user_a'] = (string) $parent['id'];
			$record['a_money'] = round($baseMoney * ($rate / 100), 2);
			if ($record['a_money'] > 0) {
				Db::name('user')->where('id', $parent['id'])->setInc('balance', $record['a_money']);
			}

			if (!empty($parent['pid'])) {
				$grandParent = Db::name('user')->where('id', $parent['pid'])->find();
			}
		}

		if (!empty($grandParent)) {
			$record['user_b'] = (string) $grandParent['id'];
			$record['b_money'] = round($baseMoney * ($rate / 100), 2);
			if ($record['b_money'] > 0) {
				Db::name('user')->where('id', $grandParent['id'])->setInc('balance', $record['b_money']);
			}
		}

		if (!isset($record['a_money'])) {
			$record['a_money'] = 0;
		}
		if (!isset($record['b_money'])) {
			$record['b_money'] = 0;
		}

		Db::name('distribution')->insert($record);
		return true;
	}
}

if (!function_exists('website_status')) {
	function website_status()
	{
		$status = config('website_status');
		if ($status === null) {
			$config = Db::name('config')->where('name', 'website_status')->find();
			$status = $config ? $config['value'] : 1;
		}

		if ((string) $status === '1' || $status === true || (string) $status === 'true') {
			return 'true';
		}

		$message = config('colse_explain');
		if ($message === null) {
			$config = Db::name('config')->where('name', 'colse_explain')->find();
			$message = $config ? $config['value'] : '站点已关闭';
		}

		return (string) $message;
	}
}

if (!function_exists('data_auth_sign')) {
	function data_auth_sign($data)
	{
		if (!is_array($data)) {
			$data = (array) $data;
		}

		ksort($data);
		return sha1(http_build_query($data));
	}
}

if (!function_exists('is_admin_login')) {
	function is_admin_login()
	{
		$auth = session('admin_auth');
		if (empty($auth)) {
			return false;
		}

		return session('admin_auth_sign') === data_auth_sign($auth);
	}
}

if (!function_exists('insert_admin_log')) {
	function insert_admin_log($remark = '')
	{
		$request = Request::instance();
		$auth = session('admin_auth');

		$data = [
			'admin_id'    => isset($auth['admin_id']) ? (int) $auth['admin_id'] : 0,
			'username'    => isset($auth['username']) ? (string) $auth['username'] : '',
			'useragent'   => substr($request->server('HTTP_USER_AGENT', ''), 0, 255),
			'ip'          => $request->ip(),
			'url'         => substr($request->url(true), 0, 255),
			'method'      => $request->method(),
			'type'        => $request->isAjax() ? 'ajax' : 'html',
			'param'       => json_encode($request->param(), JSON_UNESCAPED_UNICODE),
			'remark'      => (string) $remark,
			'create_time' => time(),
		];

		Db::name('admin_log')->insert($data);
	}
}

if (!function_exists('timediff')) {
	function timediff($value)
	{
		if ($value === null || $value === '') {
			return '';
		}

		$timestamp = is_numeric($value) ? (int) $value : strtotime($value);
		if (empty($timestamp)) {
			return (string) $value;
		}

		$diff = time() - $timestamp;
		if ($diff <= 0) {
			return '刚刚';
		}

		if ($diff < 60) {
			return $diff . '秒前';
		}

		if ($diff < 3600) {
			return floor($diff / 60) . '分钟前';
		}

		if ($diff < 86400) {
			return floor($diff / 3600) . '小时前';
		}

		if ($diff < 2592000) {
			return floor($diff / 86400) . '天前';
		}

		return date('Y-m-d H:i:s', $timestamp);
	}
}

if (!function_exists('hashids_instance')) {
	function hashids_instance()
	{
		static $hashids;

		if ($hashids === null) {
			$salt = config('database.prefix') . '|' . config('administrator') . '|config';
			$hashids = new \Hashids\Hashids($salt, 6);
		}

		return $hashids;
	}
}

if (!function_exists('hashids_encode')) {
	function hashids_encode($value)
	{
		if (!is_numeric($value)) {
			return (string) $value;
		}

		return hashids_instance()->encode((int) $value);
	}
}

if (!function_exists('hashids_decode')) {
	function hashids_decode($value)
	{
		if (is_numeric($value)) {
			return (int) $value;
		}

		$decoded = hashids_instance()->decode((string) $value);
		if (empty($decoded)) {
			return 0;
		}

		return (int) $decoded[0];
	}
}

if (!function_exists('format_bytes')) {
	function format_bytes($size, $decimals = 2)
	{
		$size = max((float) $size, 0);
		$units = ['B', 'KB', 'MB', 'GB', 'TB'];
		$index = 0;

		while ($size >= 1024 && $index < count($units) - 1) {
			$size /= 1024;
			$index++;
		}

		if ($index === 0) {
			return (int) $size . ' ' . $units[$index];
		}

		return round($size, (int) $decimals) . ' ' . $units[$index];
	}
}

if (!function_exists('list_to_tree')) {
	function list_to_tree($list, $pk = 'id', $pid = 'pid', $child = 'children', $root = 0)
	{
		$tree = [];
		$refer = [];

		foreach ($list as $index => $item) {
			$refer[$item[$pk]] = &$list[$index];
		}

		foreach ($list as $index => $item) {
			$parentId = $item[$pid];
			if ((string) $parentId === (string) $root) {
				$tree[] = &$list[$index];
			} elseif (isset($refer[$parentId])) {
				if (!isset($refer[$parentId][$child])) {
					$refer[$parentId][$child] = [];
				}
				$refer[$parentId][$child][] = &$list[$index];
			}
		}

		return $tree;
	}
}

if (!function_exists('tree_to_list')) {
	function tree_to_list($tree, $child = 'children', &$list = [])
	{
		foreach ($tree as $item) {
			$children = [];
			if (isset($item[$child])) {
				$children = $item[$child];
				unset($item[$child]);
			}
			$list[] = $item;
			if (!empty($children)) {
				tree_to_list($children, $child, $list);
			}
		}

		return $list;
	}
}

if (!function_exists('to_under_score')) {
	function to_under_score($str)
	{
		$value = preg_replace('/(?<!^)[A-Z]/', '_$0', $str);
		return strtolower($value);
	}
}
