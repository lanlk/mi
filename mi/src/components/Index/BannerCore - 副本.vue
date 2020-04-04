<template>
  <div id="BannerCore">
    
    <div class="contentDiv">
      <div class="banner">
        <div class="bannerList">
          <ul>
            <li>
              <a href="javascript:;">手机 电话卡</a>
              <b>></b>
            </li>
            <li>
              <a href="javascript:;">手机 电话卡</a>
              <b>></b>
            </li>
            <li>
              <a href="javascript:;">手机 电话卡</a>
              <b>></b>
            </li>
          </ul>
        </div>
        
        <div class="listContent">
          <div>
            <div>
              <img src="@/assets/layout/l1.webp" />
              <a href="">Redmi K30 4G</a>
            </div>
            <div>
              <img src="@/assets/layout/l1.webp" />
              <a href="">Redmi K30 4G</a>
            </div>
            <div>
              <img src="@/assets/layout/l1.webp" />
              <a href="">Redmi K30 4G</a>
            </div>
            <div>
              <img src="@/assets/layout/l1.webp" />
              <a href="">Redmi K30 4G</a>
            </div>
            
            <div>
              <img src="@/assets/layout/l1.webp" />
              <a href="">Redmi K30 4G</a>
            </div>
            <div>
              <img src="@/assets/layout/l1.webp" />
              <a href="">Redmi K30 4G</a>
            </div>
          </div>
        </div>
        
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <div class="swiper-slide" style="background-image:url(../../assets/layout/1.webp)" ref="imgurl"></div>
            <div class="swiper-slide" style="background-image:url(../../assets/layout/2.webp)"></div>
            <div class="swiper-slide" style="background-image:url(../../assets/layout/3.jpg)"></div>
          </div>
          <!-- Add Pagination -->
          <div class="swiper-pagination swiper-pagination-white"></div>
          <!-- Add Arrows -->
          <div class="swiper-button-next swiper-button-white"></div>
          <div class="swiper-button-prev swiper-button-white"></div>
        </div>
      </div>
      
      <div class="recommend">
        <div>
          <div>
            <div>
              <a href="javascript:void(0);">
                <img src="@/assets/layout/c1.png">
                <br>
                功能未实现
              </a>
            </div>
            <div>
              <a href="javascript:void(0);">
                <img src="@/assets/layout/c2.png">
                <br>
                功能未实现
              </a>
            </div>
            <div>
              <a href="javascript:void(0);">
                <img src="@/assets/layout/c3.png">
                <br>
                功能未实现
              </a>
            </div>
          </div>
          <div>
            <div>
              <a href="javascript:void(0);">
                <img src="@/assets/layout/c4.png">
                <br>
                功能未实现
              </a>
            </div>
            <div>
              <a href="javascript:void(0);">
                <img src="@/assets/layout/c5.png">
                <br>
                功能未实现
              </a>
            </div>
            <div>
              <a href="javascript:void(0);">
                <img src="@/assets/layout/c6.png">
                <br>
                功能未实现
              </a>
            </div>
          </div>
        </div>
        <div class="recommendList">
          <a href=""><img src="@/assets/layout/one.jpg"></a>
          <a href=""><img src="@/assets/layout/two.jpg"></a>
          <a href=""><img src="@/assets/layout/three.jpg"></a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Swiper from "swiper"

  export default {
    name: "BannerCore",
    mounted(){
      var swiper = new Swiper('.swiper-container', {
        // 如果需要分页器
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
        // 循环模式选项
        loop: true,
        // 如果需要前进后退按钮
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
        //spaceBetween: 30,//slide之间的距离（单位px）
        effect: 'fade',//动画模式					
        autoplay:{//自动切换
          delay: 5000,//切换间隔
          disableOnInteraction:false,//用户操作后是否停止自动切换
        }
      });

      // console.log(this.$refs);
      // this.$refs.imgurl.style.backgroundImage="url(../../assets/layout/2.webp)";
    }
  }

</script>

<style>
  /* @import "../../assets/css/swiper.min.css"; */
  @import '../../../node_modules/swiper/css/swiper.css';

  #BannerCore {
    display: relative;
  }

  .contentDiv {
    width: 1226px;
    margin: auto;
  }

  .banner {
    height: 460px;
    position: relative;
  }

.banner img {
	/* height: 460px; */
	/* position: relative; */
}

.bannerList {
	height: 460px;
	width: 234px;
	background:rgba(105, 107, 98, 0.4);
	position: absolute;
	z-index: 20;
}

.bannerList ul {
	list-style-type: none;
	padding: 0;
	margin: 20px 0px;
	color: #fff;
}

.bannerList li {
	width: 234px;
    line-height: 42px;
	font-size: 15px;
	display: flex;
}

.bannerList li:hover{
	background-color: #FF6700;
}

.bannerList a{
	padding-left: 25px;
	flex: 5;
}

.bannerList b{
	flex: 1;
}

  .listContent {
    /* display:none; */
    position: absolute;
    left: 234px;
    z-index: 20;
    background-color: #FFFFFF;
    height: 460px;
  }

.listContent>div {
	width: 248px;
	float: left;
	height: 460px;
	display: flex;
	flex-direction: column;
	text-align: center;
}

.listContent>div div{
	width: 248px;
	flex: 1;
	line-height: 76px;
}

.listContent>div img{
	height: 40px;
	vertical-align: middle;
}

  .swiper-button-prev {
    left: 244px;
  }

  .swiper-container-horizontal>.swiper-pagination-bullets {
    left: 500px;
  }

  .swiper-container {
    width: 100%;
    height: 100%;
  }

  .swiper-slide {
    background-position: center;
    background-size: cover;
  }

</style>