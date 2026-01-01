import Product from "@/components/products/Product.vue"
import { createRouter,createWebHashHistory } from "vue-router"
import { useAuthStore } from "../../stores/useAuthStore"
const Home = () => import('../components/Home.vue')
const Register = () => import('../components/auth/Register.vue')
const Login = () => import('../components/auth/Login.vue')
const Cart = () => import('../components/cart/Cart.vue')
const Profile = () => import('../components/profile/Profile.vue')
const CheckOut = () => import('../components/checkout/CheckOut.vue')
const SuccessPayment = () => import('../components/payment/SuccessPayment.vue')

// Add here route guards if user logged in or not 

function checkIfUserIsLoggedIn(){
    const authStore = useAuthStore()
    if(!authStore.isLoggedIn) return '/login'
}

function checkIfUserIsNotLoggedIn(){
    const authStore = useAuthStore()
    if(authStore.isLoggedIn) return '/'
}

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
            component:Register,
            beforeEnter:[checkIfUserIsNotLoggedIn]
        },
        {
            path:'/login',
            name:'login',
            component:Login,
            beforeEnter:[checkIfUserIsNotLoggedIn]
        },
        {
            path:'/profile',
            name:'profile',
            component:Profile,
            beforeEnter:[checkIfUserIsLoggedIn]
        },
        {
            path:'/checkout',
            name:'checkout',
            component:CheckOut,
            beforeEnter:[checkIfUserIsLoggedIn]
        },
        {
            path:'/success/payment/:hash',
            name:'successPayment',
            component:SuccessPayment,
            beforeEnter:[checkIfUserIsLoggedIn]
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