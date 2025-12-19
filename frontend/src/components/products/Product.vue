<template>
  <div>
    <Spinner :store="productDetailStore" />
    <div class="row my-5">
        <div class="col-md-6">
            <div>
                <vue-image-zoomer 
	            img-class="img-fluid rounded" 
                :reqular="productDetailStore.product?.thumbnail"
                :zoom="productDetailStore.product?.thumbnail"
                />
                <!-- {{ productDetailStore.product?.thumbnail}}
                <img :src="productDetailStore.product?.thumbnail" alt=""> -->
                <!-- Product Images -->
            </div>
        </div>
        <div class="col-md-5 mx-auto">
            <h5 class="my-3">
                {{ productDetailStore.product?.name}}
            </h5>
            <div class="d-inline-flex">
                <span class="badge text-bg-light">
                    <i class="bi bi-tag"></i> {{ productDetailStore.product?.category.name}}
                </span>
                <span class="badge text-bg-light ms-3">
                    <i class="bi bi-c-circle"></i> {{ productDetailStore.product?.brand.name}}
                </span>
                
            </div>
            <p class="card-text" v-dompurify-html="productDetailStore.product?.desc"></p>
            <div>
                <span class="h5 mb-2">$ {{ productDetailStore.product?.price}}</span>
            </div>
            <div class="d-flex flex-wrap justify-content-start">
                <div class="border border-light-subtle shadow-sm border-2 shadow-sm border-2 rounded mb-1 me-1" v-for="color in productDetailStore.product?.colors" :key="color.id" :style="{
                    backgroundColor:color.name,
                    width:'30px',
                    height:'30px',
                    cursor:'pointer'
                }">
                    
                </div>
            </div>
            <div class="d-flex flex-wrap justify-content-start">
                <div class="nav-item mb-1 m-1" v-for="size in productDetailStore.product?.sizes" :key="size.id">
                    <button class="btn btn-sm btn-outline-secondary text-dark">
                        {{ size.name }}
                    </button>
                </div>
            </div>
            <div class="my-3 d-inline-flex">
                <div>
                    <input type="number"
                           v-model="data.qty"
                           min="1"
                           :max="productDetailStore.product?.qty"
                           class="form-control"
                    >
                </div>
                <div class="ms-2">
                    <button class="btn btn-danger btn-block">
                        <i class="bi bi-cart-plus"></i> Add To Cart
                    </button>
                </div>
            </div>
        </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, reactive } from 'vue';
import { useRoute } from 'vue-router';
import { useProductDetailsStore } from '../../../stores/useProductDetailsStore';
import Spinner from "@/components/layouts/Spinner.vue";
import { VueImageZoomer } from 'vue-image-zoomer';
//define the product store

const productDetailStore = useProductDetailsStore()


//define the route

const route = useRoute()

// once the component is mounted we fetch the product

onMounted(()=>{
    productDetailStore.fetchProduct(route.params.slug)
})

// define data for the cart

const data = reactive({
    qty:1
})

</script>

<style scoped>

</style>