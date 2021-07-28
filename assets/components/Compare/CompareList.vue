<template>
  <div class="mt-10">
    <h3>Список сравнений</h3>
    <div class="flex text-gray-600">
      <div class="p-2 w-full"></div>
      <div class="p-2 w-full">Цена</div>
      <div class="p-2 w-full">Кол-во</div>
      <div class="p-2 w-full">Ед.</div>
      <div class="p-2 w-full">Стоимость за 1</div>
      <div class="p-2 w-8 flex-shrink-0"></div>
    </div>
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