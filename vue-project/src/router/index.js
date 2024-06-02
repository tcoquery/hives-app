import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import HiveView from '../views/HiveView.vue'
import EditHiveView from '../views/EditHiveView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/hives/:id',
      name: 'get-hive',
      component: HiveView
    },
    {
      path: '/hives/:id/edit',
      name: 'edit-hive',
      component: EditHiveView
    }
  ]
})

export default router

