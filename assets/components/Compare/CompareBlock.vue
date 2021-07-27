<template>
  <div class="">
    <compare-form
        @createCompare="createCompare"
    ></compare-form>
    <compare-list
        :comparisons="comparisons"
        @removeCompareItem="removeCompareItem"
    ></compare-list>
  </div>
</template>

<script>
import CompareForm from "./CompareForm";
import CompareList from "./CompareList";

export default {
  name: "CompareBlock",
  components: {
    CompareForm, CompareList
  },
  data() {
    return {
      comparisons: [
      ],
    }
  },
  methods: {
    createCompare(compare) {
      // Добавляем новый расчет в начало
      this.comparisons.unshift(compare);
    },
    removeCompareItem(item) {
      this.comparisons = this.comparisons.filter(i => i.id !== item.id)
    }
  }
}
</script>

<style scoped>

</style>