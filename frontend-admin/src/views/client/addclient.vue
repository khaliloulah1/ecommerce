<template>
    <div class="container">
      <h2>Add New Client</h2>
      <form @submit.prevent="saveClient">
        <div class="form-group">
          <label for="nom">Nom</label>
          <input type="text" id="nom" v-model="client.nom" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="prenom">Prénom</label>
          <input type="text" id="prenom" v-model="client.prenom" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="adresse">Adresse</label>
          <input type="text" id="adresse" v-model="client.adresse" class="form-control">
        </div>
        <div class="form-group">
          <label for="telephone">Téléphone</label>
          <input type="text" id="telephone" v-model="client.telephone" class="form-control">
        </div>
        <div class="form-group">
          <label for="sexe">Sexe</label>
          <select id="sexe" v-model="client.sexe" class="form-control">
            <option value="Masculin">Masculin</option>
            <option value="Féminin">Féminin</option>
          </select>
        </div>
        <button type="submit" class="btn btn-primary">Enregistrer</button>
      </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        client: {
          nom: '',
          prenom: '',
          adresse: '',
          telephone: '',
          sexe: 'Masculin' // Default value
        }
      };
    },
    methods: {
      saveClient() {
        axios.post('http://127.0.0.1:8000/api/client', this.client)
          .then(response => {
            console.log('Client added successfully:', response.data);
            alert('Client added successfully.');
            // Redirect to client list or another page
            this.$router.push('/clients'); // Assuming you have a route for client list
          })
          .catch(error => {
            console.error('Error adding client:', error);
            alert('Error adding client. Please check your input.');
          });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your component-specific styles here */
  </style>
  