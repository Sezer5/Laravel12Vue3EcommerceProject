
import { createApp } from 'vue'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'
import 'bootstrap-icons/font/bootstrap-icons.min.css'
import 'vue-loading-overlay/dist/css/index.css'
import VueDOMPurifyHTML from 'vue-dompurify-html'
import { createPinia } from 'pinia'
import router from './router'

const pinia = createPinia()
createApp(App)
.use(router)
.use(VueDOMPurifyHTML)
.use(pinia)
.mount('#app')
