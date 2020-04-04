<template>
	<div id="head-layout">
		<!-- 顶部导航栏 -->
		<div class="headTop">
			<div class="headTopDiv">
				<div>
					<a href="/">商场首页</a>
					<!-- <a href>下载app</a> -->
				</div>
				<div class="shoppingCart" @mouseenter="showGoodsCart" @mouseleave="shoppingCartShow=false">
					<a href="javascript:;">购物车 ({{$store.state.goodsNum}})</a>
				</div>
				<div v-if="$store.state.userName">
					<a href="/userCenter">{{$store.state.userName}}</a>
					<a href="javascript:;" @click="logout">登出</a>
				</div>
				<div v-else>
					<a href="/login">登录</a>
					<a href="/registers">注册</a>
				</div>

				<div class="shoppingList" v-show="shoppingCartShow" @mouseenter="shoppingCartShow=true" @mouseleave="shoppingCartShow=false" >
					<div class="shoppingContent" v-if="$store.state.userName">
						<!-- <div class="goods" v-for="item in goodsCart" v-model="totalPrice = totalPrice + item.price * item.number"> -->
						<div class="goods" v-for="item in goodsCart">
							<img :src="item.path" />
							<span>
								{{ item.name }}
								<br />
								{{ item.configured }}
							</span>
							<div>
								<span>{{item.price}}元</span> x
								<span>{{item.number}}</span>
								<span>
									<!-- <a href="javascript:;">X</a> -->
								</span>
							</div>
						</div>
					</div>
					
					<div class="shoppingCount" v-if="$store.state.userName" >
						<div>
							<p>
								共
								<font>{{$store.state.goodsNum}}</font> 件商品
							</p>
							<p class="ogange">
								<font>{{totalPrice}}</font>元
							</p>
						</div>
						<div>
							<a href="/goods">
								<button>去购物车结算</button>
							</a>
						</div>
					</div>
					<div class="shoppingCount" v-else >
						<div style="text-align: center;">
							登录后显示购物车内容
						</div>
					</div>
					
				</div>
			</div>
		</div>

		<!-- logo及顶部分类菜单 -->
		<div class="navlogo">
			<div class="navlogoMenu">
				<div>
					<a href="/">
						<img src="@/assets/layout/logo.png" />
					</a>
				</div>
				<div @mouseleave="divHidden=false">
					<a @mouseover="changeDiv(1,1)" href="javascript:;">小米手机</a>
					<a @mouseover="changeDiv(1,2)" href="javascript:;">红米手机</a>
					<a @mouseover="changeDiv(2,1)" href="javascript:;">电视</a>
				</div>
				<div class="navSearch">
					<input type="text" placeholder="搜索未实现" />
					<input type="submit" value />
				</div>
			</div>
		</div>

		<!-- 隐藏的商品列表 -->
		<div class="navGoods" v-show="divHidden" @mouseenter="divHidden=true" @mouseleave="divHidden=false">
			<!-- <keep-alive> -->
			<!-- <nav-goods-list :show-div="type" :key="type"/> -->
			<nav-goods-list :type="type" :secondType="secondType" />
			<!-- </keep-alive> -->
		</div>
	</div>
</template>

<script>
	import NavGoodsList from "@/components/layout/NavGoodsList";

	export default {
		name: "HeadLayout",
		data() {
			return {
				divHidden: false,
				type: 0,
				secondType: 0,
				shoppingCartShow: false,
				goodsCart: [],
				totalPrice: 0
			};
		},
		components: {
			NavGoodsList
		},
		methods: {
			changeDiv(type, secondType) {
				this.type = type;
				this.secondType = secondType;
				this.divHidden = true;
				// console.log(this.type);
				// console.log(this.secondType);
			},
			logout() {
				//获取layout列表
				this.$http({
					url: '/api/logoutOfMe',
					params: {
						// token: this.$store.state.token
					}
				}).then(res => {
					// this.$store.commit('logout');
					if(res.data.code != 200){
						console.log(res.data.message);
						return false;
					}
					// console.log(res.data);
					this.$store.commit('logout');
					location.href = "/";
				}).catch(err => {
					console.log(err)
				});
			},
			showGoodsCart() {
				this.shoppingCartShow = true
				if(!this.$store.state.userName)return
				
				//获取购物车数据
				this.$http({
					url: '/api/userCenter/showGoods',
					params: {
						// token: this.$store.state.token
					}
				}).then(res => {
					if(res.data.code != 200){
						console.log(res.data.message);
						return false;
					}
					//计算购物车总价
					this.totalPrice = 0
					for(let i=0; i<res.data.data.length; i++){
						this.totalPrice += res.data.data[i].price * res.data.data[i].number
					}
					
					this.goodsCart = res.data.data;
				}).catch(err => {
					console.log(err)
				});
			},
			// watch: {
				// 如果 `type` 发生改变，这个函数就会运行
				// type: function (newQuestion, oldQuestion) {
					
				// }			
			// }
			
		}
	};
