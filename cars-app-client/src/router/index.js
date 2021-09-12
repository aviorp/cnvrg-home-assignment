import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'MainLayout',
    redirect: {
      name: "Home"
    },
    component: () => import('../layouts/MainLayout.vue'),
    children: [
      {
        path: '/',
        name: 'Home',
        component: () => import('../pages/Home.vue'),
        meta: {
          title: "Home Page"
        },
      },

      {
        path: 'cars',
        name: 'CarsList',
        component: () => import('../pages/CarsList.vue'),
        meta: {
          title: "Cars List"
        }
      },
      {
        path: 'drivers',
        name: 'DriversList',
        component: () => import('../pages/DriversList.vue'),
        meta: {
          title: "Drivers List"
        }
      },
      {
        path: 'select-form',
        name: 'Forms',
        component: () => import('../pages/Forms.vue'),
        meta: {
          title: "Select Form"
        }
      },

      {
        path: 'cars/:id',
        name: 'SelectedCar',
        component: () => import('../pages/SelectedCar.vue'),
        meta: {
          title: "Selected Car"
        },
      },
      {
        path: 'drivers/:id',
        name: 'SelectedDriver',
        component: () => import('../pages/SelectedDriver.vue'),
        meta: {
          title: "Selected Driver"
        },
      },


      {
        path: 'form',
        name: 'SelectedForm',
        component: () => import('../pages/SelectedForm.vue'),
        meta: {
          title: "Form"
        }
      },

      {
        path: 'drivers-and-cars',
        name: 'DriversAndCars',
        component: () => import('../pages/DriversAndCars.vue'),
        meta: {
          title: "Drivers & Cars"
        }
      },
      {
        path: '*',
        component: () => import('../pages/Home.vue'),
        meta: {
          title: "Home Page"
        }
      },

    ]
  },

]

const router = new VueRouter({
  routes
});

router.beforeEach(async (to, from, next) => {
  document.title = `Cars App | ${to.meta.title}`
  next();
})
export default router
