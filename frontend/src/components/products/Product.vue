<template>
  <div>
    <Spinner :store="productDetailStore" />
    <div class="row my-5">
        <div class="col-md-4">
            <div>
               
                <vue-image-zoomer 
                        img-class="img-fluid rounded" 
                        :regular="productDetailStore.product?.thumbnail"
                        :zoom="productDetailStore.product?.thumbnail"
                    />
                <!--{{ productDetailStore.product?.thumbnail}}-->
                <!-- <img :src="productDetailStore.product?.thumbnail" alt=""> -->
                <!-- Product Images -->
            </div>
             <div class="row my-2">
                    <div class="col-md-3"
                        v-for="productImage in productDetailStore.productImages"
                        :key="productImage.id"
                    >
                        <vue-image-zoomer 
                            img-class="img-fluid rounded" 
                            :regular="productImage.src"
                            :zoom="productImage.src"
                        />
                    </div>
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
                <div :class="`${data.chosenColor?.id === color.id ? 'border border-light-subtle shadow-sm border-2 shadow-sm border-2 rounded' : ''}mb-1 me-1`" v-for="color in productDetailStore.product?.colors" :key="color.id" :style="{
                    backgroundColor:color.name,
                    width:'30px',
                    height:'30px',
                    cursor:'pointer'
                }"
                @click="setChosenColor(color)"
                >
                    
                </div>
            </div>
            <div class="d-flex flex-wrap justify-content-start">
                <div class="nav-item mb-1 m-1" v-for="size in productDetailStore.product?.sizes" :key="size.id" @click="setChosenSize(size)">
                    <button :class="`${data.chosenSize?.id === size.id ? 'btn btn-danger mb-3 mx-1 rounded-0':'btn btn-sm btn-outline-secondary text-dark' }`">
                        {{ size.name }}
                    </button>
                </div>
            </div>
            <div>
                <span class="badge bg-success" v-if="productDetailStore.product?.status">In Stock</span>
            </div>
            <div>
                <span class="badge bg-danger" v-if="!productDetailStore.product?.status">Out of Stock</span>
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
                    <button class="btn btn-danger btn-block"
                            :disabled="!data.chosenColor || !data.chosenSize || !productDetailStore.product?.status"
                            @click="cartStore.addToCart({
                                ref: makeUniqueId(10),
                                product_id: productDetailStore.product?.id,
                                name: productDetailStore.product?.name,
                                slug: productDetailStore.product?.slug,
                                qty: data.qty,
                                price: productDetailStore.product?.price,
                                color: data.chosenColor?.name,
                                size: data.chosenSize?.name,
                                maxQty: productDetailStore.product?.qty,
                                image: productDetailStore.product?.thumbnail,
                                coupon_id: null,
                            })"
                            >
                            <i class="bi bi-cart-plus"></i> Add to cart
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
import { useCartStore } from '../../../stores/useCartStore';
import Spinner from "@/components/layouts/Spinner.vue";
import 'vue-image-zoomer/dist/style.css';
import { useToast } from 'vue-toastification';
import { makeUniqueId } from '@/helpers/config';


//define the toast

const toast = useToast()

//define the product store

const cartStore = useCartStore()

//define the product store

const productDetailStore = useProductDetailsStore()


//define the route

const route = useRoute()

// once the component is mounted we fetch the product

onMounted(()=>{
    productDetailStore.fetchProduct(route.params.slug)
})

// set the chosen color by user

const setChosenColor = (color)=>{
    data.chosenColor = color
}

// set the chosen size by user

const setChosenSize = (size)=>{
    data.chosenSize = size
}

// define data for the cart

const data = reactive({
    qty:1,
    chosenColor:null,
    chosenSize:null
})

</script>

<style scoped>

</style>