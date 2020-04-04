<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

// use function PHPSTORM_META\type;

class IndexController extends Controller
{
    /**
     * 获取商品详情页图片
     */
    public function getGoodsImg (Request $request) {
        $id = (int)$request->input('id');
        $vertion = (int)$request->input('vertion');
        $colorId = $request->input('colorId');

        if(!$id){
            return array('code' => 100, 'message' => 'id错误');
        }

        // 获取商品信息
        $goods = DB::table('goods')->where('id',$id)->get();
        // 获取商品配置
        if(empty($version)){
            $version = DB::table('goods_version')->where('goods_id',$id)->get();
        }else{
            $version = DB::table('goods_version')->where('id',$vertion)->get();
        }
        
        // 获取商品颜色
        if(empty($colorId)){
            $color = DB::table('goods_color')->where('goods_id',$id)->get();
        }else{
            $color = DB::table('goods_color')->where('id',$colorId)->get();
        }
        
        // 获取图片
        if(empty($colorId)){
            $colorId = $color[0]->id;
        }
        $img = DB::table('img')->select('path')->where('color_id',$colorId)->get();

        return array(
            'code' => 200,
            'goods' => $goods,
            'version' => $version,
            'color' => $color,
            'img' => $img
        );

    }
}
