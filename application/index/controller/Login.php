<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/18 0018
 * Time: 上午 10:39
 */

namespace app\index\controller;
use think\Controller;
class Login extends Controller
{
    //登录
   // 登录
public function login() {
    if ($this->request->isPost()) {
        $param = $this->request->param();
        $user_info = db('user')->where('username', $param['username'])->find();
        
        if (empty($user_info)) {
            return $this->error("用户名不存在！", '', 'false');
        } else {
            if ($user_info['password'] == md5($param['password'])) {
                if ($user_info['status'] == 0) {
                    user_log("登录失败");
                    return $this->error("用户账号已禁止登录！请联系客服", '', 'false');
                } else {
                    // 构建登录成功后的跳转链接
                    $url = ($_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'] . "/yyy?pid=" . $user_info['id'];
                    user_log("登录成功");

                    // 将用户信息保存到ThinkPHP的会话中
                    session('user_info', $user_info);

                    // 复用 ThinkPHP 会话，避免重复调用原生 session_start()
                    session('user_id', $user_info['id']);

                    // 将用户ID保存到Cookie中，有效期为7天
                    setcookie('user_id', $user_info['id'], time() + 7 * 24 * 60 * 60, '/');

                    // 更新用户的最后登录时间和IP地址
                    db("user")->where("id", $user_info['id'])->update([
                        "last_login_time" => time(),
                        "last_login_ip" => $this->phone_ip()
                    ]);

                    // 获取配置信息（修复点：从数据库获取 $config）
                    $where['name'] = array('in', 'site_keywords,site_description,tel');
                    $config = db("config")->where($where)->select();

                    // 返回登录成功的信息（修复点：确保 $config 数据存在）
                    $this->success("登录成功", '', [
                        'user_id' => $user_info['id'],
                        'href' => $url,
                        'rule1' => isset($config[1]['value']) ? $config[1]['value'] : '', // site_description
                        'rule2' => isset($config[0]['value']) ? $config[0]['value'] : '', // site_keywords
                        'wxNum' => isset($config[2]['value']) ? $config[2]['value'] : '', // tel
                    ]);
                }
            } else {
                return $this->error("用户密码不正确！", '', 'false');
            }
        }
    }
}

    
    
    
    
    //忘记密码
    //忘记密码
public function modify(){
    if($this->request->isPost()){
        $modify=$this->request->param();
        $user_info=db("user")->where('username',$modify['username'])->find();
        if(empty($user_info)){
            return $this->error("用户名不存在",'','false');
        }else{
            // 移除密保问题判断
            if($modify['answer']==$user_info['answer']){
                db("user")->where('id',$user_info['id'])->update(['password'=>md5($modify['password'])]);
                user_log("修改密码");
                return $this->success("密码修改成功",'','true');
            }else{
                return $this->error("密保答案错误！");
            }
        }
    }
}
    
    
    
    public function user_info(){
    if($this->request->isPost()){
        $user_info = db('user')->field('id, username, balance, answer')->where('id', session('user_info.id'))->find();
        
        if(!empty($user_info) && !empty($user_info['answer'])){
            // 获取当前域名和协议
            $scheme = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' ? 'https://' : 'http://');
            $domain = $_SERVER['HTTP_HOST'];
            
            // 构建头像文件路径
            $avatarPath = '/qq/img/' . $user_info['answer'] . '.jpg';  // 头像文件名为 QQ 号码 + .jpg
            
            // 检查头像文件是否存在
            if (file_exists($_SERVER['DOCUMENT_ROOT'] . $avatarPath)) {
                // 头像文件存在，构建完整的头像URL
                $user_info['img'] = $scheme . $domain . $avatarPath;
            } else {
                // 头像文件不存在，使用默认头像
                $user_info['img'] = $scheme . $domain . '/qq/tx.jpg';
            }
        } else {
            // 如果用户信息或QQ号为空，设置默认头像
            $user_info['img'] = $scheme . $domain . '/qq/tx.jpg';
        }
        
        // $user_info['interval'] = 3;
        return $this->success("获取用户信息成功！",'',$user_info);
    }
}

    
    
    
    
    //     public function user_info(){
    //     if($this->request->isPost()){
    //         $user_info=db('user')->field('id,username,balance')->where('id',session('user_info.id'))->find();
    //         $img=array("a","b","c");
    //         $user_info['img']=($_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://') . $_SERVER['HTTP_HOST']."/static/images/".$img[array_rand($img)].".png";
    //         $user_info['interval']=3;
    //         return $this->success("获取用户信息成功！",'',$user_info);
    //     }
    // }

    // 注册
    public function register(){
        if($this->request->isPost()){
            $param  = $this->request->param();
            $config = db("config")->where('name','money')->find();
            
            // 构建用户数据
            $data = array([
                'username' => $param['username'],   // 用户名
                'password' => md5($param['password']),   // 密码
                'secret_security' => "你的微信是多少?",  // 密保问题
                'mobile' => iphone(),  // 获取手机型号
                'answer' => $param['answer'],  // 密保问题答案
                'create_time' => time(),  // 注册时间
                'balance' => $config['value'],  // 初始余额
                'pid' => $param['pid'],
                'register_ip' => $this->phone_ip(),  // 注册IP
            ]);
            
            $zen = db("config")->where("name",'site_copyright')->find();
            
            if ($param['pid'] != 0) {
                db("user")->where("id", $param['pid'])->setInc("balance", $zen['value']);
            }

            // 检查是否已经注册
            $select = db("user")->where('register_ip', $this->phone_ip())->select();
            $username = db("user")->where("username", $param['username'])->find();

            if (empty($username)) {
                if (empty($select)) {
                    if (db("user")->insertAll($data)) {
                        user_log("注册");
                        $userId = db('user')->getLastInsID();
                        distribution(0, $userId);
                        
                        // 注册成功后请求头像接口
                        // $this->requestAvatar($param['answer']);  // 传递QQ号码进行头像请求
                        
                        $this->success('注册成功', '', 'true');
                    }
                } else {
                    $this->error("该设备已经注册过账号！", '', 'false');
                }
            } else {
                return $this->error("账号已经存在！", '', 'false');
            }
        }
    }

    // 请求头像接口
    private function requestAvatar($qq) {
        // 获取当前域名和协议
        $scheme = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' ? 'https://' : 'http://');
        $domain = $_SERVER['HTTP_HOST'];
        
        // 构建API请求URL
        $apiUrl = $scheme . $domain . '/qq/qq.php?qq=' . $qq;
        
        // 初始化curl会话
        $ch = curl_init();
        // 设置curl选项
        curl_setopt($ch, CURLOPT_URL, $apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        // 执行curl会话
        curl_exec($ch);
        
        // 关闭curl会话
        curl_close($ch);
    }
    
    public function user_pwd(){
        if($this->request->isPost()) {
            $modify=$this->request->param();
            $user = session("user_info.id");
            $user_info=db("user")->where('id',$user)->find();
            if(md5($modify["j_pwd"])==$user_info["password"]){
                if($modify["j_pwd"]==$modify["x_pwd"]){
                    $this->error("旧密码和新密码不能相同！",'',false);
                }else{
                    db("user")->where("id",$user_info['id'])->update(array("password"=>md5($modify["x_pwd"])));
                    session("user_info.password",$modify["x_pwd"]);
                    $this->success("密码修改成功",'',true);
                }
            }else{
                $this->error("旧密码错误！",'',false);
            }
            return $user_info;
        }
    }
    public function answer(){
        if($this->request->isPost()) {
            $modify=$this->request->param();
            $user = session("user_info.id");
            $user_info=db("user")->where('id',$user)->find();
            if($modify["j_answer"]==$user_info["answer"]){
                if($modify["j_answer"]==$modify["x_answer"]){
                    $this->error("旧密保答案和新密保不能相同！",'',false);
                }else{
                    db("user")->where("id",$user_info['id'])->update(array("answer"=>$modify["x_answer"]));
                    $this->success("密保答案修改成功",'',true);
                }
            }else{
                $this->error("旧密保答案错误！",'',false);
            }
            return $user_info;
        }
    }
}