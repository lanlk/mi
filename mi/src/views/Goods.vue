<template>
	<div id="Goods">
		<div class="goodsDiv">
			<div class="goodsTitle">
				<div>
					<input type="checkbox" @click="allChoose" ref="allCheck"/>
					全选
				</div>
				<div class="goodsTitleName">商品名称</div>
				<div>单价</div>
				<div class="goodsTitleNum">数量</div>
				<div>小计</div>
				<div>操作</div>
			</div>

			<div class="goodsList" v-for="item in goodsList" :key="item.id">
				<div><input type="checkbox" @click="chooseBox(item)" :ref="'choose'+item.id"/></div>
				<div class="goodsTitleName">
					<img :src="item.path"/>
					{{ item.name }} {{ item.configured }} {{ item.color }}
				</div>
				<div>{{item.price}}元</div>
				<div class="goodsTitleNum">
					<div class="numInput">
						<div @click="goosChange(item.id,2,item)">
							<b>-</b>
						</div>
						<div>
							<input type="text" :value="item.number" :ref="item.id" />
						</div>
						<div @click="goosChange(item.id,1,item)">
							<b>+</b>
						</div>
					</div>
				</div>
				<div>{{item.price * item.number}}元</div>
				<div>
					<div class="goodsDelete" @click="goosChange(item.id,0,item)">
						x
					</div>
				</div>
			</div>
			
			<div class="goodsDivision"></div>

			<div class="goodsPay">
				<div class="goodsPayTotal">
					<div>
						共 <span class="orange">{{$store.state.goodsNum}}</span> 件商品，
						已选择 <span class="orange">{{chooseNum}}</span> 件商品
					</div>
					<div>
						合计：<span class="orange">{{totalPrice}}</span> 元
					</div>
				</div>
				<div class="goodsPayBtn" @click="submitGoods">
					去结算
				</div>
			</div>
			
		</div>
		<div style="height: 55px;"></div>
	</div>
</template>

<script>
	export default {
		name: "Goods",
		data() {
			return {
				goodsList: [],
				totalPrice: 0,
				chooseNum: 0,
				goodsIdList: [],
				checkList: [],
				//全选商品时的商品总价及总数
				total:0,
				totalNum: 0
			}
		},
		methods:{
			showGoodsList: function () {
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
					
					//更新商品id列表
					let listArr = []
					res.data.data.forEach(function(item, index) {
						listArr.push(item.id);
					});
					this.goodsIdList = listArr
					
					//计算购物车总价及总数
					this.total = 0
					this.totalNum = 0
					for(let i=0; i<res.data.data.length; i++){
						this.total += res.data.data[i].price * res.data.data[i].number
						this.totalNum += res.data.data[i].number
					}
					
					this.goodsList = res.data.data;
					//更新购物车总数
					this.$store.commit('updateGoodsNun',res.data.goodsNum);
					
					
				}).catch(err => {
					console.log(err)
				});
			},
			goosChange(id, type, item) {
				//数量不能小于0
				if(type == 2 && this.$refs[id][0].value == 1){
					alert("数量不能小于1")
					return
				}
				
				//数量不能大于9
				if(type == 1 && this.$refs[id][0].value == 9){
					alert("数量不能大于9")
					return
				}
				
				//删除
				if(type == 0 && !confirm('是否删除该商品?')){
					return
				}
				
				//修改购物车数据并重新获取购物车数据
				this.$http({
					url: '/api/userCenter/changeGoods',
					params: {
						id: id,
						type: type
					}
				}).then(res => {
					if(res.data.code != 200){
						console.log(res.data.message);
						alert(res.data.message);
						return false;
					}
					
					//更新商品id列表
					let listArr = []
					res.data.data.forEach(function(item, index) {
						listArr.push(item.id);
					});
					this.goodsIdList = listArr
					
					//计算购物车总价及总数
					this.total = 0
					this.totalNum = 0
					for(let i=0; i<res.data.data.length; i++){
						this.total += res.data.data[i].price * res.data.data[i].number
						this.totalNum += res.data.data[i].number
					}					
					
					this.goodsList = res.data.data;
					//更新购物车总数
					this.$store.commit('updateGoodsNun',res.data.goodsNum);
					// 当选框被选中时需要增减统计数据
					if(this.$refs['choose'+id][0].checked){
						if(type == 1){
							this.chooseNum += 1
							this.totalPrice += parseInt(item.price)
						}else if(type == 2){
							this.chooseNum -= 1
							this.totalPrice -= parseInt(item.price)
						}else{
							this.chooseNum -= item.number
							this.totalPrice -= parseInt(item.price)*item.number
							// 删除选中数组中的id
							this.checkList.splice( this.checkList.indexOf(item.id) , 1 );
						}
					}
					
					//更新商品id列表
					// let listArr = []
					// res.data.data.forEach(function(item, index) {
					// 	listArr.push(item.id);
					// });
					// this.goodsIdList = listArr
				}).catch(err => {
					console.log(err)
				});
			},
			//选框动作
			chooseBox(item) {
				//选中
				if(event.target.checked){
					this.chooseNum += item.number;
					this.totalPrice += item.number * item.price;
					this.checkList.push(item.id);
					// 选择所有商品后全选按钮变为选中				
					if( this.checkList.length == this.goodsIdList.length ){
						this.$refs['allCheck'].checked = true;
					}
					return
				}
				
				//取消
				this.chooseNum -= item.number;
				this.totalPrice -= item.number * item.price;
				//取消全选
				this.$refs['allCheck'].checked = false;
				//从选中列表中删除指定id
				let index = this.checkList.indexOf(item.id);
				if(index != -1){
					this.checkList.splice(index,1);
				}
			},
			// 全选
			allChoose(){
				// 选中
				if(event.target.checked){
					this.checkList = this.goodsIdList;
					this.totalPrice = parseInt(this.total);
					this.chooseNum = this.totalNum;
					//所有选框变为选中
					for (var value of this.checkList) {
						this.$refs['choose'+value][0].checked = true
						// console.log(this.$refs['choose'+value][0].checked);
					}
					return true
				}
				// 反选
				this.checkList = [];
				this.totalPrice = 0;
				// this.totalNum = 0;
				this.chooseNum = 0;
				//所有选框变为非选中
				for (var value of this.goodsIdList) {
					this.$refs['choose'+value][0].checked = false
				}
				// console.log(this.checkList)
			},
			//提交
			submitGoods: function() {
				this.$http({
					url: '/api/userCenter/submitGoods',
					params: {
						checkList: this.checkList,
					}
				}).then(res => {
					if(res.data.code != 200){
						// console.log(res.data.message);
						alert(res.data.message);
						return false;
					}
					location.href = "/userCenter";
				}).catch(err => {
					alert('未知错误');
					console.log(err)
				});
			}
			
		},
		created() {
			this.showGoodsList();
		},
		beforeCreate() {
			if(!this.$store.state.userName) {
				location.href = "/login";
			}
		}
	};
