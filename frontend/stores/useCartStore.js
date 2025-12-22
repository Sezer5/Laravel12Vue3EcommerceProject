import {defineStore} from 'pinia'


export const useCartStore = defineStore('cart', {

state: () => ({ 
    cartItems:[],

}),

actions:{
    addToCart(item){
        let index = this.cartItems.findIndex(product =>product.product_id === item.product_id
            && product.color === item.color && product.size === item.size
        )
        // if product exist 

        if(index !== -1){
            toast.success("Product already in your cart!", {
            timeout: 2000
            });
        }else{
            this.cartItems.push(item)
            toast.success("Product added to your cart!", {
            timeout: 2000
            });
        }
        
    },

    incrementQty(item){
        let index = this.cartItems.findIndex(product =>product.product_id === item.product_id
            && product.color === item.color && product.size === item.size
        )

        // if product exist 

        if(index !== -1){
            if(this.cartItems[index].qty === item.maxQty){
                toast.success(`Only ${item.qty} available`, {
                    timeout: 2000
                });
            }else{
                this.cartItems[index].qty +=1
            }
        }
    },

    decrementQty(item){
        let index = this.cartItems.findIndex(product =>product.product_id === item.product_id
            && product.color === item.color && product.size === item.size
        )

        // if product exist 

        if(index !== -1){
            this.cartItems[index].qty -=1
            if(this.cartItems[index].qty === 0){
                this.cartItems = this.cartItems.filter(product => product)
            }
        }
    }
}

})