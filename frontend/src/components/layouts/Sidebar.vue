<template>
    <div class="col-md-4 border shadow p-3">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <h5>Filters</h5>
            <button class="btn btn-link text-dark">
                Clear All
            </button>
        </div>
        <Brand />
    </div>
</template>

<script setup>
import Brand from '@/components/partials/Brand.vue'
</script>

<style scoped>

</style>