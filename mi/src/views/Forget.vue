<template>
	<div id="Forget">
		<div class="register">
			<div class="registerTitle">
				<h1 class="orange">重置密码</h1>
			</div>
			<div class="registerCenter">
				<p>请输入注册的邮箱地址：</p>
				<input class="registerInputOne" type="text" placeholder="邮箱" />
				<br />
				<input class="registerInputTwo" type="text" placeholder="图片验证码" />
				<img src="" />
				<br />
				<span class="orange">123</span>
				<br />
				<input class="registerInputThree" type="submit" value="下一步" />
			</div>
			<div class="registerRead"></div>
		</div>
		<div class="registerBottom">
			<p><a href="javascript:;">常见问题</a></p>
		</div>
	</div>
</template>

<script>
	export default {
		name: "Forget"
	}
</script>

<style>
	#Forget {
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
