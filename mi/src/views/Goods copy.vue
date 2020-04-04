<template>
  <div id="Goods">
    <div class="contentTwo">
      <div class="goodsTh">
        <div>
          <input type="checkbox" />
          <label for="input"></label>
          全选
        </div>
        <div>
          <span>商品名称</span>
        </div>
        <div>单价</div>
        <div>数量</div>
        <div>小计</div>
        <div>操作</div>
      </div>
      <div class="goodsTr">
        <div>
          <input type="checkbox" />
        </div>
        <div>
          <img src="@/assets/layout/g1.jpg" />
          Redmi路由器AC2100 白色
        </div>
        <div>169</div>
        <div>
          <div class="goodsIncr">
            <button>-</button>
            <input type="text" value="1" />
            <button>+</button>
          </div>
        </div>
        <div class="ogange">169</div>
        <div>x</div>
      </div>
    </div>

    <div class="goodsTotal">
      <div>
        共
        <span class="ogange">7</span> 件商品，已选择
        <span class="ogange">7</span> 件
      </div>
      <div>
        <div>
          合计：
          <span class="ogange">17464</span>元
        </div>
      </div>
      <div>
        <button class="goodsPay">去结算</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Goods"
};
</script>

<style>
#Goods {
  background-color: #F5F5F5;
  min-height: 500px;
}

.contentTwo {
  background-color: #ffffff;
  height: 50%;
  width: 1226px;
  margin: 35px auto;
  position: relative;
}

.goodsTh input[type="checkbox"] {
  visibility: hidden;
}

.contentTwo label {
  display: block;
  width: 20px;
  height: 20px;
  line-height: 20px;
  cursor: pointer; /*鼠标样式*/
  position: absolute;
  border: 1px solid #ccc; /*改变复选框的边框颜色也可以不要边框*/
  top: 25px;
  left: 30px;
}

/* checked 预先选定复选框或单选按钮。*/
.contentTwo label:before {
  /*before为伪元素可以在元素之后添加内容*/
  display: block;
  /*	css3中的content字符编码*/
  content: "\2714";
  /*	复选框里面的&radic;居中*/
  text-align: center;
  /*	复选框里面的&radic;大小*/
  font-size: 20px;
  /*	字体的颜色*/
  color: #ffffff;
  /*  复选框勾选后的背景颜色*/
  background: #ff6700;

  /* border-width: 0px; */
}

.goodsTh {
  height: 70px;
  display: flex;
  text-align: center;
}

.goodsTh div {
  flex: 1;
  line-height: 70px;
  font-size: 14px;
}

.goodsTh > div:nth-child(2) span {
  text-align: initial;
  padding-left: 98px;
}

.goodsTh > div:nth-child(2),
.goodsTr > div:nth-child(2) {
  flex: 4;
  text-align: initial;
}

.goodsTh > div:nth-child(4),
.goodsTr > div:nth-child(4) {
  flex: 2;
  /* text-align: center; */
}

.goodsTr {
  display: flex;
  text-align: center;
  border-top: #e0e0e0 1px solid;
  /* min-height: 70px; */
  line-height: 117px;
  height: 117px;
}

.goodsTr > div {
  flex: 1;
}

.goodsIncr {
  height: 40px;
  margin: auto;
  line-height: 40px;
  width: 148px;
  position: relative;
  top: 50%;
  margin-top: -20px;
}

.goodsIncr > * {
  float: left;
  border-width: 0px;
  /* height: 100%; */
  vertical-align: middle;
  font-size: 16px;
}

.goodsIncr input {
  width: 72px;
  height: 36px;
  /* padding-left: 50px; */
  text-align: center;
  border-top: #cccccc solid 1px;
  border-bottom: #cccccc solid 1px;
}

.goodsIncr button {
  width: 38px;
  height: 40px;
  background-color: #ffffff;
  border: #cccccc solid 1px;
}

.goodsIncr button:first-child {
  border-right-width: 0px;
}

.goodsIncr button:last-child {
  border-left-width: 0px;
}

.goodsIncr button:hover {
  background-color: #e0e0e0;
}

.goodsTr img {
  vertical-align: middle;
  margin-right: 15px;
  height: 80px;
  width: 80px;
}

.goodsTotal {
  height: 50px;
  width: 1226px;
  margin: 25px auto;
  background-color: #ffffff;
  display: flex;
  /* text-align: center; */
  /* justify-content: center; */
  align-items: center;
}

.goodsTotal > div:nth-child(odd) {
  flex: 1;
  text-align: center;
}

.goodsTotal div:nth-child(2) {
  flex: 3;
  text-align: right;
}

.goodsTotal div:nth-child(2) div {
  margin-right: 30px;
}

.goodsTotal div:nth-child(2) div span {
  font-size: 28px;
}

.goodsPay {
  height: 50px;
  width: 100%;
  border-width: 0px;
  background-color: #ff6700;
  color: #ffffff;
  font-size: 16px;
  cursor: pointer;
}
</style>