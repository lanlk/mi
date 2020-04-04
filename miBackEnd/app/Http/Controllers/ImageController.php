<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ImageController extends Controller
{
    /**
     * 获取banner
     */
    public function getbanner() {
        return DB::table('img')->where('type',3)->get();
    }

    /**
     * 获取图片
     */
    public function getImg(Request $request) {
        $type = $request->input('type');
        $secondType = $request->input('secondType');

        $where = array();
        $where[] = ['goods.type','=',$type];
        if(!empty($secondType)) {
            $where[] = ['goods.second_type','=',$secondType];
        }

        return DB::table('goods')
            ->select('goods.*','img.path','goods_version.price')
            ->leftJoin('img', 'goods.id', '=', 'img.goods_id')
            ->leftJoin('goods_version', 'goods.id', '=', 'goods_version.goods_id')
            ->where($where)
            ->groupBy('goods.id')
            ->get();
    }
    
    public function a (){
        return 123;
    }

}
