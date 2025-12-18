<template>
  <div class="row my-5">
      <Spinner :store="productsStore"/>
      <div class="col-md-8">
        <ProductList />
      </div>
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import { useProductStore } from '../../stores/useProductsStore';
import  ProductList from '@/components/products/ProductList.vue'
import Spinner from './layouts/Spinner.vue'

// define the store variable
const productsStore = useProductStore();

//once the component is mounted we call the action

onMounted(()=>productsStore.fetchAllProducts())



</script>

<style scoped>

</style>