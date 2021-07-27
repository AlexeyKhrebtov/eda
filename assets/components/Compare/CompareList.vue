<template>
  <div class="">
    <h3>Список сравнений</h3>
    <compare-item
        v-for="item in comparisons"
        :item="item"
        :key="item.id"
        @removeCompareItem="$emit('removeCompareItem', item)"
    >
    </compare-item>
  </div>
</template>

<script>
import CompareItem from "./CompareItem";

export default {
  name: "CompareList",
  components: {CompareItem},
  props: {
    comparisons: {
      type: Array,
      required: true
    }
  }
}
</script>

<style scoped>

</style>