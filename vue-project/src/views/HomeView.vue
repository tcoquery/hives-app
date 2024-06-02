<template>
  <div>
    <div class="container mx-auto">
      <NewHiveForm @update-hives="updateHives" />
      <h1 class="text-3xl font-bold text-gray-900 text-start py-6">My hives</h1>
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
  import NewHiveForm from '../components/NewHiveForm.vue';
  import { ref, onMounted } from 'vue';

  const hives = ref([]);

  onMounted(async () => {
    const response = await fetch("http://localhost:3000/hives");
    hives.value = await response.json();
  });

  const updateHives = (newHive) => {
    hives.value.push(newHive);
  };

</script>