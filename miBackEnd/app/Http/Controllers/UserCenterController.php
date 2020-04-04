<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class UserCenterController extends Controller
{
    public function __construct(Request $request)
    {
        //解析token数据
        $token = JWTAuth::parseToken()->getToken();
        $this->user = JWTAuth::parseToken()->authenticate($token);
        //token过期或者获取不到时不允许进入用户中心，注意构造函数无法return中断程序

    }

    /**
     * 用户中心
     */
    public function index() {
        // 查询数量
        // return DB::table('shopping_cart')
        //         ->where(array(
        //             ['user_id',$this->user['id']],
        //             ['status',2])
        //         )
        //         ->get();

        $where = array(
            ['shopping_cart.user_id' , '=',$this->user['id']],
            ['shopping_cart.status' , '=',2]
        );

        return DB::table('shopping_cart')
                ->leftJoin('goods_version','shopping_cart.version_id','=','goods_version.id')
                ->leftJoin('goods_color','shopping_cart.color_id','=','goods_color.id')
                ->leftJoin('img','img.color_id','=','goods_color.id')
                ->select('shopping_cart.id','img.path', 'goods_version.version_name as name', 'goods_version.price', 'goods_version.configured', 'goods_color.color','shopping_cart.number')
                ->where($where)
                ->groupBy('shopping_cart.version_id','shopping_cart.color_id')
                ->get();
    }

    /**
     * 添加商品到购物车
     */
    public function addGoods(Request $request) {
        // return $this->user;
        $goodsId = (int)$request->input('goodsId');
        $versionId = (int)$request->input('versionId');
        $colorId = (int)$request->input('colorId');

        if(!$this->user['id'] || !$goodsId || !$colorId){
            return array('code' => 100,'message' => '参数错误');
        }

        $result = DB::table('shopping_cart')->insert([
            'user_id' => $this->user['id'], 
            'goods_id' => $goodsId,
            'version_id' => $versionId,
            'color_id' => $colorId,
            'status' => 1,
            'created_at' => date('Y-m-d H:i:s')
        ]);

        if($result){
            return array('code' => 200,'message' => '数据录入成功');
        }
        return array('code' => 100,'message' => '插入数据失败');
    }

    /**
     * 展示购物车
     */
    public function showGoods () {
        $where = array(
            ['shopping_cart.user_id' , '=',$this->user['id']],
            ['shopping_cart.status' , '=',1]
        );
        // return $where;

        //查询购物车重新计算总数
        $goodsWhere = array(
            ['user_id','=',$this->user['id']],
            ['status','=',1]
        );
        $goodsNum = DB::table('shopping_cart')->where($goodsWhere)->sum('number');

        $data =  DB::table('shopping_cart')
                ->leftJoin('goods_version','shopping_cart.version_id','=','goods_version.id')
                ->leftJoin('goods_color','shopping_cart.color_id','=','goods_color.id')
                ->leftJoin('img','img.color_id','=','goods_color.id')
                ->select('shopping_cart.id','img.path', 'goods_version.version_name as name', 'goods_version.price', 'goods_version.configured', 'goods_color.color','shopping_cart.number')
                ->where($where)
                ->groupBy('shopping_cart.version_id','shopping_cart.color_id')
                ->get();

        return array('code' => 200,'data' => $data,'goodsNum' => $goodsNum);
    }

    /**
     * 修改购物车
     */
    public function changeGoods (Request $request)  {
        $id = (int)$request->input('id');
        $type = (int)$request->input('type');

        if(empty($this->user['id']) || !$id){
            return array('code' => 100,'message' => '请求数据错误');
        }

        // 查询数量
        $num = DB::table('shopping_cart')->where(array(['id',$id],['user_id',$this->user['id']]))->value('number');
        // 预设sql
        $result = DB::table('shopping_cart')
                    ->where([
                        ['id',$id],
                        ['user_id',$this->user['id']]
                    ]);

        // type 0删除 1增加 2减少
        if($type == 0){ 
            if(empty($num)){
                return array('code' => 100,'message' => '数据异常');
            }
            $result = $result->update(['status'=>0]);
        }elseif($type == 1){
            if($num == 9){
                return array('code' => 100,'message' => '数量不能大于9');
            }
            $result = $result->increment('number', 1);;
        }else{
            if($num == 1){
                return array('code' => 100,'message' => '数量不能小于1');
            }
            // $update = array('number','number-1');
            $result = $result->decrement('number', 1);
        }

        if(!$result){
            return array('code' => 100,'message' => '数据操作失败');
        }

        return $this->showGoods();
    }

    /**
     * 提交购物车（暂时只显示购物车列表中待支付项目）
     */
    public function submitGoods(Request $request) {
        $checkList = $request->input('checkList');
        if(empty($checkList)){
            return array('code' => 100,'message' => '参数异常');
        }

        // 查询数量
        $num = DB::table('shopping_cart')
                ->where(array(['user_id',$this->user['id']],['status',1]))
                ->whereIn('id',$checkList)
                ->count();
        if(!$num){
            return array('code' => 100,'message' => '数据异常');
        }
        
        $result = DB::table('shopping_cart')
                    ->where([
                        ['status',1],
                        ['user_id',$this->user['id']]
                    ])
                    ->whereIn('id',$checkList)
                    ->update([
                        'status'=>2 ,
                        'updated_at' => date("Y-m-d H:i:s")
                    ]);
    
        if($result){
            return array('code' => 200,'message' => '成功');
        }
        return array('code' => 100,'message' => '数据修改失败');
    }
}
