// router.js
import { createRouter, createWebHistory } from 'vue-router';
import Home from '../components/Home.vue';
import Commander from '../components/Commander.vue';

import Login from '../components/login.vue';
import Register from '../components/register.vue';
import Profile from '../components/profile.vue';

import details from '../views/details.vue'

import addcategorie from '../views/categorie/addcategorie.vue'
import viewcategorie from '../views/categorie/viewcategorie.vue'
import supprimecategorie from '../views/categorie/supprimecategorie.vue'
import updatecategorie from '../views/categorie/updatecategorie.vue'
import addproduit from '../views/produit/addproduit.vue'
import viewproduit from '../views/produit/viewproduit.vue'
import supprimeproduit from '../views/produit/supprimeproduit.vue'
import updateproduit from '../views/produit/updateproduit.vue'

import addcommande from '../views/commande/addcommande.vue';




const routes = [
  { path: '/', component: Home },
  { path: '/Commander', component: Commander },




  { path: '/login', component: Login },
  { path: '/profile', component: Profile },

  {
    path: '/commande/addcommande',
    name: 'addcommande',
    component: addcommande
  },
  { path: '/register', component: Register },


 
  {
    path: '/categorie/addcategorie',
    name: 'addcategorie',
    component: addcategorie
  },
  {
    path: '/categorie/viewcategorie',
    name: 'viewcategorie',
    component: viewcategorie
  },
  {
    path: '/categorie/supprimecategorie/:id',
    name: 'supprimecategorie',
    component: supprimecategorie
  },
  {
    path: '/categorie/updatecategorie/:id',
    name: 'updatecategorie',
    component: updatecategorie
  },
  {
    path: '/produit/addproduit',
    name: 'addproduit',
    component: addproduit
  },
  {
    path: '/produit/viewproduit/:id',
    name: 'viewproduit',
    component: viewproduit
  },

  {
    path: '/details/:id',
    name: 'details',
    component: details
  },

  {
    path: '/produit/supprimeproduit/:id',
    name: 'supprimeproduit',
    component: supprimeproduit
  },
  {
    path: '/produit/updateproduit/:id',
    name: 'updateproduit',
    component: updateproduit
  },



  // Autres routes nécessaires
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
