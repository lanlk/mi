<template>
	<div id="GoodsDetail">
		<!-- 轮播图 -->
		<div class="goodsLeft">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide" v-for="item of imgArr" :key="item.id">
						<!-- <a href="/login"> -->
							<img :src="item.path" />
						<!-- </a> -->
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination" ref="bannerPage"></div>
			
				<div class="swiper-button-prev"></div>
				<!--左箭头。如果放置在swiper-container外面，需要自定义样式。-->
				<div class="swiper-button-next"></div>
				<!--右箭头。如果放置在swiper-container外面，需要自定义样式。-->
			</div>
		</div>

		<!-- 内容 -->
		<div class="goodsRight">
			<div class="goodsInfo">
				<span>{{ info.name }}</span>
				<div>
					<p class="goodsInfoExplain size16">{{ info.explain }}</p>
					<p class="orange size16">大米自营</p>
					<p class="orange size18"><b>{{ price }}</b>元</p>
				</div>
			</div>

			<div>
				<p>选择版本</p>
				<a href="javascript:;" v-for="(item, index) in versionArr" @click="chooseVer=item.configured" >
					<div class="goodsVersion" @click="changeColor(item.id, item.price)" :key="item.id" :class="activeClass ==item.id?'active':''">
						<span>{{ item.configured }} </span>
						<span> {{ item.price }}元 </span>
					</div>
				</a>
			</div>

			<div class="goodsColor">
				<p>选择颜色</p>
				<a href="javascript:;" v-for="(item, index) in colorArr" @click="chooseColor=item.color" >
					<div class="goodsVersion" @click="changeColor2(item.id)" :key="item.id" :class="activeColor ==item.id?'active':''">
						<span>{{ item.color }} </span>
					</div>
				</a>
			</div>

			<div class="goodsTotal">
				<p>{{ chooseVer + " " + chooseColor}}</p>
				<span class="size24 orange">总计 ：{{ price }}元 {{this.$route.query.id}}</span>
			</div>

			<div v-if="$store.state.userName" >
				<div class="payBtn" @click="addGoods">立即抢购</div>
			</div>
			<div v-else>
				<div class="payBtnNotLogin">登录后抢购</div>
			</div>
		</div>
	</div>
</template>

<script>
	import Swiper from "swiper";
	
	export default {
		name: "GoodsDetail",
		data: function() {
			return {
				activeClass: 0,
				activeColor: 0,
				id: this.$route.params.id,
				// id: this.$route.query.id,
				versionArr: [],
				colorArr: [],
				imgArr: [],
				info: [],
				price: '',
				chooseVer: '',
				chooseColor:''
			}
		},
		methods: {
			changeColor(k,price) {
				this.activeClass = k;
				this.price = price;
			},
			changeColor2(k) {
				this.activeColor = k;
				this.getGoodsImg(this.activeClass, k);
			},
			getGoodsImg: function(version = 0, colorId = 0) {
				//获取layout列表
				this.$http({
					url: '/api/getGoodsImg',
					params: {
						id: this.id,
						version: version,
						colorId: colorId
					}
				}).then(res => {
					// console.log(res.data.version);
					// console.log(res.data.code);
					if(res.data.code != 200){
						console.log(res.data);
						// alert('请求参数错误');
						return false;
					}
					this.info = res.data.goods[0];
					if(this.versionArr.length == 0){
						this.versionArr = res.data.version;
						this.colorArr = res.data.color;
						//设置显示的配置和颜色
						this.chooseVer = this.versionArr[0]['configured']
						this.chooseColor = this.colorArr[0]['color']
						//设置显示的价格
						this.price = this.versionArr[0]['price'];
						//设置默认选择的配置和颜色
						this.activeClass = this.versionArr[0]['id']
						this.activeColor = this.colorArr[0]['id']
					}
					// 设置循环图片
					this.imgArr = res.data.img;
					
					return true;
				}).catch(err => {
					console.log(err)
					alert('请求错误');
				});
			},
			//添加到购物车
			addGoods: function () {
				//获取layout列表
				this.$http({
					url: '/api/userCenter/addGoods',
					params: {
						goodsId: this.id,
						versionId: this.activeClass,
						colorId: this.activeColor
					}
				}).then(res => {
					if(res.data.code != 200){
						console.log(res.data);
						alert('请求参数错误');
						return false;
					}
					this.$store.commit('carAdd',1);
					location.href = "/goods";
					return true;
				}).catch(err => {
					console.log(err)
					// alert('请求错误');
				});
			}
		},
		created() {
			if(this.id){
				this.getGoodsImg();
			}
		},
		mounted() {
			var swiper = new Swiper(".swiper-container", {
				// 如果需要分页器
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				// 循环模式选项
				loop: true,
				// 如果需要前进后退按钮
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
				//spaceBetween: 30,//slide之间的距离（单位px）
				effect: 'fade', //动画模式					
				autoplay: { //自动切换
					delay: 5000, //切换间隔
					disableOnInteraction: false, //用户操作后是否停止自动切换
				},
				observer:true,//修改swiper自己或子元素时，自动初始化swiper
				observeParents:true//修改swiper的父元素时，自动初始化swiper
			});
			// 修改分页按钮位置
			// this.$refs.bannerPage.style.left = "520px";
		}
	};
</script>

<style>
	@import "../../node_modules/swiper/css/swiper.css";
	
	#GoodsDetail {
		width: 1226px;
		margin: 15px auto;
	}

	.goodsLeft {
		/* border: #00D20D solid 1px; */
		width: 560px;
		height: 560px;
		float: left;
		margin: 0;
		margin-right: 20px;
	}

	.goodsRight {
		/* border: #00D20D solid 1px; */
		width: 606px;
		/* height: 560px; */
		float: left;
	}

	.goodsRight * {
		margin-bottom: 10px;
	}

	.goodsRight>*>p {
		font-size: 18px;
	}

	.goodsRight>div {
		width: 606px;
		margin-bottom: 20px;
		float: left;
	}

	.goodsInfo {
		border-bottom: 1px solid #E0E0E0;
	}

	.goodsInfo span {
		font-size: 25px;
	}

	.goodsInfoExplain {
		color: #b0b0b0;
		margin-top: 5px;
	}

	.goodsVersion {
		width: 293px;
		height: 44px;
		text-align: center;
		line-height: 44px;
		border: #E0E0E0 1px solid;
		float: left;
		margin-right: 8px;
	}

	.active {
		border: #FF6700 1px solid;
	}

	.goodsTotal {
		background-color: #F9F9F9;
		padding-bottom: 25px;
	}

	.goodsTotal>* {
		margin: 15px 20px;
	}

	.payBtn {
		font-size: 18px;
		background-color: #FF6700;
		height: 54px;
		width: 300px;
		cursor: pointer;
		line-height: 54px;
		text-align: center;
		color: #FFFFFF;
	}
	
	.payBtnNotLogin {
		font-size: 18px;
		/* background-color: #FF6700; */
		height: 54px;
		width: 300px;
		cursor: pointer;
		line-height: 54px;
		text-align: center;
		border: #B0B0B0 1px solid;
		/* color: #FFFFFF; */
	}
	
	.swiper-container {
		width: 100%;
		height: 100%;
	}
	
	.swiper-slide {
		text-align: center;
		font-size: 18px;
		background: #fff;
	
		/* Center slide text vertically */
		display: -webkit-box;
		display: -ms-flexbox;
		display: -webkit-flex;
		display: flex;
		-webkit-box-pack: center;
		-ms-flex-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		-webkit-align-items: center;
		align-items: center;
	}
	
	.swiper-slide img {
		width: 560px;
	}
</style>
