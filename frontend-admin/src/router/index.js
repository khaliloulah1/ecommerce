// router.js
import { createRouter, createWebHistory } from 'vue-router';
import Home from '../components/Home.vue';

import Login from '../components/login.vue';
import Register from '../components/register.vue';
import Dashboard from '../components/Dashboard.vue';

import Profile from '../components/profile.vue';

import addclient from '../views/client/addclient.vue'
import viewclient from '../views/client/viewclient.vue'
import supprimeclient from '../views/client/supprimeclient.vue'
import updateclient from '../views/client/updateclient.vue'

import addcategorie from '../views/categorie/addcategorie.vue'
import viewcategorie from '../views/categorie/viewcategorie.vue'
import supprimecategorie from '../views/categorie/supprimecategorie.vue'
import updatecategorie from '../views/categorie/updatecategorie.vue'
import addproduit from '../views/produit/addproduit.vue'
import viewproduit from '../views/produit/viewproduit.vue'
import supprimeproduit from '../views/produit/supprimeproduit.vue'
import updateproduit from '../views/produit/updateproduit.vue'
import adduser from '../views/user/adduser.vue'
import viewuser from '../views/user/viewuser.vue'
import supprimeuser from '../views/user/supprimeuser.vue'
import updateuser from '../views/user/updateuser.vue'
import addcommande from '../views/commande/addcommande.vue';
import viewcommande from '../views/commande/viewcommande.vue';
import deletecommande from '../views/commande/deletecommande.vue';

import addcommandeproduit from '../views/CommandeProduit/addcommandeproduit.vue';
import showcommande from '../views/commande/showcommande.vue';

import viewcommandeproduit from '../views/CommandeProduit/viewcommandeproduit.vue';



const routes = [
  { path: '/', component: Home },
 

  { path: '/login', component: Login },
  { path: '/profile', component: Profile },
  { path: '/Dashboard', component: Dashboard },

  {
    path: '/commande/addcommande',
    name: 'addcommande',
    component: addcommande
  },
  {
    path: '/commande/viewcommande',
    name: 'viewcommande',
    component: viewcommande
  },
  {
    path: '/commande/showcommande/:id',
    name: 'showcommande',
    component: showcommande
  },
  {
    path: '/commande/deletecommande/:id',
    name: 'deletecommande',
    component: deletecommande
  },
  {
    path: '/commande/viewcommandeproduit',
    name: 'viewcommandeproduit',
    component: viewcommandeproduit
  },
  {
    path: '/commande/addcommandeproduit',
    name: 'addcommandeproduit',
    component: addcommandeproduit
  },

  { path: '/register', component: Register },

  {
    path: '/client/addclient',
    name: 'addclient',
    component: addclient
  },
  {
    path: '/client/viewclient',
    name: 'viewclient',
    component: viewclient
  },
  {
    path: '/client/supprimeclient/:id',
    name: 'supprimeclient',
    component: supprimeclient
  },
  {
    path: '/client/updateclient/:id',
    name: 'updateclient',
    component: updateclient
  },

  {
    path: '/user/adduser',
    name: 'adduser',
    component: adduser
  },
  {
    path: '/user/viewuser',
    name: 'viewuser',
    component: viewuser
  },
  {
    path: '/user/supprimeuser/:id',
    name: 'supprimeuser',
    component: supprimeuser
  },
  {
    path: '/user/updateuser/:id',
    name: 'updateuser',
    component: updateuser
  },
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
    path: '/produit/viewproduit',
    name: 'viewproduit',
    component: viewproduit
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
