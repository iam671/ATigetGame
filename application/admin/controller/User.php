<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;
class User extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        $param = $this->request->param();
        $where = [];
        if (isset($param['id'])) {
            $where['id'] = ['like', "%" . $param['id']. "%"];
        }
        if (isset($param['username'])) {
            $where['username'] = $param['username'];
        }
        if (isset($param['status'])) {
            $where['status'] = $param['status'];
        }
        if (isset($param['last_login_ip'])) {
        	$where['last_login_ip'] = ['like', "%" . $param['last_login_ip']. "%"];
          
        }
        if(isset($param['on_line'])){
            if($param['on_line']==0){
                $where['update_time']=['>',time()-300];
            }else{
                $where['update_time']=['<',time()-300];
            }
        }
        $line_where['update_time']=['>',time()-300];
        $on_line=Db::name("user")->where($line_where)->select();
        $on_line=count($on_line);
        $data=model('user')->order('id desc')->where($where)->paginate(config('page_number'));
        return $this->fetch('index', ['list' => $data,'on_line'=>$on_line]);
    }

    public function add()
    {
        if ($this->request->isPost()) {
            $param = $this->request->param();
            empty($param['password']) && $this->error('密码不能为空');
            if ($this->insert('user', $param) === true) {
                insert_admin_log('添加了用户');
                $this->success('添加成功', url('admin/user/index'));
            } else {
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('save');
    }

    public function edit()
    {
        if ($this->request->isPost()) {
            $param = $this->request->param();
            if (empty($param['password'])) {
                unset($param['password']);
            }else{
                $param['password']=md5($param['password']);
            }
            $user_id=$param['id'];
            unset($param['id']);
            if(Db::name("user")->where("id",$user_id)->update($param)==1){
                insert_admin_log('修改了用户');
                $this->success('修改成功', url('admin/user/index'));
            }else{
                $this->error($this->errorMsg);
            }
        }
        $user_info=model('user')->where('id', input('id'))->find();
        if($user_info['is_thumb']==1){
            $size=Db::name("user_size")->where('user_id',$user_info['id'])->select();
            $luck=Db::name("user_luck")->where("user_id",$user_info['id'])->find();
            $luck_sel=$luck['luck_sel'];
            $luck=json_decode($luck['luck'],true);
            $user_whole=Db::name('user_whole')->where("user_id",$user_info['id'])->find();
        }else{
            $size=Db::name("size")->select();
            $luck=db('luck')->select();
            $user_whole['v']=0;
            $luck_sel=0;
        }
        return $this->fetch('save', ['data' => $user_info,"luck"=>$luck,"size"=>$size,"user_whole"=>$user_whole,'luck_sel'=>$luck_sel]);
    }
    public function user_luck(){
        if ($this->request->isPost()) {
            $param=$this->request->param();
            $user_id=$param['username'];
            $state=array("is_thumb"=>$param['is_thumb']);
            unset($param['username']);
            unset($param['is_thumb']);
            $size=$param['size'];
            unset($param['size']);
            $luck_sel=$param['luck_sel'];
            unset($param['luck_sel']);
            $luck=db('luck')->select();
            foreach ($param as $key=>$item){
                $luck[$key]['v']=$item['v'];
            }
            db("user")->where("id",$user_id)->update($state);
            $user_info=Db::name("user_luck")->where('user_id',$user_id)->find();
            if(empty($user_info)){
                Db::name("user_luck")->insert(array(
                    'user_id'=>$user_id,
                    'luck'=>json_encode($luck),
                    "luck_sel"=>$luck_sel
                ));
                Db::name("user_size")->insert(array(
                    "user_id"=>$user_id,
                    "v"=>$size
                ));
                Db::name("user_whole")->insert(array(
                    "user_id"=>$user_id,
                    "v"=>50
                ));
            }else{
                Db::name("user_luck")->where('user_id',$user_id)->update(array(
                    'user_id'=>$user_id,
                    'luck'=>json_encode($luck),
                    "luck_sel"=>$luck_sel
                ));
                Db::name("user_size")->where('user_id',$user_id)->update(array(
                    'user_id'=>$user_id,
                    'v'=>$size
                ));
               
            }
            return $this->success("修改成功！");
        }else{
            $this->error($this->errorMsg);
        }
    }
    public function del()
    {
        if ($this->request->isPost()) {
            if ($this->delete('user', $this->request->param()) === true) {
                insert_admin_log('删除了用户');
                $this->success('删除成功');
            } else {
                $this->error($this->errorMsg);
            }
        }
    }

    public function export()
    {
        $data = collection(model('user')->field('id,username,mobile')->order('id desc')->select())->toArray();
        array_unshift($data, ['ID', '用户名', '手机号']);
        insert_admin_log('导出了用户');
        export_excel($data, date('YmdHis'));
    }

    public function log()
    {
        return $this->fetch('log', ['list' => model('userLog')->order('create_time desc')->paginate(config('page_number'))]);
    }

    public function truncate()
    {
        if ($this->request->isPost()) {
            db()->query('TRUNCATE ' . config('database.prefix') . 'user_log');
            $this->success('操作成功');
        }
    }
    public function presentation(){
        $where=[];
        $param = $this->request->param();
        if (isset($param['user_id'])) {
            $where['user_id'] = ['like', "%" . $param['user_id']. "%"];
        }
        if (isset($param['wx_id'])) {
            $where['wx_id'] = $param['wx_id'];
        }
        if (isset($param['state'])) {
            $where['state'] = $param['state'];
        }
        $data=model('money')->where($where)->order('monery_id desc')->paginate(config('page_number'));
        return $this->fetch('money', ['list' => $data]);
    }
    public function money(){
        if ($this->request->isPost()) {
            $data=$this->request->param();
            if (db('money')->where('monery_id',$data['id'])->update(['state'=>1])) {
                insert_admin_log('修改了ID为'.$data['id']."的提现状态");
                $this->success('修改成功');
            } else {
                $this->error("修改失败");
            }
        }
    }
    public function money_del(){
        if ($this->request->isPost()) {
            $data=$this->request->param();
            if(Db::name("money")->where('monery_id',$data['id'])->delete()){
                insert_admin_log('删除了提现记录');
                $this->success('删除成功');
            }else{
                $this->error("删除失败");
            }
        }
    }
    public function status(){
        if ($this->request->isPost()) {
            $data=$this->request->param();
            $user=Db::name("user")->where("id",$data['id'])->find();
            if($user['status']==1){
                Db::name("user")->where("id",$data['id'])->update(array("status"=>0));
            }else{
                Db::name("user")->where("id",$data['id'])->update(array("status"=>1));
            }
            $this->success("修改成功");
        }
    }
    public function whole(){
        if ($this->request->isPost()) {
            $data=$this->request->param();
            if(Db::name("user_whole")->where("user_id",$data['user_id'])->select()){
                Db::name("user_whole")->where("user_id",$data['user_id'])->update($data);
                $this->success('修改成功');
            }else{
                Db::name("user_whole")->insert($data);
                $this->success('修改成功');
            }
        }
    }
    public function game_log(){
        return $this->fetch('user_log', ['list' => model('game_log')->order('log_id desc')->paginate(config('page_number'))]);
    }
    public function game_truncate()
    {
        if ($this->request->isPost()) {
            db()->query('TRUNCATE ' . config('database.prefix') . 'game_log');
            $this->success('操作成功');
        }
    }
    public function presentation_del(){
        if ($this->request->isPost()) {
            if ($this->delete('money', $this->request->param(),'monery_id') === true) {
                insert_admin_log('删除了提现日志');
                $this->success('删除成功');
            } else {
                $this->error($this->errorMsg);
            }
        }
    }
    public function user_del(){
        if ($this->request->isPost()) {
            if ($this->delete('user', $this->request->param()) === true) {
                insert_admin_log('删除了用户志');
                $this->success('删除成功');
            } else {
                $this->error($this->errorMsg);
            }
        }
    }
}
