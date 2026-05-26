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
    public function login(){
        if($this->request->isPost()){
            $param  = $this->request->param();
            $user_info=db('user')->where('username',$param['username'])->find();
            if(empty($user_info)){
                return $this->error("用户名不存在！",'','false');
            }else{
                if($user_info['password']==md5($param['password'])){

                    if($user_info['status']==0){
                        user_log("登录失败");
                        return $this->error("用户账号已禁止登录！请联系客服",'','false');
                    }else{
                        $url="http://sggg.252460.cc/yyy?pid=".$user_info['id'];
                        user_log("登录成功");
                        session('user_info',$user_info);
                        $where['name'] =array('in','site_keywords,site_description,tel');
                        $config=db("config")->where($where)->select();
                        db("user")->where("id",$user_info['id'])->update(array(
                            "last_login_time"=>time(),
                            "last_login_ip"=>$this->phone_ip()
                        ));
                        $this->success("登录成功",'',[
                            'user_id'=>$user_info['id'],
                            'href'=>$url,
                            'rule1'=>$config[1]['value'],
                            'rule2'=>$config[0]['value'],
                            'wxNum'=>$config[2]['value'],
                        ]);
                    }
                }else{
                    return $this->error("用户密码不正确！",'','false');
                }
            }
        }
    }
    //注册
    public function register(){
        if($this->request->isPost()){
            $param  = $this->request->param();
            $config=db("config")->where('name','money')->find();
            $data=array([
                'username'=>$param['username'],//户名
                'password'=>md5($param['password']),//密码
                'secret_security'=>"我的QQ号码是多少?",//密保问题
                'mobile'=>iphone(),//获取手机型号
                'answer'=>$param['answer'],//密保问题答案
                'create_time'=>time(),//注册时间
                'balance'=>$config['value'],
                'pid'=>$param['pid'],
                'register_ip'=>$this->phone_ip(),//IP地址
            ]);
            $zen=db("config")->where("name",'site_copyright')->find();
            if($param['pid']!=0){
                db("user")->where("id",$param['pid'])->setInc("balance",$zen['value']);
            }
            $select=db("user")->where('register_ip',$this->phone_ip())->select();           
            $username=db("user")->where("username",$param['username'])->find();
            if(empty($username)){
                if(empty($select)){
                    if(db("user")->insertAll($data)){
                        user_log("注册");
                        $userId = db('user')->getLastInsID();
                        distribution(0,$userId);
                        $this->success('注册成功', '','true');
                    }
                }else{
                    $this->error("该设备已经注册过账号！",'','false');
                }
            }else{
                return $this->error("账号已经存在！",'','false');
            }
        }
    }
    //忘记密码
    public function modify(){
        if($this->request->isPost()){
            $modify=$this->request->param();
            $user_info=db("user")->where('username',$modify['username'])->find();
            if(empty($user_info)){
                return $this->error("用户名不存在",'','false');
            }else{
                if($modify['secret_security']==$user_info['secret_security']){
                    if($modify['answer']==$user_info['answer']){
                        db("user")->where('id',$user_info['id'])->update(['password'=>md5($modify['password'])]);
                        user_log("修改密码");
                        return $this->success("密码修改成功",'','true');
                    }else{
                        return $this->error("密保答案错误！");
                    }

                }else{
                    return $this->error("密保问题错误",'','false');
                }
            }
        }
    }
    public function user_info(){
        if($this->request->isPost()){
            $user_info=db('user')->field('id,username,balance')->where('id',session('user_info.id'))->find();
            $img=array("a","b","c");
            $user_info['img']="http://".$_SERVER['HTTP_HOST']."/static/images/".$img[array_rand($img)].".png";
            $user_info['interval']=3;
            return $this->success("获取用户信息成功！",'',$user_info);
        }
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