</script>

<style>
	#Goods {
		background-color: #F5F5F5;
		min-height: 550px;
	}

	.goodsDiv {
		background-color: #FFF;
		margin: auto;
		/* height: 50px; */
		width: 1226px;
		position: relative;
		top: 35px;
	}

	.goodsTitle {
		height: 70px;
		width: 100%;
		text-align: center;
		line-height: 70px;
		display: flex;
		/* margin-top: 50px; */
	}

	.goodsTitle>div:first-child,
	.goodsTitle>div:last-child,
	.goodsTitle>div:nth-child(3),
	.goodsTitle>div:nth-child(5) {
		flex: 1;
	}

	.goodsTitleName {
		flex: 4;
	}

	.goodsTitleNum {
		flex: 2;
	}

	.goodsList {
		width: 100%;
		text-align: center;
		line-height: 116px;
		display: flex;
		border-top: 1px solid #f0f0ff;
	}

	.goodsList>div:first-child,
	.goodsList>div:last-child,
	.goodsList>div:nth-child(3),
	.goodsList>div:nth-child(5) {
		flex: 1;
	}

	.numInput {
		border: solid 1px #e0e0e0;
		width: 150px;
		height: 40px;
		position: relative;
		top: 50%;
		/* top: 58px; */
		margin: -20px auto;
		/* display: flex; */
		line-height: 40px;
	}

	.numInput>div:first-child {
		float: left;
		height: 40px;
		width: 39px;
		cursor: pointer;
	}

	.numInput>div:last-child {
		float: right;
		height: 40px;
		width: 39px;
		cursor: pointer;
	}

	.numInput>div:first-child:hover,
	.numInput>div:last-child:hover {
		background-color: #e0e0e0;
	}

	.numInput>div:nth-child(2) {
		float: left;
	}

	.numInput input {
		border: 0px;
		width: 68px;
		height: 38px;
		text-align: center;
	}

	.goodsDelete {
		position: relative;
		top: 50%;
		margin: -12px auto;
		height: 24px;
		width: 24px;
		border-radius: 19px;
		line-height: 22px;
		cursor: pointer;
	}

	.goodsDelete:hover {
		background-color: red;
		color: #FFF;
	}

	.goodsList .goodsTitleName {
		text-align: initial;
		white-space: nowrap;
		/*强制一行内显示*/
		overflow: hidden;
		/*超出部分隐藏*/
		text-overflow: ellipsis;
		/* 超出部分用...替代 */
	}

	.goodsTitleName img {
		height: 80px;
		width: 80px;
		vertical-align: middle;
		margin-right: 15px;
	}

	.goodsDivision {
		height: 20px;
		background-color: #F5F5F5;
	}

	.goodsPay {
		margin-top: 50px;
		height: 50px;
		width: 1226px;
		margin: auto;
		line-height: 50px;

	}

	.goodsPayTotal {
		width: 950px;
	}

	.goodsPayTotal>div:first-child {
		width: 245px;
		float: left;
		text-align: center;
	}

	.goodsPayTotal>div:last-child {
		width: 700px;
		float: left;
		text-align: end;
	}

	.goodsPayBtn {
		float: right;
		width: 245px;
		height: 50px;
		line-height: 50px;
		background-color: #FF6700;
		color: #FFF;
		text-align: center;
		cursor: pointer;
	}

	input[type="checkbox"] {
		zoom: 180%;
		vertical-align: middle;
	}
</style>
