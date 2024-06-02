import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import NewHiveView from '../views/NewHiveView.vue'
import HiveView from '../views/HiveView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/new',
      name: 'new-hive',
      component: NewHiveView
    },
    {
      path: '/hives/:id',
      name: 'get-hive',
      component: HiveView
    }
  ]
})

export default router