</script>

<style>
	#head-layout {
		min-width: 1226px;
	}

	.headTop {
		background-color: #333333;
		height: 40px;
	}

	.headTopDiv {
		width: 1226px;
		text-align: center;
		line-height: 40px;
		margin: 0 auto;
		font-size: 12px;
		color: #b0b0b0;
		position: relative;
	}

	.headTopDiv>div a {
		margin: 5px;
	}

	.headTopDiv>div a:hover {
		color: #ffffff;
	}

	.headTopDiv> :first-child {
		float: left;
	}

	.headTopDiv> :nth-child(n + 2) {
		float: right;
	}

	.shoppingCart {
		width: 120px;
		background-color: #424242;
		height: 40px;
		color: #ffffff;
		margin-left: 15px;
	}

	/* .shoppingCart img{
	width: 25px;
	vertical-align: -7px;
	margin: 0px 5px;
} */

	.shoppingCart:hover {
		background-color: #ff6700;
	}

	.navlogo {
		width: 100%;
	}

	.navlogoMenu {
		height: 100px;
		width: 1226px;
		margin: 0 auto;
		line-height: 100px;
	}

	.navlogoMenu>div {
		height: 100%;
	}

	.navlogoMenu>div:nth-child(1) {
		float: left;
		width: 243px;
	}

	.navlogoMenu>div:nth-child(1) img {
		width: 55px;
		position: relative;
		top: 20%;
	}

	.navlogoMenu>div:nth-child(2) {
		float: left;
		width: 680px;
	}

	.navlogoMenu>div:nth-child(2) a {
		margin: 7px;
	}

	.navlogoMenu>div:nth-child(2) a:hover {
		color: #ff6700;
	}

	.navlogoMenu>div:nth-child(3) {
		float: right;
		width: 296px;
	}

	/* 搜索框 */
	.navSearch {
		height: 100%;
		width: 25%;
		float: left;
		display: flex;
		justify-content: flex-end;
		align-items: center;
	}

	.navSearch input[type="text"] {
		height: 46px;
		width: 245px;
		padding-left: 10px;
		border: 1px solid #e0e0e0;
	}

	.navSearch input[type="submit"] {
		height: 50px;
		width: 50px;
		background-color: #ffffff;
		border: 1px solid #e0e0e0;
		border-left: 0px;
		background-image: url("../../assets/layout/search.png");
		background-repeat: no-repeat;
		background-position: center;
		background-size: 25px 25px;
	}

	.navSearch input[type="submit"]:hover {
		background-color: #ff6700;
		cursor: pointer;
	}

	.navGoods {
		width: 100%;
		height: 230px;
		border-top: 1px solid #b0b0b0;
		box-shadow: 0px 2px 5px #e0e0e0;
		position: absolute;
		z-index: 21;
	}

	.shoppingList {
		width: 316px;
		max-height: 519px;
		background-color: #ffffff;
		border: #e0e0e0 1px solid;
		position: absolute;
		right: 0px;
		top: 40px;
		z-index: 22;
		/* display: none; */
		color: black;
	}

	/* .shoppingList:hover {
	display: inline;
} */

	.shoppingList img {
		width: 25px;
		vertical-align: -7px;
		margin: 0px 5px;
	}

	.shoppingContent {
		width: 100%;
		max-height: 446px;
		overflow: scroll;
		overflow-x: hidden;
	}

	.goods {
		float: left;
		display: flex;
		font-size: 12px;
		width: 90%;
		height: 80px;
		margin-left: 15px;
		line-height: normal;
	}

	.goods>span {
		flex: 3;
		margin: auto;
	}

	.goods>img {
		flex: 1;
		height: 60px;
		margin: auto;
		/* vertical-align: middle; */
	}

	.goods>div {
		flex: 2;
		margin: auto;
	}

	.goods>div :last-child {
		color: red;
		visibility: hidden;
	}

	.goods:hover>div :last-child {
		visibility: visible;
	}

	.goods:nth-child(n + 2) {
		border-top: #e0e0e0 1px solid;
	}

	.shoppingCount {
		width: 100%;
		height: 73px;
		display: flex;
		line-height: normal;
		background-color: #fafafa;
	}

	.shoppingCount div {
		flex: 1;
		margin: auto 0px;
	}

	.shoppingCount div:first-child {
		text-align: left;
		padding-left: 25px;
	}

	.shoppingCount button {
		height: 40px;
		width: 123px;
		background-color: #ff6700;
		border: 0px;
		color: #ffffff;
		margin: auto;
	}

	.shoppingCount .ogange {
		font-size: 23px;
		color: #ff6700;
	}
</style>
