<template>
  <div class="">
    <div class="container mx-auto">
      <h1 class="text-3xl font-bold text-gray-900 text-center py-6">My hives</h1>
      <div class="my-4">
        <RouterLink to="/new" class="focus:outline-none bg-yellow-500 hover:bg-yellow-600 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:focus:ring-yellow-900">Add a hive</RouterLink>
      </div>
      <div class="grid grid-cols-4 gap-4">
        <HiveCard 
          v-for="(hive, index) in hives" 
          :hive="hive"
          :index="index"
          :key="hive.id" 
        />
      </div>
    </div>
  </div>
</template>

<script setup>
  import HiveCard from '../components/HiveCard.vue';
  import { ref, onMounted } from 'vue';

  const hives = ref([]);
  const API_URL = 'http://localhost:3000/hives';

  onMounted(async () => {
    const response = await fetch(API_URL);
    hives.value = await response.json();
  });
</script>