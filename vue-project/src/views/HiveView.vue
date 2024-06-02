<template>
    <div class="container mx-auto">
        <h1 class="text-3xl font-bold text-gray-900 text-center py-6">Hive #{{ hive.id }} details</h1>
        <dl class="text-gray-900 divide-y divide-gray-200 dark:text-white dark:divide-gray-700">
            <div class="flex flex-col pb-3">
                <dt class="mb-1 text-gray-500 md:text-lg dark:text-gray-400">Name</dt>
                <dd class="text-lg font-semibold">{{ hive.name }}</dd>
            </div>
            <div class="flex flex-col py-3">
                <dt class="mb-1 text-gray-500 md:text-lg dark:text-gray-400">Weight</dt>
                <dd class="text-lg font-semibold">{{ hive.weight }} kg</dd>
            </div>
            <div class="flex flex-col pt-3">
                <dt class="mb-1 text-gray-500 md:text-lg dark:text-gray-400">Bee species</dt>
                <dd class="text-lg font-semibold">{{ hive.bee_species }}</dd>
            </div>
        </dl>
        <div class="flex items-center justify-center mt-6">
            <RouterLink to="/" class="text-black border-2 border-yellow-600 hover:bg-yellow-600 hover:text-white font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 mr-3 inline-flex">Back</RouterLink>
            <button @click="deleteHive" class="text-white bg-red-500 hover:bg-red-600 focus:outline-none focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:focus:ring-red-900 inline-flex items-center"><trash /> Delete</button>
        </div>
    </div>
</template>

<script setup>
    import { ref, onMounted } from 'vue';
    import { useRoute, useRouter } from 'vue-router'
    import Trash from 'vue-material-design-icons/TrashCanOutline.vue';
    
    components: {
        Trash;
    }

    const hive = ref([]);
    const route = useRoute();
    const id = route.params.id; 
    const router = useRouter();

    onMounted(async () => {
        const response = await fetch("http://localhost:3000/hives/" + id);
        const data = await response.json();

        if (data.status == 404) {
            router.push({ name: 'home' });
        } else {
            hive.value = data;
        }
    });

    const deleteHive = async() => {
        confirm("Are you sure you want to delete this hive?");
        await fetch('http://localhost:3000/hives/' + id, {
            method: 'DELETE'
        });

        router.push({ name: 'home' });
    };
</script>