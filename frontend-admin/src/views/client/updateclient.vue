<template>
    <div class="container">
      <div class="card mt-4">
        <div class="card-header bg-dark text-white">
          <h4>Modifier le client</h4>
          <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button>
        </div>
        <div class="card-body">
          <form @submit.prevent="updateClient">
            <div class="mb-3">
              <label for="nom" class="form-label">Nom</label>
              <input type="text" class="form-control" id="nom" v-model="client.nom" required>
            </div>
            <div class="mb-3">
              <label for="prenom" class="form-label">Prénom</label>
              <input type="text" class="form-control" id="prenom" v-model="client.prenom" required>
            </div>
            <div class="mb-3">
              <label for="adresse" class="form-label">Adresse</label>
              <input type="text" class="form-control" id="adresse" v-model="client.adresse" required>
            </div>
            <div class="mb-3">
              <label for="telephone" class="form-label">Téléphone</label>
              <input type="text" class="form-control" id="telephone" v-model="client.telephone" required>
            </div>
            <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
          </form>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'UpdateClient',
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
      updateClient() {
        axios.put(`http://localhost:8000/api/client/${this.clientId}`, this.client)
          .then(res => {
            console.log('Client updated:', res.data);
            // Optionally, redirect to another page or show a success message
          })
          .catch(error => {
            console.error('Error updating client:', error);
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
    