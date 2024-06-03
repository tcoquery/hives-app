<template>
    <div class="max-w-md mx-auto">
      <h1 class="text-3xl font-bold text-gray-900 py-6">Edit hive #{{ hive.id }}</h1>
      <div class="mb-5">
        <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Hive name (6 characters minimum)</label>
        <input type="text"
          v-model="hive.name"
          placeholder="Name" 
          required
          minlength="6"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-yellow-500 focus:border-yellow-500 block w-full p-2.5"/>
      </div>
      <div class="mb-5">
        <label for="weight" class="block mb-2 text-sm font-medium text-gray-900 ">Hive weight (kg)</label>
        <input type="number"
          v-model="hive.weight"
          placeholder="weight" 
          required
          min="0"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-yellow-500 focus:border-yellow-500 block w-full p-2.5"/>
      </div>
      <div class="mb-5">
        <label for="bee_species" class="block mb-2 text-sm font-medium text-gray-900 ">Hive's bee species</label>
        <select
          v-model="hive.bee_species"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        >
          <option value="Apis mellifera">Apis mellifera</option>
          <option value="Bombus terrestris">Bombus terrestris</option>
          <option value="Megachile rotundata">Megachile rotundata</option>
          <option value="Xylocopa violacea">Xylocopa violacea</option>
        </select>
      </div>
      <div class="text-center">
        <button @click="saveHive" class="text-black bg-yellow-500 hover:bg-yellow-600 focus:ring-4 focus:outline-none focus:ring-yellow-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Save my changes</button>
      </div>
    </div>
</template>

<script setup>
    import { ref, onMounted, computed } from 'vue';
    import { useRoute, useRouter } from 'vue-router';

    const route = useRoute();
    const id = route.params.id; 
    const router = useRouter();
    const hive = ref([]);

    onMounted(async () => {
        const response = await fetch("http://localhost:3000/hives/" + id);
        const data = await response.json();

        if (data.status == 404) {
            router.push({ name: 'home' });
        } else {
            hive.value = data;
        }
    });

    const saveHive = async() => {
      const response = await fetch('http://localhost:3000/hives/' + id, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          hive: hive.value
        })
      });

      if (response.ok) {
        router.push({ name: 'get-hive', params: { id: id } });
      };
  };
</script>