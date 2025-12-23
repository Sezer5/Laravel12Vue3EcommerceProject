<template>
  <div class="row my-4">
     <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <table class="table" v-if="cartStore.cartItems.length">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Colors</th>
                            <th>Sizes</th>
                            <th>Subtotal</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(product,index) in cartStore.cartItems" :key="product.ref">
                            <td>{{ index+=1 }}</td>
                            <td>
                                <img :src="product.image"
                                width="60"
                                height="80"
                                class="img-fluid rounded"
                                :alt="product.name"
                                >
                            </td>
                            <td>{{ product.name }}</td>
                            <td>

                                <i class="bi bi-caret-up" @click="cartStore.incrementQty(product)"
                                    :style="{cursor:'pointer'}"
                                ></i>

                                {{ product.qty }}

                                <i class="bi bi-caret-down" @click="cartStore.decrementQty(product)"
                                    :style="{cursor:'pointer'}"
                                ></i>
                            </td>
                            <td>{{ product.price }}</td>
                            <td>
                                <div class="border border-light-subtle border-2" :style="{backgroundColor:product.color,
                                    width:'20px',
                                    height:'20px'
                                }">

                                </div>
                            </td>
                            <td>
                                <span class="bg-light text-dark me-2-1 fw-bold border">
                                    <small>
                                        {{ product.size }}
                                    </small>
                                </span>
                            </td>
                            <td>
                                ${{ product.qty*product.price }}
                            </td>
                            <td>
                                <i class="bi bi-cart-x" @click="cartStore.removeFromCart(product)"
                                    :style="{cursor:'pointer'}"
                                ></i>
                            </td>
                        </tr>
                    </tbody>
                    <Alert bgColor="info" content="Your Cart is Empty" v-if="!cartStore.cartItems.length"/>
                </table>
                <div class="d-flex justify-content-center align-items-center">
                            <div class="border border-dark border-3 fw-bold p-2 rounded d-flex justify-content-center align-items-center">
                                Total: ${{ total }}
                            </div>
                        </div>
                
                <div class="d-flex justify-content-end">
                    <router-link to="/" class="btn btn-primary rounded mx-2 mt-2" v-if="cartStore.cartItems.length">Continue Shopping</router-link>
                    <router-link to="/checkout" class="btn btn-danger rounded mx-2 mt-2" v-if="cartStore.cartItems.length">Check Out</router-link>
                </div>
            </div>
        </div>
     </div>
  </div>
</template>

<script setup>
import { useCartStore } from "../../../stores/useCartStore"
import { computed } from "vue";
import Alert from "../layouts/Alert.vue";
// define to here cart store

const cartStore = useCartStore();

// calculate the cart total

const total = computed(() => cartStore.cartItems.reduce((acc,item) => acc += item.price * item.qty,0))

</script>

<style scoped>

</style>