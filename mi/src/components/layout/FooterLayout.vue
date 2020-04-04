<template>
  <div id="FooterLayout">
    <div class="footerTop">
      <span>
        <a href="javascript:;">
          <img src=""/>
          功能未实现
        </a>
      </span>
      <span>
        <a href="javascript:;">
          <img src=""/>
          功能未实现
        </a>
      </span>
      <span>
        <a href="javascript:;">
          <img src=""/>
          功能未实现
        </a>
      </span>
      <span>
        <a href="javascript:;">
          <img src=""/>
          功能未实现
        </a>
      </span>
      <span>
        <a href="javascript:;">
          <img src=""/>
          功能未实现
        </a>
      </span>
    </div>

    <div class="footerButtom">
      <div>
        
      </div>
      <div>
        <p>400-XXX-XXXX</p>				
        <p>周一至周日 8:00-18:00</p>
        <p>（仅收市话费）</p>
      </div>

    </div>
  </div>
</template>

<script>
  export default {
    name: "FooterLayout",
  }
</script>

<style>
  #FooterLayout {
    height: 272px;
    width: 100%;
    text-align: center;
    /* box-shadow: 0px -1px 1px #E0E0E0; */
  }
  
  .footerTop {
    height: 80px;
    width: 1226px;
    margin: 0 auto;
    border-bottom: #B0B0B0 1px solid;
    display: flex;
    align-items: center;
    text-align: center;
  }

  .footerTop span {
    flex: 1;
  }

  .footerTop span:nth-child(n+2) {
    border-left: #B0B0B0 1px solid;
  }

  .footerButtom {
    height: 190px;
    width: 1226px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    text-align: center;
  }

  .footerButtom div:first-child {
    flex: 4;
  }

  .footerButtom div:last-child {
    flex: 1;
    border-left: #B0B0B0 1px solid;
  }

  .footerButtom div:last-child p:first-child {
    font-size: 22px;
    color: #FF6B00;
  }
</style>