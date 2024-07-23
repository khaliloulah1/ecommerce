// main.js (ou index.js selon votre configuration)
import { createApp } from 'vue';
import App from './App.vue';
import router from './router'; // Assurez-vous d'avoir configuré votre fichier router.js
import store from './store'; // Assurez-vous que le chemin est correct vers votre fichier store/index.js

createApp(App).use(router).use(store).mount('#app');
