<template>
  <div class="row my-4">
     <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <table class="table" v-if="favoritesStore.favorites.length">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(product,index) in favoritesStore.favorites" :key="product.id">
                            <td>{{ index+=1 }}</td>
                            <td>
                                <img :src="product.thumbnail"
                                width="60"
                                height="80"
                                class="img-fluid rounded"
                                :alt="product.name"
                                >
                            </td>
                            <td>{{ product.name }}</td>
                            <td>{{ product.price }}</td>                            
                            <td>
                                <i class="bi bi-bookmark-x" @click="favoritesStore.addToFavorites(product)"
                                    :style="{cursor:'pointer'}"
                                ></i>
                            </td>
                        </tr>
                    </tbody>
                    
                </table>
                <div v-if="!favoritesStore.favorites.length">
                        <Alert  bgColor="info" content="Your Favorites is Empty" />
                </div>
            </div>
        </div>
     </div>
  </div>
</template>

<script setup>
import Alert from "../layouts/Alert.vue";
import { useFavoritesStore } from "../../../stores/useFavoritesStore";

// define to here favorites store
const favoritesStore = useFavoritesStore();



</script>

<style scoped>

</style>