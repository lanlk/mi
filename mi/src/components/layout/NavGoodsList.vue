<template>
	<div id="NavGoodsList">
		<div v-for="item in list" :key="item.id">
			<a :href="'/goodsDetail/' + item.id">
				<img :src="item.path" />
				<p>{{ item.title }}</p>
				<p class="orange">{{ item.price }}元</p>
			</a>
		</div>
		
	</div>
</template>

<script>
	export default {
		name: "NavGoodsList",
		props: ['type','secondType'],
		data: function() {
			return {
				list: [],
				oldType: 0,
				oldSecondType: 0,
				backData: []
			}
		},
		methods: {
			getImg() {
				//直接用二维数组当一维的下标不存在时会出问题，所以这里下标用一维数组
				let num = this.type * 100 + this.secondType;
				if(this.backData.length != 0 && this.backData[num]){
					this.list = this.backData[num];
					return;
				}
				
				//获取layout列表
				this.$http({
					url: '/api/getImg',
					params: {
						type: this.type,
						secondType : this.secondType
					}
				}).then(res => {
					this.list = res.data;
					//避免重复请求而记录数据(无效)
					this.backData[num] = res.data;
				}).catch(err => {
					console.log(err)
				});
			}
		},
		watch: {
			// 如果 `type` 发生改变，这个函数就会运行
			// type: function (newQuestion, oldQuestion) {
			secondType() {
				if(this.oldType == this.type){
					this.getImg();
				}
			},				
			type() {
				this.oldType = this.type;
				this.getImg();
			}			
		},
		mounted() {

		}
	}
</script>

<style>
	#NavGoodsList {
		display: flex;
		height: 100%;
		width: 1226px;
		text-align: center;
		margin: 0 auto;
		background-color: #FFFFFF;
		/* line-height:230px; */
	}

	#NavGoodsList>div {
		flex: 1;
		/* text-align: center; */
		margin: auto 0;
	}

	#NavGoodsList>div img {
		vertical-align: middle;
		/* width: 160px; */
		height: 110px;
	}

	#NavGoodsList>div:nth-child(n+2) {
		border-left: #e0e0e0 1px solid;
	}
</style>
