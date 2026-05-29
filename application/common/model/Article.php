<?php

namespace app\common\model;

use think\Model;

class Article extends Model
{
    protected $autoWriteTimestamp = true;

    public function setPhotoAttr($value)
    {
        return stored_value_encode($value);
    }

    public function getPhotoAttr($value)
    {
        return stored_value_decode($value);
    }

    public function setContentAttr($value)
    {
        return htmlspecialchars_decode($value);
    }

    public function category()
    {
        return $this->belongsTo('category', 'cid', 'id')->bind('category_name');
    }
}