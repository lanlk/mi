import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
	state: {
		token: '',
		userName: '',
		goodsNum: 0
	},
	mutations: {
		updateUser(state, data) {
			// console.log(data);
			state.token = data.token;
			state.userName = data.name;
			state.goodsNum = parseInt(data.goodsNum);
		},
		logout(state) {
			state.token = '';
			state.userName = '';
			state.goodsNum = 0
		},
		updateGoodsNun(state, data){
			state.goodsNum = parseInt(data);
		}
	},
	actions: {},
	modules: {}
})
