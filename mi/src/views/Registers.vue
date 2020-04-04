<template>
	<div id="Registers">
		<div class="register">
			<div class="registerTitle">
				<h1 class="orange">注册账号</h1>
			</div>
			<div class="registerCenter">
				<input class="registerInputOne" type="text" placeholder="账号" v-model="account" @input="accountCheck()" />
				<br />
				<input class="registerInputOne" type="password" placeholder="密码" v-model="password" @input="passCheck()"/>
				<br />
				<span class="orange" v-show="errMessage">{{errMessage}}</span>
				<br />
				<input class="registerInputThree" type="submit" value="立即注册" @click="formSubmit()" />
			</div>
			<div class="registerRead">
				<p>
					已阅读并同意：
					<a href="javascript:;"><b>用户协议</b></a>
					和
					<a href="javascript:;"><b>隐私政策</b></a>
				</p>
			</div>
		</div>
		<div class="registerBottom">
			<p><a href="javascript:;">常见问题</a></p>
		</div>
	</div>
</template>

<script>
	export default {
		name: "Registers",
		data: function() {
			return {
				account:'',
				password: '',
				errMessage: '',
				regEn : /[`~!@#$%^&*()_+<>?:"{},.\/;'[\]]/im,
				regCn : /[·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im,
				button : false
			}
		},
		methods:{
			formSubmit: function() {
				if(this.button)return ;
				this.button = true;

				if(!this.accountCheck() || !this.passCheck()){
					this.button = false;
					return false;
				}
				
				//获取layout列表
				this.$http({
					url: '/api/registOfMe',
					params: {
						name: this.account,
						password: this.password
					}
				}).then(res => {
					if(res.data.code != 200){
						this.errMessage = res.data.message,
						this.button = false;
						return false;
					}
					// console.log(res.data);
					// alert(res.data.message);
					this.$store.commit('updateUser',res.data.data);
					location.href="/userCenter"
				}).catch(err => {
					this.button = false;
					this.errMessage = err,
					console.log(err)
				});
			},
			accountCheck: function () {
				if(!this.account){
					this.errMessage = '账号不能为空';
					return false;
				}
				if(this.account.length < 6 || this.account.length > 20){
					this.errMessage = '账号长度应该在6~20位之间';
					return false;
				}
				if(this.regEn.test(this.account) || this.regCn.test(this.account)) {
					this.errMessage = "账号不能包含特殊字符";
					return false;
				}
				
				this.errMessage = '';
				return true;
			},
			passCheck: function () {
				if(!this.password){
					this.errMessage = '密码不能为空';
					return false;
				}
				if(this.password.length < 6 || this.password.length > 20){
					this.errMessage = '密码长度应该在6~20位之间';
					return false;
				}
				if(this.regEn.test(this.password) || this.regCn.test(this.password)) {
					this.errMessage = "密码不能包含特殊字符";
					return false;
				}
				
				this.errMessage = '';
				return true;
			}
		}
	}
</script>

<style>
	#Registers {
		height: 100%;
		width: 100%;
		position: fixed;
		background-color: #F9F9F9;
	}

	.register,
	.registerBottom {
		margin: auto;
		position: relative;
		top: 40%;
	}

	.register {
		height: 548px;
		width: 854px;
		background-color: #FFFFFF;
		margin-top: -274px;
		display: flex;
		flex-direction: column;
	}

	.register div:first-child {
		line-height: 150px;
		text-align: center;
	}

	.registerTitle {
		flex: 2;
	}

	.registerCenter {
		flex: 4;
		width: 346px;
		margin: auto;
	}

	.registerCenter img {
		height: 50px;
		margin-left: 8px;
		vertical-align: middle;
	}

	.registerCenter>input {
		margin-top: 8px;
		margin-bottom: 8px;
		height: 50px;
		border: 1px solid #e0e0e0;
		padding-left: 15px;
		font-size: 18px;
	}

	.registerInputOne {
		width: 346px;
	}

	.registerInputTwo {
		width: 130px;
	}

	.registerInputThree {
		width: 365px;
		background-color: #FF6700;
		border-width: 0px;
		color: #FFFFFF;
	}

	.registerRead {
		flex: 1;
		text-align: center;
		color: #9d9d9d;
	}

	.registerRead a {
		color: black;
	}
	
	.registerBottom {
		height: 100px;
		width: 854px;
		position: relative;
		top: 50%;
		text-align: center;
		line-height: 100px;
	}
</style>
