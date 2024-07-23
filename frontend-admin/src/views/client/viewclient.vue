<template>
    <div class="container">
      <h2>List of Clients</h2>
      <router-link :to="{ name: 'addclient' }" class="btn btn-primary mb-3">Add New Client</router-link>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Adresse</th>
            <th>Téléphone</th>
            <th>Genre</th>

            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(client, index) in clients" :key="client.id">
            <td>{{ index + 1 }}</td>
            <td>{{ client.nom }}</td>
            <td>{{ client.prenom }}</td>
            <td>{{ client.adresse }}</td>
            <td>{{ client.telephone }}</td>
            <td>{{ client.sexe }}</td>

            <td>
                <router-link
                  :to="{ name: 'supprimeclient', params: { id: client.id } }"
                  class="btn btn-danger btn-sm mx-1"
                >
                  <i class="bi bi-trash"></i> <!-- Icône de corbeille -->
                </router-link>
                
                <!-- Bouton pour modifier -->
                <router-link
                  :to="{ name: 'updateclient', params: { id: client.id } }"
                  class="btn btn-primary btn-sm mx-1"
                >
                  <i class="bi bi-pencil"></i> <!-- Icône de crayon -->
                </router-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  import axios from 'axios'; // Make sure axios is properly set up in your Vue project
  
  export default {
    data() {
      return {
        clients: []
      };
    },
    mounted() {
    this.getClients();
  },
    methods: {
      getClients() {
        axios.get('http://127.0.0.1:8000/api/client') // Replace with your Laravel API endpoint to fetch clients
          .then(response => {
            this.clients = response.data.clients;
            console.log( this.clients );
          })
          .catch(error => {
            console.error('Error fetching clients:', error);
          });
      },
  
    }
  };
  </script>
  
  <style scoped>
  /* Add your component-specific styles here */
  </style>
  