<template>
  <div class="card mb-2">
    <Spinner :store="productDetailStore"/>
    <div class="card-header-bg-white">
        <h5 class="text-center mt-2">
            Add Your Reviews
        </h5>
    </div>
    <div class="card-body">
        <form class="mt-5 col-md-10 mx-auto" @submit.prevent="addReview">
            <div class="mb-3">
                <label for="" class="form-label">Title</label>
                <input
                    type="text"
                    class="form-control"
                    name="title"
                    id="title"
                    aria-describedby="helpId"
                    placeholder="Title*"
                    :required="true"
                    v-model="data.review.title"
                />
            </div>
            <div class="mb-3">
                <div class="mb-3">
                    <label for="body" class="form-label">Review</label>
                    <textarea class="form-control" name="body" id="body" rows="3"
                    :required="true"
                    v-model="data.review.body"
                    ></textarea>
                </div>
                
            </div>
            <div class="mb-3">
                <StarRating 
                    v-model:rating="data.review.rating"
                    :show-rating="false"
                />
            </div>
            <div class="mb-3">
                <button
                    type="submit"
                    class="btn btn-dark"
                    :disabled="data.review.rating === 0"
                >
                    Submit
                </button>
                
            </div>
        </form>
    </div>
  </div>
</template>

<script setup>
// define the stores

import { reactive } from "vue";
import { useProductDetailsStore } from "../../../stores/useProductDetailsStore";
import Spinner from "../layouts/Spinner.vue"
import StarRating from "vue-star-rating"

const productDetailStore= useProductDetailsStore()

//define the data objects 

const data = reactive({
    review:{
        title:'',
        body:'',
        rating:0
    }
})

// add review function 

const addReview = () =>{
    productDetailStore.storeReview(data.review)
    data.review = {
        title:'',
        body:'',
        rating:0
    }
}

</script>

<style scoped>

</style>