<template>
  <div id="Recommend">
    <div>
      <div>
        <div>
          <a href="javascript:void(0);">
            <img src="../../assets/layout/c1.png" />
            <br />功能未实现
          </a>
        </div>
        <div>
          <a href="javascript:void(0);">
            <img src="../../assets/layout/c2.png" />
            <br />功能未实现
          </a>
        </div>
        <div>
          <a href="javascript:void(0);">
            <img src="../../assets/layout/c3.png" />
            <br />功能未实现
          </a>
        </div>
      </div>
      <div>
        <div>
          <a href="javascript:void(0);">
            <img src="../../assets/layout/c4.png" />
            <br />功能未实现
          </a>
        </div>
        <div>
          <a href="javascript:void(0);">
            <img src="../../assets/layout/c5.png" />
            <br />功能未实现
          </a>
        </div>
        <div>
          <a href="javascript:void(0);">
            <img src="../../assets/layout/c6.png" />
            <br />功能未实现
          </a>
        </div>
      </div>
    </div>
    <div class="recommendList">
      <a href="/goodsDetail/2">
        <img src="../../assets/layout/one.jpg" />
      </a>
      <a href="/goodsDetail/6">
        <img src="../../assets/layout/two.jpg" />
      </a>
      <a href="/goodsDetail/4">
        <img src="http://119.28.7.180:8080/img/t2.jpg" />
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: "Recommend"
};
</script>

<style>
#Recommend {
  height: 170px;
  width: 1226px;
  margin: 10px auto;
}

#Recommend > div:first-child {
	float: left;
	width: 234px;
	height: 100%;
	display: flex;
	flex-direction: column;
	background-color: #5F5750;
}

#Recommend > div:first-child > div{
	flex: 1;
	display: flex;
	flex-direction: row;
	align-items: center;
	border-bottom: #665E57 1px solid;
}

#Recommend > div:first-child > div div{
	flex: 1;
	/* height: 100%; */
	font-size: 12px;
	font-weight: 600;
	color: #B0B0B0;
	border-right: #665E57 1px solid;
	text-align: center;
}

#Recommend > div:first-child > div img{
	height: 24px;
}

.recommendList {
	display: flex;
	float: right;
}

.recommendList a {
	flex: 1;
	margin-left: 12px;
}

.recommendList img{
	height: 170px;
}
</style>