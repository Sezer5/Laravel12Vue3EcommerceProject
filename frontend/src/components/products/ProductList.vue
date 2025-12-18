<template>
    <div class="row">
        <div class="d-flex">
            
            <div class="mb-3">
                Found
                <span class="fw-bold">{{ productsStore.products.length }}</span>
            </div>
        </div>
        <ProductListItem v-for="product in productsStore.products.slice(0,data.productsToShow)" :key="product.id" :product="product" />
        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-dark mt-3"
                v-if="data.productsToShow < productsStore.products.length"
                @click="loadMoreProducts"
            >
                   <i class="bi bi-arrow-clockwise"></i> Load More
            </button>
        </div>
    </div>
</template>

<script setup>
import  ProductListItem from './ProductListItem.vue'
import { useProductStore } from '../../../stores/useProductsStore';
import { reactive } from 'vue';

// define the store variable
const productsStore = useProductStore();

//define how many products to show on home page

const data = reactive({
    productsToShow:6
})

// define to function to load more product

const loadMoreProducts = () =>{
    if(data.productsToShow < productsStore.products.length){
        data.productsToShow += 6
    }else{
        return 
    }
}

</script>

<style scoped>

</style>