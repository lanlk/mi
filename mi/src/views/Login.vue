<template>
	<div id="Login">
		<div class="loginTop">
			<div>
				<a href="/"><img src="@/assets/layout/logo.png" /></a>
			</div>
		</div>
		<div class="loginCenter">
			<div>
				<div class="loginDiv">
					<div class="loginType">
						<font class="orgin">账号登录</font>
					</div>
					<div class="loginEnter">
						<input class="registerInputOne" type="text" placeholder="账号" v-model="account" @input="accountCheck()" />
						<br />
						<input class="registerInputOne" type="password" placeholder="密码" v-model="password" @input="passCheck()"/>
					</div>
					<div class="loginButton">
						<p class="orange" v-show="errMessage">{{errMessage}}</p>
						<button class="registerInputThree" type="submit" value="立即注册" @click="formSubmit()">登录</button>
						<p>
							<a href="/forget">
								<span>忘记密码?</span>
							</a>
							<span> | </span>
							<a href="/registers">
								<span>立即注册</span>
							</a>
						</p>
					</div>
					<div class="loginOther">
						<p>——————————其他登录方式——————————</p>
						<div class="loginIcon">
							<div class="iconImg">
								<a href="javascript:;">
									<div class="loginQq"></div>
								</a>
							</div>
							<div class="iconImg">
								<a href="javascript:;">
									<div class="loginWb"></div>
								</a>
							</div>
							<div class="iconImg">
								<a href="javascript:;">
									<div class="loginAli"></div>
								</a>
							</div>
							<div class="iconImg">
								<a href="javascript:;">
									<div class="loginWx"></div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
</template>

<script>
	export default {
		name: "Login",
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
					url: '/api/loginOfMe',
					params: {
						name: this.account,
						password: this.password,
						// token: this.$store.state.token
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
					this.button = false;
					// console.log(this.$store.state.token);
					this.$router.push('/userCenter');
					// location.href="/userCenter"
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
		},
		created() {
			if(this.$store.state.userName){
				location.href = '/userCenter';
			}
		}
	}
</script>

<style>
	.loginTop,
	.loginCenter,
	.loginBottom {
		float: left;
		width: 100%;
	}

	.loginTop {
		height: 98px;
	}

	.loginTop>div {
		width: 1226px;
		height: 100%;
		margin: auto;
	}

	.loginTop img {
		height: 100%;
	}

	.loginCenter {
		height: 588px;
		background-image: url(../assets/layout/loginImg.jpg);
		background-position: center;
	}

	.loginCenter>div {
		width: 1226px;
		margin: auto;
	}

	.loginDiv {
		float: right;
		background-color: #FFFFFF;
		height: 497px;
		width: 410px;
		margin-top: 46px;
		display: flex;
		flex-direction: column;
	}

	.loginDiv>div {
		width: 100%;
		height: 100%;
		/* border: #007AFF 1px solid; */
	}

	.loginType {
		flex: 1;
		font-size: 26px;
		/* line-height: 100%; */
		text-align: center;

	}

	.loginType font {
		/* margin: auto; */
		/* vertical-align: ; */
		line-height: 71px;
	}

	.loginEnter,
	.loginButton,
	.loginOther {
		flex: 2;
	}

	.loginEnter {
		text-align: center;
		vertical-align: middle;
	}

	.loginEnter>input {
		margin: 8px;
		width: 346px;
		height: 50px;
		border: 1px solid #e0e0e0;
		padding-left: 15px;
		font-size: 18px;
	}

	.loginButton {
		/* line-height: 180px; */
		text-align: center;
	}

	.loginButton button {
		width: 364px;
		height: 50px;
		background-color: #FF6700;
		border-width: 0px;
		color: #FFFFFF;
		margin-top: 5px;
	}

	.loginButton p {
		width: 365px;
		/* margin-top: 5px; */
		font-size: 14px;
	}

	.loginButton>p {
		text-align: left;
		padding-left: 22px;
	}

	.loginButton span {
		display: block;
		float: right;
		margin: 3px;
		color: #999;
	}

	.loginButton a span:hover {
		color: #FF6700;
	}

	.loginOther p {
		color: #999;
		font-size: 14px;
		text-align: center;
	}

	.loginIcon {
		width: 60%;
		margin: auto;
	}

	.iconImg {
		float: left;
		margin: 12px;
	}

	.iconImg div {
		background-image: url(../assets/layout/icons_type.png);
		background-repeat: no-repeat;
		border-radius: 50%;
		height: 19px;
		width: 19px;
	}

	.loginQq {
		border: #007AFF 6px solid;
		background-position: -19px 0;
		background-color: #007AFF;
	}

	.loginWb {
		border: #d32f2f 6px solid;
		background-position: -38px 0;
		background-color: #d32f2f;
	}

	.loginAli {
		border: #0ae 6px solid;
		background-position: -57px 0;
		background-color: #0ae;
	}

	.loginWx {
		border: #00d20d 6px solid;
		background-position: -85px 0;
		background-color: #00d20d;
	}

	.loginBottom {
		text-align: center;
		line-height: 180px;
	}
</style>
