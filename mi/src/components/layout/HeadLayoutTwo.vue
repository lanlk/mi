<template>
  <div id="HeadLayoutTwo">
    <div class="layoutTwo">
      <div>
        <a href="/"><img src="@/assets/layout/logo.png" /></a>
        <div class="layoutTwoTitle">
          <span>我的购物车</span>
          <font>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</font>
        </div>
        <div class="layoutTwoOperation"  v-if="$store.state.userName">
          <a href="/userCenter">{{$store.state.userName}}</a>
          |
          <a href="javascript:;" @click="logout">登出</a>
        </div>
		<div class="layoutTwoOperation"  v-else>
		  <a href="/login">登录</a>
		  |
		  <a href="/registers">注册</a>
		</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HeadLayoutTwo",
  methods:{
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
	  }
  }
};
</script>

<style>

.layoutTwo {
  min-width: 1226px;
  background-color: #ffffff;
}

.layoutTwo {
  height: 102px;
  border-bottom: #ff6700 2px solid;
}

.layoutTwo > div {
  margin: 0px auto;
  width: 1226px;
  height: 100px;
  line-height: 100px;
}

.layoutTwo > div  img {
  float: left;
  height: 50px;
  /* vertical-align: middle; */
  margin-top: 25px;
  margin-right: 25px;
}

.layoutTwoTitle {
  width: 600px;
}

.layoutTwoTitle > * {
  float: left;
  margin-left: 15px;
}

.layoutTwoTitle span {
  font-size: 28px;
}

.layoutTwoTitle font {
  font-size: 12px;
  color: #757575;
  margin-top: 9px;
}

.layoutTwoOperation {
  font-size: 12px;
  color: #757575;
  margin-top: 9px;
  float: right;
}

.layoutTwoOperation a {
  margin: 0 10px;
}

.layoutTwoOperation a:hover {
  color: #ff6700;
}
</style>