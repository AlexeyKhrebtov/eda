<template>
  <div class="flex border-b border-gray-200 hover:bg-gray-200">
    <div class="p-3 w-full">time</div>
    <div class="p-3 w-full">{{ item.price }}</div>
    <div class="p-3 w-full">{{ item.amount }}</div>
    <div class="p-3 w-full">{{ item.unit }}</div>
    <div class="p-3 w-full">{{ item.unit_price}}</div>
    <div class="p-3 w-8 flex-shrink-0 text-right">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
      </svg>
    </div>
  </div>
  <!--
  <div>
    Товар {{ item.id }} ({{ item.price }} ₽ за {{ item.amount }}) - <strong>{{ item.unit_price }}</strong> за 1
    <button
        @click="removeCompareItem"
    >🗑️
      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
      </svg>
    </button>
  </div>
  -->
</template>

<script>
export default {
  name: "CompareItem",
  props: {
    item: {
      type: Object,
      required: true,
    }
  },
  methods: {
    removeCompareItem() {
      this.$emit('removeCompareItem', this.item);
    }
  }
}
</script>

<style scoped>

</style>