<template>
    <div class="container mt-5">
      <div class="card">
        <div class="card-body">
          <h2 class="card-title text-center mb-4">Users List</h2>
          <div v-if="users.length === 0" class="alert alert-info">
            No users found.
          </div>
          <div v-else>
            <router-link :to="{ name: 'adduser' }" class="btn btn-primary mb-3">Add New Product</router-link>

            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Nom</th>
                  <th scope="col">Prénom</th>
                  <th scope="col">Email</th>
                  <th scope="col">Statut</th>
                  <th scope="col">Photo</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="user in users" :key="user.id">
                  <td>{{ user.id }}</td>
                  <td>{{ user.nom }}</td>
                  <td>{{ user.prenom }}</td>
                  <td>{{ user.email }}</td>
                  <td>{{ user.status }}</td>
                  <td>
                    <img :src="'http://localhost:8000/uploads/user/' + user.photo" v-if="user.photo" class="rounded-circle" style="width: 50px; height: 50px;">
                    <span v-else>No photo available</span>
                  </td>
                  <td>
                    <router-link
                      :to="{ name: 'supprimeuser', params: { id: user.id } }"
                      class="btn btn-danger btn-sm mx-1"
                    >
                      <i class="bi bi-trash"></i> <!-- Icône de corbeille -->
                    </router-link>
                    
                    <!-- Bouton pour modifier -->
                    <router-link
                      :to="{ name: 'updateuser', params: { id: user.id } }"
                      class="btn btn-primary btn-sm mx-1"
                    >
                      <i class="bi bi-pencil"></i> <!-- Icône de crayon -->
                    </router-link>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        users: []
      };
    },
    mounted() {
      this.getUsers();
    },
    methods: {
      getUsers() {
        axios.get('http://localhost:8000/api/user')
          .then(response => {
            this.users = response.data.users;
          })
          .catch(error => {
            console.error('Error fetching users:', error);
          });
      }
    }
  };
  </script>
  
  <style scoped>
  .card {
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .card-title {
    font-size: 1.5rem;
  }
  </style>
  