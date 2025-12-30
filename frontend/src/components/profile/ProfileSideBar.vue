<template>
  <div class="col-md-4">
    <!-- Here for the spinner-->
     <Spinner :store="authStore"/>
     <RenderValidationErrors :formValidationErrors="authStore.validationErrors"/>
    <!-- Here for the form validation errors-->
     <div class="card p-2">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <img 
            :src="authStore.user?.profile_image" 
            :alt="authStore.user?.name"
            width="150"
            height="150"
            class="rounded-circle">
            <div class="input-group my-3">
                <div class="mb-3">
                    <label for="image" class="form-label">Choose file</label>
                    <input
                        type="file"
                        class="form-control"
                        name="image"
                        id="image"
                        @change="handleFileInputChange"
                    />
                    <button type="submit" class="btn btn-sm btn-dark" @click="updateUserProfileImage" :key="data.fileInputKey">
                    Submit
                    </button>
                </div>
                
                
                
            </div>
        </div>
     </div>
  </div>
</template>

<script setup>
import { reactive,onMounted } from 'vue';
import { useAuthStore } from '../../../stores/useAuthStore';
import { BASE_URL, headersConfig } from '@/helpers/config';
import axios from 'axios';
import { useToast } from 'vue-toastification';
import Spinner from '../layouts/Spinner.vue';
import RenderValidationErrors from '../layouts/RenderValidationErrors.vue';

// define the toast

const toast = useToast()

// define the authStore

const authStore = useAuthStore()

// define here to data 

const data = reactive({
    image:null,
    fileInputKey:0
})

// add the function to handle the file input change

const handleFileInputChange = (event) => {
    data.image = event.target.files[0]
}

// Update user profile image function function

const updateUserProfileImage = async() => {
    authStore.clearValidationErrors()
    authStore.isLoading = true

    // sende the file

    const formData = new FormData()
    formData.append('profile_image',data.image)
    formData.append('_method','PUT')

    try {
            const response = await axios.post(`${BASE_URL}/user/update/profile`,
                formData,headersConfig(authStore.access_token,'multipart/form')
            )
            authStore.user = response.data.user
            authStore.isLoading = false
            toast.success(response.data.message,{
                timeout:2000
            })
        } catch (error) {
            authStore.isLoading = false
            if(error?.response?.status === 422) {
                authStore.setValidationErrors(error.response.data.errors)
            }
            console.log(error)
        }
}

const clearInputFile = () => {
    data.image = null,
    data.fileInputKey++
}

//once the component is loaded we clear the validation errors
    onMounted(() => authStore.clearValidationErrors())


</script>

<style scoped>

</style>