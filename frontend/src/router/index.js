import Product from "@/components/products/Product.vue"
import { createRouter,createWebHashHistory } from "vue-router"
const Home = () => import('../components/Home.vue')
const Register = () => import('../components/auth/Register.vue')
const Login = () => import('../components/auth/Login.vue')
const Cart = () => import('../components/cart/Cart.vue')



const router = createRouter({
    history:createWebHashHistory(),
    routes:[
        {
            path:'/',
            name:'Home',
            component:Home
        },
        {
            path:'/register',
            name:'register',
            component:Register
        },
        {
            path:'/login',
            name:'login',
            component:Login
        },
        {
            path:'/product/:slug',
            name:'product',
            component:Product
        },
        {
            path:'/cart',
            name:'cart',
            component:Cart
        }

    ]
})

export default router