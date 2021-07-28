<template>
  <div class="flex items-center justify-center shadow-lg">
    <div class="w-full md:w-1/2 bg-white rounded-lg items-center p-4">
      <div class="flex font-bold justify-center mt-6">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
        </svg>
      </div>
      <h2 class="text-3xl text-center text-gray-700 mb-4">Сравнение стоимости</h2>

      <compare-form
          @createCompare="createCompare"
      ></compare-form>
      <compare-list
          :comparisons="comparisons"
          @removeCompareItem="removeCompareItem"
      ></compare-list>
    </div>
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