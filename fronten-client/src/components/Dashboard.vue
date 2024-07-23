<template>
  <div>
    <h2>Dashboard</h2>
    <p>Welcome to your dashboard, {{ username }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      username: '',
    };
  },
  async created() {
    try {
      const response = await axios.get('/user'); // Endpoint pour récupérer les infos de l'utilisateur connecté
      this.username = response.data.user.name;
    } catch (error) {
      console.error('Error fetching user data:', error.response.data.message);
    }
  },
};
</script>

<style scoped>
/* Ajoutez vos styles CSS ici */
</style>
