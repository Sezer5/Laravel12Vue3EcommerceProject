import {defineStore} from 'pinia'
import axios from 'axios';
import {BASE_URL} from '@/helpers/config'

export const useProductDetailsStore = defineStore('product', {

state: () => ({ 
       product:null,
       productThumbnail:'',
       productImages:[],
       isLoading:false,
       errorMessage:'',
}),

actions:{
    async fetchProduct(slug){
        this.productImages=[]
        this.isLoading = true
        try {
            const response = await axios.get(`${BASE_URL}/product/${slug}/show`)
                this.product = response.data.data 
                //get product thumbnail
                this.productThumbnail = response.data.data.thumbnail
            // add product images
            if(response.data.data.first_image){
                this.productImages.push({
                    id:1,
                    src:response.data.data.first_image
                })
            }
            if(response.data.data.second_image){
                this.productImages.push({
                    id:2,
                    src:response.data.data.second_image
                })
            }
            if(response.data.data.third_image){
                this.productImages.push({
                    id:3,
                    src:response.data.data.third_image
                })
            }
            this.isLoading = false
        } catch (error) {
            this.isLoading = false,
            console.log(error)
        }
    },
}



})