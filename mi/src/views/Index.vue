<template>
  <div id="Index">
    <banner-core/>
    <Recommend/>
  </div>
</template>

<script>
  import BannerCore from '@/components/Index/BannerCore'
  import Recommend from '@/components/Index/Recommend'

  export default {
    name: "Index",
    components: {
      BannerCore,
      Recommend
    }
  }
</script>

<style>
</style>