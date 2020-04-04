<template>
  <div id="app">
    <head-layout-two v-if="layoutTwo.indexOf(this.$route.name) != -1" />
    <div v-else-if="layoutHidden.indexOf(this.$route.name) != -1" ></div>
    <head-layout v-else/>
	<!-- {{ this.$route.path.indexOf(layoutHidden) }} -->
	<!-- {{ $route.name }} -->
	<!-- <pre>
		{{ this.$route }}
	</pre> -->
    <router-view/>
	
	<div v-if="layoutHidden.indexOf(this.$route.name) != -1" ></div>
    <footer-layout v-else/>
  </div>
</template>

<script>
  import HeadLayout from '@/components/layout/HeadLayout'
  import HeadLayoutTwo from '@/components/layout/HeadLayoutTwo'
  import FooterLayout from '@/components/layout/FooterLayout'

  export default {
    name: 'app',
    components: {
      HeadLayout,
      HeadLayoutTwo,
      FooterLayout
    },
    data() {
      return {
        layoutTwo: ['goods'],
		layoutHidden: ['login','registers','forget']
      }
    },
	created () {
		// alert(sessionStorage.getItem("store"));
	    //在页面加载时读取sessionStorage里的状态信息
	    if (sessionStorage.getItem("store") ) {
	        this.$store.replaceState(Object.assign({}, this.$store.state,JSON.parse(sessionStorage.getItem("store"))))
	    } 
	
	    //在页面刷新时将vuex里的信息保存到sessionStorage里
	    window.addEventListener("beforeunload",()=>{
	        sessionStorage.setItem("store",JSON.stringify(this.$store.state))
	    })
	}
  }
  
  
</script>

<style>
  @import "assets/css/base.css";
</style>
