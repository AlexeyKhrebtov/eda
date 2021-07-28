<template>
  <form @submit.prevent class="compare_form px-12 pb-10">
    <div class="w-full mb-2">
      <div class="flex justify-center">
        <input
            class="px-8 w-full border rounded py-2 text-gray-700 focus:outline-none items-center"
            v-model="compare.price"
            ref="price"
            type="number"
            placeholder="Цена"
            min="1"
        >
      </div>
    </div>

    <div class="w-full mb-2">
      <div class="flex justify-center">
        <input
            class="px-8 w-full border rounded py-2 text-gray-700 focus:outline-none"
            v-model="compare.amount"
            type="number"
            placeholder="Количество"
            min="1"
        >
      </div>
    </div>

    <div>
      <select v-model="compare.unit">
        <option value="грамм">грамм</option>
        <option value="штук">штук</option>
      </select>
      -
      <strong v-show="compare.unit_price">{{ compare.unit_price }} ₽ за 1</strong>
      -
      <button
          @click="createCompare"
          class="w-full mt-6 py-2 rounded bg-blue-500 text-gray-100 focus:outline-none"
      >add</button>
    </div>
  </form>
</template>

<script>
export default {
  name: "CompareForm",
  data() {
    return {
      compare: {
        price: null,
        amount: null,
        unit: "грамм",
        unit_price: null
      }
    }
  },
  watch: {
    compare: {
      handler (newData) {
        this.calculateUnitPrice();
      },
      deep: true
    }
  },
  mounted() {
    this.focusInput();
  },
  methods: {
    createCompare() {
      this.compare.id = Date.now();
      this.$emit('createCompare', this.compare)
      this.compare = {
        price: null,
        amount: null,
        unit: "грамм",
        unit_price: null
      }
      this.focusInput();
    },
    calculateUnitPrice() {
      const units = new Map([
          ['грамм', 1000],
          ['штук', 1]
      ]);

      if (!this.compare.price || !this.compare.amount) {
        return;
      }

      const factor_unit = units.get(this.compare.unit);
      this.compare.unit_price = Math.round((factor_unit*this.compare.price)/this.compare.amount);
    },
    focusInput() {
      this.$refs.price.focus();
    }
  }
}
</script>

<style scoped>

</style>