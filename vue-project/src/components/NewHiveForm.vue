<template>
  <div class="mx-auto">
    <h1 class="text-3xl font-bold text-gray-900 py-6">Add a new hive</h1>
    <div class="mb-5">
      <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Your hive name (6 characters minimum)</label>
      <input type="text"
        v-model="name"
        placeholder="Name" 
        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-yellow-500 focus:border-yellow-500 block w-full p-2.5"/>
        <p v-if="isHiveNameInvalid" id="error" class="mt-2 text-xs text-red-600">The name you entered is too short </p>
    </div>
    <div class="mb-5">
      <label for="weight" class="block mb-2 text-sm font-medium text-gray-900 ">Your hive weight (kg)</label>
      <input type="number"
        v-model="weight"
        placeholder="weight" 
        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-yellow-500 focus:border-yellow-500 block w-full p-2.5"/>
        <p v-if="isHiveWeightInvalid" id="error" class="mt-2 text-xs text-red-600">The hive weight cannot be lower than 1 </p>
    </div>
    <div class="mb-5">
      <label for="bee_species" class="block mb-2 text-sm font-medium text-gray-900 ">Hive's bee species</label>
      <select
        v-model="bee_species"
        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      >
        <option value="Apis mellifera">Apis mellifera</option>
        <option value="Bombus terrestris">Bombus terrestris</option>
        <option value="Megachile rotundata">Megachile rotundata</option>
        <option value="Xylocopa violacea">Xylocopa violacea</option>
      </select>
    </div>
    <div class="text-center">
      <button :disabled="isHiveNameInvalid || isHiveWeightInvalid" @click="addHive" class="text-black bg-yellow-500 hover:bg-yellow-600 focus:ring-4 focus:outline-none focus:ring-yellow-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Save hive</button>
    </div>
  </div>
</template>

<script setup>
  import { ref, computed } from 'vue';
  const emit = defineEmits(['update-hives'])

  const name = ref('');
  const weight = ref(0);
  const bee_species = ref('Apis mellifera');

  const addHive = async() => {
    const response = await fetch('http://localhost:3000/hives', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: name.value,
        weight: weight.value,
        bee_species: bee_species.value
      })
    });

    const data = await response.json();
    emit('update-hives', data);
  };

  const isHiveNameInvalid = computed(() => (name.value.trim().length > 0 && name.value.trim().length < 6));
  const isHiveWeightInvalid = computed(() => weight.value < 0);
</script>

<style>
</style>
