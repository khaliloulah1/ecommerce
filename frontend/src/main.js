// main.js (ou index.js selon votre configuration)

import { createApp } from 'vue';
import App from './App.vue';
import router from './router'; // Assurez-vous d'avoir configuré votre fichier router.js

createApp(App).use(router).mount('#app');
