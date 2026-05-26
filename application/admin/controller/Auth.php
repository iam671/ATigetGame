<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;

class Auth extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();
    }
    public function game()
    {
        $fruits=db('game')->select();
        $luck=db('luck')->select();
        $size=Db::name("size")->select();
        $whole=Db::name("whole")->where("whole_id",1)->find();
        return $this->fetch("game",['fruits'=>$fruits,'luck'=>$luck,'size'=>$size,'whole'=>$whole]);
    }
    public function auto()
    {
        $insertId = db('authRule')->insertGetId([
            'pid' => 3,
            'name' => '数据管理',
            'url' => 'admin/column/index',
            'icon' => 'fa fa-th-list',
            'type' => 'nav',
        ]);
        db('authRule')->insertAll([
            [
                'pid' => $insertId,
                'name' => '还原',
                'url' => 'admin/database/import',
                'type' => 'nav',
            ],
            [
                'pid' => $insertId,
                'name' => '备份',
                'url' => 'admin/database/backup',
                'type' => 'auth',
            ],
            [
                'pid' => $insertId,
                'name' => '优化',
                'url' => 'admin/database/optimize',
                'type' => 'auth',
            ],
            [
                'pid' => $insertId,
                'name' => '修复',
                'url' => 'admin/database/repair',
                'type' => 'auth',
            ],
            [
                'pid' => $insertId,
                'name' => '下载',
                'url' => 'admin/database/download',
                'type' => 'auth',
            ],
            [
                'pid' => $insertId,
                'name' => '删除',
                'url' => 'admin/database/del',
                'type' => 'auth',
            ],
        ]);
    }

    public function group()
    {
        return $this->fetch('group', ['list' => model('authGroup')->paginate(config('page_number'))]);
    }

    public function addGroup()
    {
        if ($this->request->isPost()) {
            if ($this->insert('authGroup', $this->request->param()) === true) {
                insert_admin_log('添加了用户组');
                $this->success('添加成功', url('admin/auth/group'));
            } else {
                $this->error($this->errorMsg);
            }
        }
        $authRule = collection(model('authRule')->where(['status' => 1])->order('sort_order asc')->select())->toArray();
        foreach ($authRule as $k => $v) {
            // $authRule[$k]['open'] = true;
        }
        return $this->fetch('saveGroup', ['authRule' => json_encode(list_to_tree($authRule))]);
    }

    public function editGroup()
    {
        if ($this->request->isPost()) {
            if ($this->update('authGroup', $this->request->param(), input('_verify', true)) === true) {
                insert_admin_log('修改了用户组');
                $this->success('修改成功', url('admin/auth/group'));
            } else {
                $this->error($this->errorMsg);
            }
        }
        $data     = model('authGroup')->where('id', input('id'))->find();
        $authRule = collection(model('authRule')->where(['status' => 1])->order('sort_order asc')->select())->toArray();
        foreach ($authRule as $k => $v) {
            // $authRule[$k]['open'] = true;
            $authRule[$k]['checked'] = in_array($v['id'], explode(',', $data['rules']));
        }
        return $this->fetch('saveGroup', ['data' => $data, 'authRule' => json_encode(list_to_tree($authRule))]);
    }

    public function delGroup()
    {
        if ($this->request->isPost()) {
            if ($this->delete('authGroup', $this->request->param()) === true) {
                insert_admin_log('删除了用户组');
                $this->success('删除成功');
            } else {
                $this->error($this->errorMsg);
            }
        }
    }

    public function rule()
    {
        $authRule = collection(model('authRule')->where(['status' => 1])->order('sort_order asc')->select())->toArray();
        foreach ($authRule as $k => $v) {
            // $authRule[$k]['open'] = true;
        }
        return $this->fetch('rule', ['authRule' => json_encode(list_to_tree($authRule))]);
    }

    public function addRule()
    {
        if ($this->request->isPost()) {
            if ($this->insert('authRule', $this->request->param()) === true) {
                insert_admin_log('添加了权限规则');
                $this->success('添加成功', url('admin/auth/rule'));
            } else {
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('saveRule');
    }

    public function editRule()
    {
        if ($this->request->isPost()) {
            if ($this->update('authRule', $this->request->param()) === true) {
                insert_admin_log('修改了权限规则');
                $this->success('修改成功', url('admin/auth/rule'));
            } else {
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('saveRule', ['data' => model('authRule')->where('id', input('id'))->find()]);
    }

    public function delRule()
    {
        if ($this->request->isPost()) {
            model('authRule')->where('pid', input('id'))->count() && $this->error('请先删除子节点');
            if ($this->delete('authRule', $this->request->param()) === true) {
                insert_admin_log('删除了权限规则');
                $this->success('删除成功');
            } else {
                $this->error($this->errorMsg);
            }
        }
    }
    public function game_id(){
        if ($this->request->isPost()) {
           $data=$this->request->param();
            foreach ($data as $key=>$value){
                $save[]=array('game_id'=>substr($key,5),'v'=>$value['v'],'multiple_rate'=>$value['multiple_rate']);
            }
            if($this->saveAll('game', $save, false)===true){
                clear_cache();
                insert_admin_log('更新水果概率设置');
                $this->success('保存成功');
            }else{
                $this->error($this->errorMsg);
            }

        }
    }
    public function luck_id(){
        if ($this->request->isPost()) {
            $data=$this->request->param();
            $size=$data['size'];
            unset($data['size']);
            Db::name('size')->where("size_id",1)->update(array("v"=>$size));
            $save=array();
            foreach ($data as $key=>$vlue){
                $save[]=array('luck_id'=>substr($key,5),'v'=>$vlue['v']);
            }
            if($this->saveAll('luck', $save, false)===true){
                clear_cache();
                insert_admin_log('更新玩法的概率设置');
                $this->success('保存成功');
            }else{
                $this->error($this->errorMsg);
            }

        }
    }
    public function whole(){
        if ($this->request->isPost()) {
            $data = $this->request->param();
            Db::name("whole")->where("whole_id",1)->update($data);
            $this->success('保存成功');
        }
    }
}
