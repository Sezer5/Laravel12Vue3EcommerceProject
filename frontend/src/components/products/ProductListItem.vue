<template>
    <div class="col-md-6">
        <div class="card mb-2" style="max-width: 320px">
            <img :src="product.thumbnail" class="card-img-top" :alt="product.name" height="279">
            <div class="card-body">
                <router-link class="text-decoration-none text-dark" :to="`product/${product.slug}`">
                    <h5 class="card-title">{{product.name}}</h5>
                </router-link>
                <p class="card-text" v-dompurify-html="product.desc.substr(0,50)"></p>
                <div class="d-flex justify-content-between align-items-center">
                    <span class="h5 mb-0">$ {{product.price}}</span>
                    <div>
                                <StarRating 
                        v-model:rating="reviewAvg"
                        :show-rating="false"
                        read-only
                        star-size="24"
                        />
                        <!-- <small class="text-muted">(4.5)</small> -->
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex justify-content-between bg-light">
                <router-link :to="`/product/${product.slug}`" class="btn btn-danger btn-sm">
                    <i class="bi bi-cart-plus"></i> Add to Cart
                </router-link>
                <button class="btn btn-outline-danger btn-sm"
                @click="favrotiesStore.addToFavorites(product)"
                v-if="!favrotiesStore.checkIfProductAlreadyAddedToFavorites(product)">
                    <i class="bi bi-heart"></i>
                </button>
                <button class="btn btn-outline-danger btn-sm"
                @click="favrotiesStore.addToFavorites(product)"
                v-else
                >
                    <i class="bi bi-heart-fill"></i>
                </button>
            </div>
        </div>
    </div>
</template>

<script setup>


// define props

import { computed } from "vue"
import StarRating from "vue-star-rating"
import { useFavoritesStore } from "../../../stores/useFavoritesStore"

//Define the favrotie list Store

const favrotiesStore = useFavoritesStore()

const props = defineProps ({
    product: {
        type:Object,
        required:true
    }
})

// calculate the average reviews of product

const reviewAvg = computed(()=> props.product.reviews.reduce((acc,review) => acc + review.rating / props.product.reviews.length,0))
</script>

<style scoped>

</style>