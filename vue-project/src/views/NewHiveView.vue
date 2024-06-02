<template>
  <div>
    <input type="text"
      v-model="name"
      placeholder="Hive name" />
    <input type="number"
      v-model="weight"
      placeholder="Hive weight"
      class="p-3.5" />

      <button @click="addHive">Save hive</button>
  </div>
</template>

<script setup>
  import { ref } from 'vue';

  const name = ref('');
  const weight = ref(0);

  const addHive = async() => {
    const response = await fetch('http://localhost:3000/hives', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: name.value,
        weight: weight.value
      })
    });

    if (response.ok) {
      name.value = '';
      weight.value = 0;
    }
  };
  
</script>

<style>
</style>
