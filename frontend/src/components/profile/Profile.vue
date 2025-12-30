<template>
  <div class="row my-5">
    <ProfileSideBar />
    <UpdateUserInfo :updatingProfile="true"/>
  </div>
</template>

<script setup>
    import ProfileSideBar from './ProfileSideBar.vue';
    import UpdateUserInfo from './UpdateUserInfo.vue';

</script>

<style scoped>

</style>