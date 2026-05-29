<?php

namespace app\common\model;

use think\Model;

class Money extends Model
{
    protected $autoWriteTimestamp = true;

    public function setPasswordAttr($value)
    {
        return password_hash_compat($value);
    }
}