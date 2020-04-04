<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     // return $request->user();
//     return 'abc';
// });


Route::any('/getBanner','ImageController@getBanner');
Route::any('/getImg','ImageController@getImg');

Route::post('/registOfMe','LoginController@registOfMe');
Route::post('/loginOfMe','LoginController@loginOfMe');
Route::post('/logoutOfMe','LoginController@logoutOfMe');

Route::post('/userCenter/index','UserCenterController@index');
Route::post('/userCenter/addGoods','UserCenterController@addGoods');
Route::post('/userCenter/showGoods','UserCenterController@showGoods');
Route::post('/userCenter/changeGoods','UserCenterController@changeGoods');
Route::post('/userCenter/submitGoods','UserCenterController@submitGoods');

Route::any('/getGoodsImg','IndexController@getGoodsImg');



