
import { createApp } from 'vue'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'
import 'bootstrap-icons/font/bootstrap-icons.min.css'
import 'vue-loading-overlay/dist/css/index.css'
import "vue-toastification/dist/index.css"
import VueDOMPurifyHTML from 'vue-dompurify-html'
import { createPinia } from 'pinia'
import router from './router'
import VueImageZoomer from 'vue-image-zoomer'
import Toast from "vue-toastification";

const pinia = createPinia()
createApp(App)
    .use(router)
    .use(VueDOMPurifyHTML)
    .use(VueImageZoomer)
    .use(Toast)
    .use(pinia)
    .mount('#app')