<template>
	<div id="BannerCore">
		<div class="contentDiv">

			<div class="bannerList">
				<ul>
					<li @mouseenter="showList(1)" @mouseleave="listShow=false">
						<a href="javascript:;">手机 电话卡</a>
						<b>></b>
					</li>
					<li @mouseenter="showList(2)" @mouseleave="listShow=false">
						<a href="javascript:;">电视 盒子</a>
						<b>></b>
					</li>
				</ul>
			</div>

			<div class="listContent" v-show="listShow" @mouseenter="listShow=true" @mouseleave="listShow=false">
				<div>
					<div class="listContentDiv" v-for="item in listData">
						<a :href="'/goodsDetail/' + item.id">
							<img :src="item.path" />
							{{ item.name }}
						</a>
					</div>
				</div>
			</div>

			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide" v-for="item of bannerArr" :key="item.id">
						<a :href="'/goodsDetail/' + item.id">
							<img :src="item.path" />
						</a>
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
	</div>
</template>

<script>
	import Swiper from "swiper";

	export default {
		name: "BannerCore",
		data() {
			return {
				listShow: false,
				// listNum: 0,
				// bannerArr: [],
				bannerArr: [ 
					{ "id": 1, "type": 1, "title": "红米note8", "path": "http://121.37.225.165:8080/img/1.webp" }, 
					{ "id": 5, "type": 1, "title": "小米电视4c", "path": "http://121.37.225.165:8080/img/2.webp" }, 
					{ "id": 4, "type": 1, "title": "红米k30 5G", "path": "http://121.37.225.165:8080/img/3.jpg" } ,
					{ "id": 6, "type": 1, "title": "红米k30", "path": "http://121.37.225.165:8080/img/3.webp" } ,
				],
				listData: [],
				backData: []
			}
		},
		methods: {
			showList: function(n) {
				this.listShow = true;
				//减少请求次数
				if(this.backData[n]){
					this.listData = this.backData[n];
					return false;
				}
				//获取layout列表
				this.$http({
					url: '/api/getImg',
					params: {
						type: n,
					}
				}).then(res => {
					this.listData = res.data;
					this.backData[n] = res.data;
				}).catch(err => {
					console.log(err)
				});
			}
		},
		computed: {
			getImg: function(n) {
				//获取layout列表
				this.$http({
					url: '/api/getImg',
					params: {
						type: n,
					}
				}).then(res => {
					this.listData = res.data;
				}).catch(err => {
					console.log(err)
				});
			}
		},
		mounted() {
			//获取banner
			// this.$http({
			// 	url: '/api/getBanner'
			// }).then(res => {
			// 	this.bannerArr = res.data;
			// 	console.log(this.bannerArr);
				
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
				this.$refs.bannerPage.style.left = "520px";
				
			// }).catch(err => {
			// 	console.log(err)
			// });
			
			
		}
	};
	
	
</script>

<style>
	/* @import "../../assets/css/swiper.min.css"; */
	@import "../../../node_modules/swiper/css/swiper.css";

	#BannerCore {
		/* display: relative; */
	}

	.contentDiv {
		width: 1226px;
		height: 460px;
		margin: auto;
		position: relative;
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

	.bannerList {
		height: 460px;
		width: 234px;
		background: rgba(105, 107, 98, 0.4);
		position: absolute;
		z-index: 20;
	}

	.bannerList ul {
		list-style-type: none;
		padding: 0;
		margin: 20px 0px;
		color: #fff;
	}

	.bannerList li {
		width: 234px;
		line-height: 42px;
		font-size: 15px;
		display: flex;
	}

	.bannerList li:hover {
		background-color: #FF6700;
	}

	.bannerList a {
		padding-left: 25px;
		flex: 5;
	}

	.bannerList b {
		flex: 1;
	}

	.listContent {
		/* display:none; */
		position: absolute;
		left: 234px;
		z-index: 20;
		background-color: #FFFFFF;
		height: 458px;
		box-shadow: 1px 1px 3px #E0E0E0;
		border-top: 1px solid #e0e0e0;
	}

	.listContent>div {
		width: 248px;
		float: left;
		height: 460px;
		display: flex;
		flex-direction: column;
		text-align: left;
	}

	.listContentDiv {
		align-self:center;
		width: 248px;
		/* height: 76px; */
		flex: 1;
		line-height: 76px;
	}

	.listContent>div img {
		height: 40px;
		vertical-align: middle;
		/* padding-left: 55px; */
	}
	
	.listContent>div a {
		padding-left: 30px;
	}

	.swiper-button-prev,
	.swiper-button-next {
		color: #e0e0e0;
	}
	
	.swiper-button-prev:hover,
	.swiper-button-next:hover {
		background-color: #999999;
		opacity:0.3; 
	}

	.swiper-button-prev {
		left: 244px;
	}
	
	.swiper-slide img {
		width: 1226px;
	}
</style>
