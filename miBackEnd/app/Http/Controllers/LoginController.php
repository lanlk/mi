<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class LoginController extends Controller
{
    /**
     * 注册
     */
    public function registOfMe (Request $request) {
        
        $name = $request->input('name');
        $password = $request->input('password');
        
        if(!$name){
            return array('code' => 100,'message' => '账号不能为空');
            // return json_encode(array('code' => 100,'message' => '账号不能为空'));
        }
        if(mb_strlen($name) < 6 || mb_strlen($name) > 20){
            return array('code' => 100,'message' => '账号长度应该在6~20位之间');
        }
        if(preg_match("/[`~!@#$%^&*()_+<>?:\"{},.\/;'[\]·！#￥（——）：；“”‘、，|《。》？、【】]/",$name)){
            return array('code' => 100,'message' => '账号不能有特殊字符');
        }

        if(!$password){
            return array('code' => 100,'message' => '密码不能为空');
        }
        if(mb_strlen($password) < 6 || mb_strlen($password) > 20){
            return array('code' => 100,'message' => '密码长度应该在6~20位之间');
        }
        if(preg_match("/[`~!@#$%^&*()_+<>?:\"{},.\/;'[\]·！#￥（——）：；“”‘、，|《。》？、【】]/",$password)){
            return array('code' => 100,'message' => '密码不能有特殊字符');
        }

        if( DB::table('users')->where('name','=',$name)->value('id') ){
            return array('code' => 100,'message' => '用户已存在');
        }

        //用户数据入库
        $user = new User();
        $user->name = $name;
        $user->password = bcrypt($password);
        $user->save();

        // 登录
        return $this->loginCore($name, $password);
    }

    /**
     * 登录
     */
    public function loginOfMe (Request $request) {

        $name = $request->input('name');
        $password = $request->input('password');
        
        if(!$name){
            return array('code' => 100,'message' => '账号不能为空');
            // return json_encode(array('code' => 100,'message' => '账号不能为空'));
        }
        if(mb_strlen($name) < 6 || mb_strlen($name) > 20){
            return array('code' => 100,'message' => '账号长度应该在6~20位之间');
        }
        if(preg_match("/[`~!@#$%^&*()_+<>?:\"{},.\/;'[\]·！#￥（——）：；“”‘、，|《。》？、【】]/",$name)){
            return array('code' => 100,'message' => '账号不能有特殊字符');
        }

        if(!$password){
            return array('code' => 100,'message' => '密码不能为空');
        }
        if(mb_strlen($password) < 6 || mb_strlen($password) > 20){
            return array('code' => 100,'message' => '密码长度应该在6~20位之间');
        }
        if(preg_match("/[`~!@#$%^&*()_+<>?:\"{},.\/;'[\]·！#￥（——）：；“”‘、，|《。》？、【】]/",$password)){
            return array('code' => 100,'message' => '密码不能有特殊字符');
        }

        return $this->loginCore($name, $password);
    }

    /**
     * 登录核心动作
     */
    private function loginCore($name, $password) {
        //登录,生成 JWT token
        $token = JWTAuth::attempt(array('name'=>$name,'password'=>$password));
        if( !$token ){
            return array('code' => 100,'message' => '登录失败');
        }

        //解析token获取user数据
        // $this->user = JWTAuth::parseToken()->authenticate($token);

        //获取用id
        $id = DB::table('users')->where('name', $name)->value('id');

        //查询购物车
        $where = array(
            ['user_id','=',$id],
            ['status','=',1]
        );
        $goodsNum = DB::table('shopping_cart')->where($where)->sum('number');
        
        return array('code' => 200,'message' => '登录成功','data'=>array('name'=>$name,'token'=>$token,'goodsNum'=>$goodsNum));
    }

    /**
     * 登出
     */
    public function logoutOfMe(Request $request)
    {
        $token = JWTAuth::parseToken()->getToken();
        try {
            JWTAuth::parseToken()->invalidate($token);
            // JWTAuth::invalidate($request->token);
            return array('code' => 200,'message' => '登出成功');
        } catch (JWTException $exception) {
            // return response()->json([
            //     'success' => false,
            //     'message' => 'Sorry, the user cannot be logged out'
            // ], 500);
            return array('code' => 100,'message' => '登出失败');
        }
    }

}
