<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/17 0017
 * Time: 上午 11:26
 */
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;
class Kalman extends AdminBase
{
    /*
     * 首页数据展示
     * */
    public function index(){
        $param = $this->request->param();
        $where = [];
        if (isset($param['user_id'])) {
            $where['user_id'] = ['like', "%" . $param['user_id']. "%"];
        }
        if (isset($param['kalman_pwd'])) {
            $where['kalman_pwd'] = $param['kalman_pwd'];
        }
        if (isset($param['state'])) {
            $where['state'] = $param['state'];
        }
        if (isset($param['generate_admin'])) {
            $where['generate_admin'] = $param['generate_admin'];
        }
        $list=model('kalman')
            ->with('category')
            ->field('a.*,b.username')
            ->alias('a')
            ->join('admin b','a.generate_admin = b.id')
            ->order('id desc')
            ->where($where)
            ->paginate(config('page_number'), false, ['query' => $param]);
        return $this->fetch('index', ['list' => $list,'admin' => Db::name('admin')->select()]);
    }
    /*
     * 添加卡密数据，可批量添加
     * */
    public function add(){
        $admin=session('admin_auth');
        if ($this->request->isPost()) {
            $data=array();
            $param = $this->request->param();
            $num=$param['num'];
            $rand=Db::name('kalman')->field('kalman_pwd')->select();
            unset($param['num']);
            for($i=0;$i<$num;$i++){
                $param['generation_time']=time();
                $param['generate_admin']=$admin['admin_id'];
                $param['kalman_pwd']=$this->randomkeys($rand);
                array_push($rand,['kalman_pwd'=>$param['kalman_pwd']]);
                $data[$i]=$param;
            }
            if(db("kalman")->insertAll($data)){
                insert_admin_log('添加了'.$num.'条卡密');
                $this->success('添加成功', url('admin/kalman/index'));
            }else{
                $this->error($this->errorMsg);
            }
        }

        return $this->fetch("add");
    }
    //生成随机数，判断返回随机字符串
    public function randomkeys($rand)
    {
        $length=8;
        $pattern = '1234567890ABCDEFGHIJKLOMNOPQRSTUVWXYZ';
        $key='';
        for($i=0;$i<$length;$i++)
        {
            $key .= $pattern{mt_rand(0,35)};    //生成php随机数
        }
        if(count($rand)==0){
            return $key;
        }
        foreach ($rand as $value){
            if($value['kalman_pwd']==$key){
                $this->randomkeys($rand);
            }else{
                return $key;
            }
        }
    }
    /*
    *数据删除
    */
    public function del(){
        if ($this->request->isPost()) {
            if ($this->delete('kalman', $this->request->param()) === true) {
                insert_admin_log('删除了卡密');
                $this->success('删除成功');
            } else {
                $this->error($this->errorMsg);
            }
        }
    }
}