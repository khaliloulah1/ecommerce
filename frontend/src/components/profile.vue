<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h2 class="card-title text-center mb-4">Profil Utilisateur</h2>
            <div class="form-group">
              <label for="name">Nom</label>
              <input type="text" id="name" class="form-control" v-model="user.nom" disabled>
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" id="email" class="form-control" v-model="user.email" disabled>
            </div>
            <div class="form-group">
              <label for="status">Status</label>
              <input type="text" id="status" class="form-control" v-model="user.status" disabled>
            </div>
            <div class="form-group">
              <label for="created_at">Date d'inscription</label>
              <input type="text" id="created_at" class="form-control" :value="formattedDate" disabled>
            </div>

            <button type="button" @click="reloadPage" class="btn btn-info">Recharger</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from '../axios';

export default {
  data() {
    return {
      user: {},
      formattedDate: ''
    };
  },
  created() {
    this.fetchUserData();
  },
  methods: {
    fetchUserData() {
      axios.get('http://127.0.0.1:8000/api/userl') // Assurez-vous que 'user' est votre endpoint pour récupérer les infos de l'utilisateur connecté
        .then(response => {
          this.user = response.data.user; // Assurez-vous que response.data contient les informations de l'utilisateur correctement
          this.formatDate(this.user.created_at); // Formatage de la date d'inscription (si nécessaire)
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des informations utilisateur:', error);
        });
    },
    formatDate(dateString) {
      this.formattedDate = new Date(dateString).toLocaleDateString();
    },
    reloadPage() {
      window.location.reload();
    }
  }
};
</script>

<style scoped>
/* Vos styles CSS ici */
</style>
