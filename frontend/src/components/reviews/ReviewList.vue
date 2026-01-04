<template>
  <div class="mb-2 card">
    <div class="card-header bg-white">
        <h5 class="text-center mt-2">
            Reviews ({{productDetailStore.product.reviews.length}})
        </h5>
    </div>
    <div class="card-body">
        <ul class="mt-4 list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center"
            v-for="review in productDetailStore.product.reviews" :key="review.id">
                <img :src="review.user.image_path" :alt="review.user.name" width="50" height="50" class="rounded-circle">
                <div class="ms-2 me-auto">
                    <span class="fw-bold">
                        {{review.title}}
                    </span>
                    <p class="card-text">
                        {{review.body}}
                    </p>
                    <div>
                        <small class="text-body-secondary">
                            By {{review.user.name}} - <span class="text-danger">{{review.created_at}}</span>
                        </small>
                        <StarRating 
                            v-model:rating="review.rating"
                            :show-rating="false"
                            read-only
                            star-size="12"
                        />
                    </div>
                    <div class="d-flex flex-column align-items-center">
                        <button class="btn btn-sm btn-danger mb-2" v-if="authStore.isLoggedIn && authStore.user.id===review.user_id"><i class="bi bi-trash"></i></button>
                        <button class="btn btn-sm btn-warning mb-2" v-if="authStore.isLoggedIn && authStore.user.id===review.user_id" @click="productDetailStore.editReview(review)"><i class="bi bi-pencil"></i></button>
                    </div>
                </div>
            </li>
        </ul>
  </div>
  </div>
  
</template>

<script setup>


// define the stores

import { useAuthStore } from "../../../stores/useAuthStore";
import { useProductDetailsStore } from "../../../stores/useProductDetailsStore";
import StarRating from "vue-star-rating"

const productDetailStore = useProductDetailsStore()
const authStore = useAuthStore()
</script>

<style scoped>

</style>