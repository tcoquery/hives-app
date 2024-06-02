<template>
    <div class="max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <div class="flex justify-between">
            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">{{ hive.name }}</h5>
            <bee />
        </div>
        <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Weight: {{ hive.weight }} kg</p>
        <div class="text-end">
            <RouterLink :to="{ name: 'get-hive', params: { id: hive.id } }" class="bg-yellow-500 hover:bg-yellow-600 focus:outline-none focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:focus:ring-yellow-900">See</RouterLink>
        </div>
    </div>
</template>

<script setup>
    import Bee from 'vue-material-design-icons/Bee.vue';
    
    components: {
        Bee;
    }
    defineProps(['hive', 'index'])
</script>