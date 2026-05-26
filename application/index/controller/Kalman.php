<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/19 0019
 * Time: 上午 9:22
 */

namespace app\index\controller;


class Kalman extends Base
{
    public function receive(){
        if($this->request->isPost()){
            $kalman = $this->request->param();
            if(empty($kalman)){
                return $this->error("请输入卡密！",'','false');
            }else{
                $data=db('kalman')->where("kalman_pwd",$kalman['kalman_pwd'])->find();
                if(!empty($data)){
                    if($data['state']==0){
                        $update=array(
                            'state'=>1,
                            'effective_time'=>time(),
                            'user_id'=>session('user_info.id')
                        );
                        db('kalman')->where("id",$data['id'])->update($update);
                        db("user")->where("id",session("user_info.id"))->setInc("balance",$data['number']);
                        db("user")->where("id",session("user_info.id"))->setInc("kami",$data['number']);
                        return $this->success("领取成功",'','true');
                    }else{
                        return $this->error("卡密已经使用过了！",'','false');
                    }
                }else{
                    return $this->error("卡密不存在！",'','false');
                }
            }
        }
    }
}