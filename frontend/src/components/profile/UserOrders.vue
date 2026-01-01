<template>
    <div class="row my-5">
        <ProfileSideBar />
        <div class="col-md-8">
            <div class="card-body" v-if="authStore?.user?.orders.length">
                <table class="table">
                    <thead>
                        <tr>
                            <td>#</td>
                            <td>Product Name</td>
                            <td>Price</td>
                            <td>Qty</td>
                            <td>Total</td>
                            <td>Order Date</td>
                            <td>Delivered At</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(order,index) in authStore?.user?.orders.slice(0,data.orderToShow)"
                        :key="index">
                            <td>{{index+=1}}</td>
                            <td>
                                <div class="d-flex flex-column">
                                    <span class="badge bg-success my-1 rounded-0"
                                        v-for="product in order.products" :key="product.id"
                                    >
                                    {{product.name}}
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex flex-column">
                                    <span class="badge bg-success my-1 rounded-0"
                                        v-for="product in order.products" :key="product.id"
                                    >
                                    ${{product.price}}
                                    </span>
                                </div>
                            </td>
                            <td>{{order.qty}}</td>
                            <td>${{order.total}}</td>
                            <td>{{order.created_at}}</td>
                            <td>
                                 <span class="badge bg-success my-1 rounded-0"
                                 v-if="order.delivered_at">
                                    {{order.delivered_at}}
                                </span>
                                <i class="text-muted" v-else>Pending...</i>
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
                    
            </div>
            <Alert v-else content="No Orders Yet" bgColor="primary"/>
            <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-dark mt-3"
                            v-if="data.orderToShow < authStore.user?.orders?.length"
                            @click="loadMoreOrders"
                        >
                            <i class="bi bi-arrow-clockwise"></i> Load More
                        </button>
                    </div>
        </div>
    </div>
</template>

<script setup>
import { useAuthStore } from "../../../stores/useAuthStore";
import ProfileSideBar from  "../profile/ProfileSideBar.vue"
import Alert from "../layouts/Alert.vue"
import { reactive } from "vue";

// Define the store

const authStore = useAuthStore()

// define the how many orders show in the users order page

const data = reactive({
    orderToShow:4
})

// define to function to load more order

const loadMoreOrders = () =>{
    if(data.orderToShow < authStore.user.orders.length){
        data.orderToShow += 6
    }else{
        return 
    }
}


</script>

<style scoped>

</style>