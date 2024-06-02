<template>
        <RouterLink to="/new">Add a hive</RouterLink>
  <div v-for="hive in hives" :key="hive.id">
    <h2>{{ hive.name }}</h2>
    <p>{{ hive.weight }}</p>
  </div>
</template>

<script setup>
  import { ref, onMounted } from 'vue';

  const hives = ref([]);
  const API_URL = 'http://localhost:3000/hives';

  onMounted(async () => {
    const response = await fetch(API_URL);
    hives.value = await response.json();
  });
</script>