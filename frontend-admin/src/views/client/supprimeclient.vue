<template>
    <div class="container">
      <div class="card mt-4">
        <div class="card-header bg-dark text-white">
          <h4>Confirmation de suppression</h4>
          <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button>
        </div>
        <div class="card-body">
          <p>Êtes-vous sûr de vouloir supprimer ce client ?</p>
          <p><strong>Nom:</strong> {{ client.nom }}</p>
          <p><strong>Prénom:</strong> {{ client.prenom }}</p>
          <p><strong>Adresse:</strong> {{ client.adresse }}</p>
          <p><strong>Téléphone:</strong> {{ client.telephone }}</p>
          <button @click="deleteClient" class="btn btn-danger">Supprimer le client</button>
        </div>
      </div>
    </div>
  </template>
  <script>
  import axios from 'axios';
  
  export default {
    name: 'DeleteClient',
    data() {
      return {
        clientId: '',
        client: {}
      };
    },
    mounted() {
      this.clientId = this.$route.params.id;
      this.getClient();
    },
    methods: {
      getClient() {
        axios.get(`http://localhost:8000/api/client/${this.clientId}`)
          .then(res => {
            this.client = res.data.client;
          })
          .catch(error => {
            console.error('Error fetching client:', error);
          });
      },
      deleteClient() {
        axios.delete(`http://localhost:8000/api/client/${this.clientId}`)
          .then(res => {
            console.log('Client deleted:', res.data);
            // Optionally, redirect to another page or show a success message
            this.$router.push({ name: 'viewclient' }); // Example: Redirect to client list page
          })
          .catch(error => {
            console.error('Error deleting client:', error);
            // Handle the error (e.g., show an error message to the user)
          });
      },
      goBack() {
        this.$router.go(-1); // Method to go back to the previous page
      }
    }
  };
  </script>
<style scoped>
.card {
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-header {
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.card-body {
  padding: 20px;
}

.btn {
  width: 100%;
}

@media (min-width: 576px) {
  .btn {
    width: auto;
  }
}
</style>
  