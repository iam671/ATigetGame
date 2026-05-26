<?php
?><!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>卡密充值</title>
	<style>
		body {
			margin: 0;
			min-height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;
			background: #f5f7fb;
			font-family: "Microsoft YaHei", sans-serif;
		}

		.card {
			padding: 32px 24px;
			text-align: center;
			background: #ffffff;
			border-radius: 12px;
			box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
		}

		.message {
			margin: 0 0 20px;
			font-size: 22px;
			color: #333333;
		}

		.back-button {
			display: inline-block;
			padding: 10px 20px;
			border: none;
			border-radius: 6px;
			background: #1677ff;
			color: #ffffff;
			font-size: 16px;
			cursor: pointer;
		}

		.back-button:hover {
			background: #0958d9;
		}
	</style>
</head>
<body>
	<div class="card">
		<p class="message">请使用卡密充值</p>
		<button class="back-button" type="button" onclick="history.back()">返回</button>
	</div>
</body>
</html>
