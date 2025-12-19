<template>
    <div class="mb-3">
        <h6>Sizes</h6>
        <div class="d-flex flex-wrap justify-content-start">
            <div class="nav-item mb-1 m-1" v-for="size in productsStore.sizes" :key="size.id">
                <button class="btn btn-sm btn-outline-secondary text-dark" @click="productsStore.filterProducts('size',size.id)">
                    {{ size.name }}
                </button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useProductStore } from '../../../stores/useProductsStore';   
// define the store variable
const productsStore = useProductStore();
</script>

<style scoped>

</style>