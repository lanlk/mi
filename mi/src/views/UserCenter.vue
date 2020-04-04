<template>
	<div id="UserCenter">
		<div class="backgroundDiv">
			<div class="centerDiv">
				<div class="menuAddress">首页 > 交易订单</div>
				<div class="centerLeft">
					<ul>
						<li>订单中心</li>
						<li>
							<a href="javascript:;">我的订单</a>
						</li>
					</ul>
				</div>
				<div class="centerRight">
					<div class="centerContent">
						<div>
							<h1>我的订单</h1>
						</div>
						<div class="orderClick">
							<div class="orderSpan">
								<span>全部有效订单</span> |
								<span>待支付（{{this.totalnum}}）</span> |
								<span>待收货</span> |
								<span>订单回收站</span>
							</div>
							<div class="centerSearch">
								<input type="text" placeholder="搜索未完成" />
								<input type="submit" value />
							</div>
						</div>
						<div class="orderDetail">
							<div>
								<p class="ogange">等待付款</p>
								<p>
									<span>
										在线支付
										<!-- 2020年01月27日 19:49|蓝生|订单号： 5200127745202084|在线支付 -->
									</span>
									<span class="orderMoney">
										应付金额：
										<font>{{totalPrice}}</font> 元
									</span>
								</p>
							</div>
							
							<div class="orderMsg" v-for="(item,index) in orderList" >
								<div>
									<img :src="item.path" />
								</div>
								<div class="orderMsgName">
									<p>{{item.name}} {{item.configured}} {{item.color}}</p>
									<p>
										<span>{{item.price}}</span>元 ×
										<span>{{item.number}}</span>
									</p>
								</div>
								<div class="orderMsgPay">
									<button v-if="index == 0">立即付款</button>
								</div>
							</div>
							
						</div>
						<!-- <div class="pageDiv">
							<div>
								<</div> <div class="pageNumber">
									<div>1</div>
									<div>2</div>
									<div>3</div>
							</div>
							<div>></div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		name: "UserCenter",
		data:() => {
			return {
				totalPrice: 0,
				totalnum: 0,
				orderList: []
			}
		},
		methods:{
			
		},
		created() {
			//获取订单列表
			this.$http({
				url: '/api/userCenter/index',
				params: {
					// 就是是空也要写，否则token添加不到这来
					// token: this.$store.state.token
				}
			}).then(res => {
				// console.log(res.data);
				this.orderList = res.data;
				
				for(let val of this.orderList){
					this.totalPrice += val.price * val.number
					this.totalnum += val.number
				}
				
			}).catch(err => {
				alert('未知错误');
				console.log(err)
			});
		},
		beforeCreate() {
			if(!this.$store.state.userName) {
				location.href = "/login";
			}
		}
	};
</script>

<style>
	.backgroundDiv {
		background-color: #F5F5F5;
		overflow: hidden;
	}

	.centerDiv {
		width: 1226px;
		margin: auto;

	}

	.menuAddress {
		float: left;
		width: 100%;
		height: 40px;
		line-height: 40px;
	}

	.centerLeft {
		background-color: #FFFFFF;
		width: 234px;
		float: left;
		margin-bottom: 20px;
	}

	.centerLeft ul {
		list-style-type: none;
		font-size: 14px;
		margin: 20px 0px;
	}

	.centerLeft ul>li:first-child {
		font-size: 18px;
	}

	.centerLeft ul li {
		margin: 10px 0px;

	}

	.centerLeft>ul>li:nth-child(n+2) {
		color: #757575;
	}

	.centerLeft>ul li:nth-child(n+2) a:hover {
		color: #FF6700;
	}

	.centerRight {
		background-color: #FFFFFF;
		width: 978px;
		float: right;
		margin-bottom: 20px;
	}

	.centerContent {
		width: 882px;
		margin: 10px auto;

	}
	
	.orderClick {
		height: 56px;
		display: flex;
		align-items: center;
		font-size: 16px;
	}

	.orderClick span {
		margin-right: 15px;
	}

	.orderClick span:nth-child(n+2) {
		margin-left: 15px;
	}

	.orderClick span:hover {
		color: #FF6700;
	}

	.orderClick>div:first-child {
		flex: 2;
	}

	.centerSearch {
		flex: 1;
		display: flex;
		justify-content: flex-end;
	}

	.centerSearch input[type="text"] {
		height: 40px;
		width: 245px;
		padding-left: 10px;
		border: 1px solid #e0e0e0;
	}

	.centerSearch input[type="submit"] {
		height: 44px;
		width: 44px;
		padding-left: 10px;
		border: 1px solid #e0e0e0;
		border-left: 0px;
		background-image: url(../assets/layout/search.png);
		background-repeat: no-repeat;
		background-position: center;
		background-size: 25px 25px;
		background-color: #FFFFFF;
	}

	.orderDetail>div:first-child {
		height: 112px;
		border: #FF6700 1px solid;
		background-color: #FFFAF7;
		line-height: 20px;
	}

	.orderDetail>div:first-child p {
		margin: 20px;
	}

	.orderMsg {
		height: 112px;
		border: #FF6700 1px solid;
		/* border-top: 0px; */
		/* border-bottom: 0px; */
		border-top-width: 0px;
		border-bottom-width: 0px;
		display: flex;
		align-items: center;
		text-align: center;
	}
	
	.orderMsg:last-child {
		border-bottom: #FF6700 1px solid;
	}

	.orderMoney {
		float: right;
	}

	.orderMoney font {
		font-size: 28px;
	}

	.orderMsg img {
		height: 80px;
		width: 80px;
	}

	.orderMsg>div:first-child {
		flex: 1;
	}

	.orderMsgName {
		flex: 4;
		text-align: initial;
	}

	.orderMsgPay {
		flex: 1;
	}

	.orderMsgPay button {
		height: 30px;
		width: 120px;
		background-color: #FF6700;
		color: #FFFFFF;
		border-width: 0px;
	}

	.pageDiv {
		text-align: center;
		height: 50px;
		margin: 5px;

	}

	.pageDiv>div {
		display: inline-block;
		height: 35px;
	}

	.pageDiv>div:first-child,
	.pageDiv>div:last-child {
		border-width: 0px;
		width: 35px;
		font-size: 30px;
	}

	.pageNumber {
		position: relative;
		top: 25%;
	}

	.pageNumber div {
		float: left;
		border: #000000 1px solid;
		height: 25px;
		width: 35px;
		margin: 0px 5px;
	}

	.orderSpan span {
		cursor: pointer;
	}
</style>
