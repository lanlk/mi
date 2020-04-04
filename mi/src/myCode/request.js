import axios from 'axios'
import store from '../store'

export function request(config) {
	// 1.创建axios的实例
	const instance = axios.create({
		// baseURL: 'http://119.28.7.180:8080/',
		baseURL: 'http://blog.com/',
		timeout: 5000,
		method: 'post'
	})
	
	config.params.token = store.state.token;

	// 2.axios的拦截器
	// 2.1.请求拦截的作用
	instance.interceptors.request.use(config => {
		//请求头添加token
		// config.headers.common['Authorization'] = store.state.token;
		// config.headers.common['token'] = store.state.token;
		// config.headers.accessToken = store.state.token;  
		return config;
	}, err => {
		console.log(err);
	})

	// 2.2.响应拦截
	// instance.interceptors.response.use(res => {
	//   return res.data
	// }, err => {
	//   console.log(err);
	// })

	// 3.发送真正的网络请求
	return instance(config)
}
