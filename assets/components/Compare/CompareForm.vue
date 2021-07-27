<template>
  <form @submit.prevent class="compare_form">
    <div>
      <label>цена</label>
      <input
          v-model="compare.price"
          type="number"
          placeholder="Цена"
          min="1"
      >
      -
      <label>количество</label>
      <input
          v-model="compare.amount"
          type="number"
          placeholder="Количество"
          min="1"
      >
      -
      <label></label>
      <select v-model="compare.unit">
        <option value="грамм">грамм</option>
        <option value="штук">штук</option>
      </select>
      -
      <strong v-show="compare.unit_price">{{ compare.unit_price }} ₽ за 1</strong>
      -
      <button
          @click="createCompare"
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
    }
  }
}
</script>

<style scoped>

</style>