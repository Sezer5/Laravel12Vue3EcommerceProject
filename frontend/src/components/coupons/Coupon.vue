<template>
  <div class="row mb-3">
    <div class="col-md-12">
        <div class="d-flex">
            <input 
            type="text" 
            class="form-control rounded-0"
            placeholder="Enter a code promo"
            v-model="data.coupon.name"
            >
            <button class="btn btn-primary rounded-0"
            @click="applyCoupon"
            :disabled="!data.coupon.name"
            >
                Apply
            </button>
        </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue';
import { useAuthStore } from '../../../stores/useAuthStore';
import { useCartStore } from '../../../stores/useCartStore';
import { useToast } from 'vue-toastification';
import axios from 'axios';
import { BASE_URL, headersConfig } from '@/helpers/config';

// define the stores 

const authStore = useAuthStore()
const cartStore = useCartStore()
// define the data object

const data = reactive({
    coupon:{
        name:''
    }
})

// define the toast 

const toast = useToast()

//apply coupon function

const applyCoupon = async () => {
    try {
        const response = await axios.post(`${BASE_URL}/apply/coupon`,
        data.coupon,
        headersConfig(authStore.access_token))
        if(response.data.error){
            toast.error(response.data.error,{
                timeout:2000
            })
            data.coupon = {
                name:''
            }
        }else{
            cartStore.setValidCoupon(response.data.coupon)
            cartStore.addCouponTheCartItem(response.data.coupon.id)
            toast.success(response.data.message,{
                timeout:2000
            })
        }

    } catch (error) {
        console.log(error)
    }
}
</script>

<style scoped>

</style>