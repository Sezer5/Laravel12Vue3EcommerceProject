<template>
    <div class="col-md-4 border shadow p-3">
        <div class="d-flex align-items-center justify-content-between mb-3">
            
            <h5>Filters</h5>
            <button @click="productsStore.clearFilters" class="btn btn-link text-dark">
                Clear All
            </button>
        </div>
        <SearchForm />
        <Categories />
        <Brand />
        <Color />
        <Size />
    </div>
</template>

<script setup>
import Brand from '@/components/partials/Brand.vue'
import Categories from '@/components/partials/Categories.vue'
import Color from '@/components/partials/Color.vue'
import Size from '@/components/partials/Sizes.vue'
import SearchForm from '@/components/partials/SearchForm.vue'
import { useProductStore } from '../../../stores/useProductsStore';   
// define the store variable
const productsStore = useProductStore();


</script>

<style scoped>

</style>