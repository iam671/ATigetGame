<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/20 0020
 * Time: 上午 10:24
 */

namespace app\index\controller;
use think\Db;

class Game extends Base
{
    public function index(){
        return $this->whole();
    }
    /**
     * 生成用户抽奖日志
     * */
    public function game_log($profit,$money,$in_money){
        $data=array(
            "user_id"=>session("user_info.id"),
            "money"=>$money,
            "in_money"=>$in_money,
            "profit"=>$profit,
            "log_time"=>time()
        );
        db("game_log")->insert($data);
    }
    public function get_gift(){
        //拼装奖项数组
        if($this->request->isPost()){
            //拼装奖项数组
            if($this->request->isPost()){
                $param = $this->request->param();
                $whole=array();
                foreach ($param['fruits'] as $key=>$item){
                    array_push($whole,$item[0]);
                }
                if(empty($param)){
                    return $this->error("没有参数！请传递参数");
                }
                distribution($param['money']);
                $prize_arr=db('game')->select();//查询水果中奖概率
                $user_info=$this->user_in();
                if($user_info['is_thumb']==1){
                    $prize=Db::name("user_luck")->field('luck_sel')->where("user_id",$user_info['id'])->find();
                    $ar['1']=100-$prize['luck_sel'];//未中
                    $ar['2']=$prize['luck_sel'];//中
                    $rid = $this->get_rand($ar);
                    if($rid==1){
                        foreach ($prize_arr as $key=>$item){
                            if($item['game_id']==10||$item['game_id']==22){
                                $prize_arr[$key]['v']=0;
                            }
                        }
                    }else{
                        foreach ($prize_arr as $key=>$item){
                            if($item['game_id']==10||$item['game_id']==22){
                                $prize_arr[$key]['v']=$prize['luck_sel']/2;
                            }else{
                                $prize_arr[$key]['v']=0;
                            }
                        }
                    }
                }//判断LUCK抽中概率

                foreach ($prize_arr as $key=>$item){
                    if(in_array($item['game_id'],$whole) || $item['game_id']==10 || $item['game_id']==22){
                        $arr[$item['game_id']] = $item['v']*($this->whole());//概率数组
                    }else{
                        $arr[$item['game_id']] = $item['v']*(100-$this->whole());//概率数组
                    }
                }
                if($this->whole()==100){
                    foreach ($arr as $key=>$item){
                        if($key==5){
                            $arr[$key]=0;
                        }
                        if(in_array($key,$whole)||in_array($prize_arr[$key-1]['pid'],$whole)){
                            if($prize_arr[$key-1]['multiple_rate']>10&&count($whole)==8){
                                $arr[$key]=100;
                            }else if(count($whole)<8){
                                $arr[$key]=100;
                            }
                        }else{
                            $arr[$key]=0;
                        }
                    }
                }
                if($this->whole()==0){
                    foreach ($arr as $key=>$item){
                        if(in_array($key,$whole) || $key==10 || $key==22 || $item==0){
                            $arr[$key]=0;
                        }else if($prize_arr[$key-1]['multiple_rate']<10){
                            $arr[$key]=100;
                        }else{
                            $arr[$key]=0;
                        }
                    }
                }

                $rid = $this->get_rand($arr); //根据概率获取奖项id
                $yes = $prize_arr[$rid-1]; //中奖项
                if($rid==10||$rid==22){
                    $yes['luck']=true;
                    $data['data']=$this->luck($rid);
                    foreach ($param['fruits'] as $key=>$value){
                        foreach ($data['data']['pos']['luck'] as $zhon){
                            if($prize_arr[$zhon-1]['pid']==$prize_arr[$value[0]-1]['pid']){
                                $data['money'][]=$prize_arr[$zhon-1]['multiple_rate']*$value[1];
                            }else if($prize_arr[$zhon-1]['pid']==$prize_arr[$value[0]-1]['game_id']){
                                $data['money'][]=$prize_arr[$zhon-1]['multiple_rate']*$value[1];
                            }else if($prize_arr[$zhon-1]['game_id']==$prize_arr[$value[0]-1]['game_id']){
                                $data['money'][]=$prize_arr[$zhon-1]['multiple_rate']*$value[1];
                            }
                        }

                    }
                }else{
                    //没有选中LUCK时执行
                    $yes['luck']=false;
                    $data['data']=array("type"=>0,"luck_name"=>$prize_arr[$rid-1]['prize'],"pos"=>$yes['game_id']);
                    foreach ($param['fruits'] as $key=>$value){
                        if($value[0]==$rid){
                            $data['money'][]=$prize_arr[$rid-1]['multiple_rate']*$value[1];
                        }else if ($prize_arr[$rid-1]['pid']==$value[0]){
                            $data['money'][]=$prize_arr[$rid-1]['multiple_rate']*$value[1];
                        }else{
                            $data['money'][]=0;
                        }
                    }
                }

                // 判断 'money' 是否存在，如果没有则赋值为0
                !isset($data['money'])?$data['money'][]=0:'';
                $in_money=array_sum($data['money']);
                $money=$param['money'];
                $profit=$in_money-$money;
                $new_balance = db("user")->where("id", session("user_info.id"))->value("balance") + $in_money;
                // 如果新余额小于 0，则设置为 0
                if ($new_balance < 0) {
                    $new_balance = 0;
                }
                // 更新余额
                db("user")->where("id", session("user_info.id"))->update(['balance' => $new_balance]);
                $this->game_log($profit,$money,$in_money,session('user_info.id'));
                return $this->success('成功','',$data);
            }
        }
    }
    /**
     *抽中luck后在执行此函数
     */
    /**
     * @return bool
     */
    public function ran()
    {
        $Num = mt_rand(3, 7);
        $ran=mt_rand(1,24);
        $pos=array();
        for ($i=$ran;$i<$ran+$Num;$i++){
            if($i==24){
                $i=1;
            }
            array_push($pos,$i);
        }
        return $pos;
    }
    public function luck($luck){
        $prize_arr=db('luck')->select();
        $user_info=db("user")->where('id',session("user_info.id"))->find();
        if($user_info['is_thumb']==1){
            $prize_arr=Db::name("user_luck")->field('luck')->where("user_id",$user_info['id'])->find();
            $prize_arr=json_decode($prize_arr['luck'],true);
        }
        foreach ($prize_arr as $key=>$item){
            $arr[$item['luck_id']] = $item['v'];//概率数组
        }
        $rid = $this->get_rand($arr); //根据概率获取奖项id
        $luck_game=json_decode($prize_arr[$rid-1]['luck_game']);
        $pos=array();
        if($rid==4){
            $pos=$this->sum_game(7);
        }else if ($rid==5){
            $pos=$this->sum_game(8);
        }else if($rid==6){
            $pos=$this->sum_game(rand(1,3));
        }else if ($rid==7){
            $pos = $this->ran();
        }else if($rid==8){
            for ($i=1;$i<=24;$i++){
                array_push($pos,$i);
            }
        }else if($rid==9){
            $pos=[];
        }else{
            foreach ($luck_game as $key=>$value){
                array_push($pos,$value[array_rand($value)]);
            }
        }
        $number=$this->sel($prize_arr,"luck_id",$rid);
        return array("type"=>$rid,"luck_name"=>$number['luck_name'],"pos"=>array("pos"=>$luck,"luck"=>$pos,"number"=>$number['number']));
    }
    public function sel($arr,$key,$value){
        $vad='';
        foreach ($arr as $item=>$val){
            if($val[$key]==$value){
                $vad=$val;
            }
        }
        return $vad;
    }
    /**
     * 计算中奖概率
     */
    public function sum_game($sum){
        $prize_arr=db('game')->select();
        unset($prize_arr[9]);unset($prize_arr[21]);
        $rid=array();
        $ran=array_rand($prize_arr,$sum);
        if($sum==1){
            array_push($rid,$prize_arr[$ran]['game_id']);
        }else{
            foreach ($ran as $key=>$item){
                array_push($rid,$prize_arr[$item]['game_id']);
            }
        }
        return $rid;
    }
    /**
     * 生成随机数返回使用
     * */
    public  function get_rand($proArr) {
        $result = '';
        //概率数组的总概率精度
        $proSum = array_sum($proArr);
        // var_dump($proSum);
        //概率数组循环
        foreach ($proArr as $key => $proCur) {
            $randNum = mt_rand(1, $proSum); //返回随机整数

            if ($randNum <= $proCur) {
                $result = $key;
                break;
            } else {
                $proSum -= $proCur;
            }
        }
        unset ($proArr);
        return $result;
    }
    /**
     * 提现录入
     * */
    public function money(){
        if($this->request->isPost()){
            $kalman = $this->request->param();
            $kalman['user_id']=session("user_info.id");
            $kalman['monery_time']=time();
            db("user")->where("id",$kalman['user_id'])->setDec('balance',$kalman['money']);
            $kalman['money']=$kalman['money']*0.98;
            if(db("money")->insert($kalman)){
                $this->success("提交成功！","",true);
            }else{
                $this->error("提交失败，请稍后再试！","",false);
            }
        }
    }
    /**
     * 游戏记录
     */
    public function gamelog(){
        if($this->request->isPost()){
            $kalman = $this->request->param();
            $game_log=db("game_log")
                ->field('money,in_money,profit,log_time')
                ->where("user_id",session("user_info.id"))
                ->order('log_id desc')
                ->limit($kalman['offset'],$kalman['length'])
                ->select();
            $count=db("game_log")
                ->where("user_id",session("user_info.id"))
                ->select();
            foreach ($game_log as $key=>$item){
                $game_log[$key]['log_time']=date('Y-m-d H:i:s',$item['log_time']);
            }
            $data['data']=$game_log;
            $data['count']=count($count);
            return $this->success("游戏记录",'',$data);
        }
    }
    /**
     * 分销记录
     */
    public function distribution(){
        if($this->request->isPost()) {
            $kalman = $this->request->param();
            if($kalman['grade']==1){
                $data = db('distribution')->where('user_b',session('user_info.id'))->order('fx_time desc')->limit($kalman['offset'],$kalman['length'])->select();
                $count=db('distribution')->where('user_b',session('user_info.id'))->select();
            }else{
                $data = db('distribution')->where('user_a',session('user_info.id'))->order('fx_time desc')->limit($kalman['offset'],$kalman['length'])->select();
                $count=db('distribution')->where('user_a',session('user_info.id'))->select();
            }
            foreach ($data as $key=>$item){
                $data[$key]['fx_time']=date('Y-m-d H:i:s',$item['fx_time']);
            }
            $distribution['data']=$data;
            $distribution['count']=count($count);
            return $this->success("分销记录","",$distribution);
        }
    }
    public function money_log(){
        if($this->request->isPost()) {
            $kalman = $this->request->param();
            if(empty($kalman)){
                return $this->error("输入显示数据区间",'',false);
            }else{
                $data = db('money')->where('user_id', session('user_info.id'))->order('monery_id desc')->limit($kalman['offset'],$kalman['length'])->select();
                $count = db('money')->where('user_id', session('user_info.id'))->select();
                foreach ($data as $key=>$item){
                    $data[$key]['monery_time']=date('Y-m-d H:i:s',$item['monery_time']);
                    if($item['state']==0){
                        $data[$key]['state']="未打款";
                    }else{
                        $data[$key]['state']="已打款";
                    }
                }
                $money['data']=$data;
                $money['count']=count($count);
                return $this->success("提现记录","",$money);
            }

        }
    }
    public function size(){
        if($this->request->isPost()) {
            $kalman = $this->request->param();
            $user=db("user")->where('id',session('user_info.id'))->find();
            if($user['balance']<$kalman['balance']){
                return $this->error("账户余额小于押注金币！","",false);
            }else{
                if($user['is_thumb']==1){
                    //用户概率自定义的情况
                    $size=Db::name("user_size")->where("user_id",session('user_info.id'))->find();
                }else{
                    $size=Db::name("size")->where("size_id",1)->find();
                }
                if($kalman['size']==1){
                    $blan=$this->get_rand(array('1'=>$size['v'],'2'=>100-$size['v']));
                }else{
                    $blan=$this->get_rand(array('1'=>100-$size['v'],'2'=>$size['v']));
                }
                if($blan==1){
                    $ran=rand(1, 7);
                }else{
                    $ran=rand(8, 14);
                }
                if($blan==$kalman['size']){
                    db("user")->where('id',session('user_info.id'))->setInc('balance',$kalman['balance']);
                    return $this->success("猜中！",'',$ran);
                }else{
                    db("user")->where('id',session('user_info.id'))->setDec('balance',$kalman['balance']);
                    return $this->success("未猜中！",'',$ran);
                }
            }
        }
    }
}
