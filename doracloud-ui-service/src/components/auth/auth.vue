<template>
	<div class="login-container">

		<div class="login-left-column">

		</div>

		<div class="login-right-column">

			<form class="form clearfix login-form">

				<div class="form-group">
					<input type="text" class="form-control" id="username" v-model="loginName">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="password" v-model="loginPwd">
				</div>
				<div class="btn-group pull-right">
					<button id="login" type="submit" class="btn btn-default" v-on:click="login()">
                   {{CONFIRM}}
                </button>
					<button id="regist" type="submit" class="btn btn-default" v-on:click="login()">
                   {{REGIST}}
                </button>
				</div>
			</form>

		</div>
	</div>
</template>

<style lang="css">
	@import '../../assets/css/bootstrap.css';
	@import '../../assets/css/style-landing.css';
	/*引入公共样式*/
</style>
<script>
	export default {
		name: 'Login',
		data() {
			return {
				loginName: '用户名',
				loginPwd: '密码',
				CONFIRM: '登陆',
				REGIST: '注册'

			}
		},
		methods: {
			doLogin() {
				let validateResult = this.formValidate();
				if(!validateResult.status) {
					this.$store.dispatch('new_notice', {
						autoClose: true,
						content: validateResult.msg
					});
					return;
				}
				this.login();
			},
			login() {
				let loginName = this.loginName;
				let loginPwd = this.loginPwd;
				this.$http({
					method: 'POST',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded',
						'deviceId': this.deviceId
					},
					url: '/uac/auth/form',
					auth: {
						username: 'paascloud-client-uac',
						password: 'paascloudClientSecret'
					},
					params: {
						username: loginName,
						password: loginPwd
//						imageCode: this.loginForm.captchaCode
					}
				}).then((res) => {
					this.getImage();
					if(res && res.code === 200) {
						this.$store.dispatch('update_auth_token', res.result);
						window.location.href = this.redirectUri;
					}
				}).catch((err) => {
					console.log(err);
				});
			},
			getImage() {
				this.deviceId = new Date().getTime();
				let that = this;
				that.$http({
					method: 'POST',
					url: '/uac/auth/code/image',
					headers: {
						'deviceId': that.deviceId
					}
				}).then((res) => {
					that.imageCode = 'data:image/jpg;base64,' + res.result;
				});
			},
			rememberMeFn() {
				this.$store.dispatch('update_remember_me');
			},
			formValidate() {
				let result = {
					status: false,
					msg: ''
				};
				if(!this.validate(this.loginForm.loginName, 'require')) {
					result.msg = '用户名不能为空';
					return result;
				}
				if(!this.validate(this.loginForm.loginPwd, 'require')) {
					result.msg = '密码不能为空';
					return result;
				}
				if(!this.validate(this.loginForm.captchaCode, 'require')) {
					result.msg = '验证码不能为空';
					return result;
				}
				// 通过验证，返回正确提示
				result.status = true;
				result.msg = '验证通过';
				return result;
			}
		}
	}
</script>