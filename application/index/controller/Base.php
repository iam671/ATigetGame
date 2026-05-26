<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/18 0018
 * Time: 上午 10:19
 */
namespace app\index\controller;

use think\Controller;
use think\Db;

class Base extends Controller
{
    protected function _initialize()
    {
        parent::_initialize();
        if(website_status()=='true'){
            $user_info=session("user_info");
            if(empty($user_info)){
                echo $this->error("用户未登录！",'','false');
                exit;
            }
        }else{
            echo website_status();
            exit;
        }
    }
    public function user_in(){
        $data=Db::name("user")->where("id",session("user_info.id"))->find();
        return $data;
    }
    public function whole(){
        $user=Db::name("user")->where("id",session("user_info.id"))->find();
        if($user['is_thumb']==1){
            $data=Db::name("user_whole")->where("user_id",$user['id'])->find();
        }else{
            $data=Db::name("whole")->where("whole_id",1)->find();
        }
        return $data['v'];
    }
    
}