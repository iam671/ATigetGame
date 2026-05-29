<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;

class Index extends AdminBase
{
    protected $noLogin = [
        'login',
        'captcha'
    ];
    protected $noAuth = [
        'index',
        'logout'
    ];

    protected function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {
       $this->login();
    }

    public function login()
    {
        is_admin_login() && $this->redirect('admin/user/index'); // 登录直接跳转
        if ($this->request->isPost()) {
            $param  = $this->request->param();
            $result = $this->validate($param, 'login');
            if ($result !== true) {
                $this->error($result);
            }
            $admin = model('admin')->where('username', $param['username'])->find();
            if ($admin && password_verify_compat($param['password'], $admin['password'])) {
                $admin['status'] != 1 && $this->error('账号已禁用');
                // 保存状态
                $auth = [
                    'admin_id' => $admin['id'],
                    'username' => $admin['username'],
                ];
                session('admin_auth', $auth);
                session('admin_auth_sign', data_auth_sign($auth));
                // 更新信息
                model('admin')->save([
                    'last_login_time' => time(),
                    'last_login_ip'   => $this->request->ip(),
                    'login_count'     => $admin['login_count'] + 1,
                ], ['id' => $admin['id']]);
                insert_admin_log('登录了后台系统');
                $this->success('登录成功', url('admin/user/index'));
            } else {
                $this->error('账号或密码错误');
            }
        }
        return $this->fetch('login');
    }

    public function captcha()
    {
        $config = [
            // 验证码字符集合
            'codeSet'  => '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY',
            // 验证码字体大小(px)
            'fontSize' => 16,
            // 是否画混淆曲线
            'useCurve' => false,
            // 验证码图片高度
            'imageH'   => 42,
            // 验证码图片宽度
            'imageW'   => 135,
            // 验证码位数
            'length'   => 4,
            // 验证成功后是否重置
            'reset'    => true,
        ];
        return captcha('', $config);
    }

    public function iconLibs()
    {
        return $this->fetch('iconLibs');
    }

    // 修改密码
    public function editPassword()
    {
        if ($this->request->isPost()) {
            $param = $this->request->param();
            // 验证条件
            empty($param['password']) && $this->error('请输入旧密码');
            empty($param['new_password']) && $this->error('请输入新密码');
            empty($param['rep_password']) && $this->error('请输入确认密码');
            (strlen($param['new_password']) < 6 || strlen($param['new_password']) > 16) && $this->error('请输入6-16位的密码');
            $param['new_password'] != $param['rep_password'] && $this->error('两次密码不一致');
            $admin = model('admin')->where('id', session('admin_auth.admin_id'))->find();
            !password_verify_compat($param['password'], $admin['password']) && $this->error('旧密码错误');
            $data = ['id' => session('admin_auth.admin_id'), 'password' => $param['new_password']];
            if ($this->update('admin', $data, false) === true) {
                insert_admin_log('修改了登录密码');
                $this->success('更新成功', url('admin/index/index'));
            } else {
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('editPassword');
    }

    // 退出登录
    public function logout()
    {
        insert_admin_log('退出了后台系统');
        session('admin_auth', null);
        session('admin_auth_sign', null);
        $this->redirect('admin/index/login');
    }

    // 清除缓存
    public function clear()
    {
        clear_cache();
        insert_admin_log('清除了系统缓存');
        $this->success('清除成功');
    }
}
