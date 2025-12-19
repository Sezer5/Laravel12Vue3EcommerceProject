<template>
<div class="mb-3 d-flex">
<input type="text" v-model="data.term" class="form-control rounded-0" placeholder="Search...">
<button class="btn btn-sm btn-dark search__button" @click="searchForProducts"
:disabled="!data.term"
>
    <i class="bi bi-search"></i>
</button>
</div>
</template>

<script setup>
import { reactive } from 'vue';
import { useProductStore } from '../../../stores/useProductsStore';   
// define the store variable
const productsStore = useProductStore();

// define the data object

const data = reactive({
    term:''
})

// Search Function

const searchForProducts = () =>{
    productsStore.filterProducts("find",data.term,true)
    data.term=''
}

</script>

<style scoped>
.search__button{
    border-top-right-radius: 15px;
    border-bottom-right-radius: 15px;
    border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
}
</style>