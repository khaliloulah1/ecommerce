<template>
    <div class="container mt-5">
      <div class="card">
        <div class="card-body">
          <h2 class="card-title text-center mb-4">Update User</h2>
          <form @submit.prevent="updateUser">
            <div class="form-group">
              <label for="nom">Nom</label>
              <input type="text" id="nom" class="form-control" v-model="user.nom" >
            </div>
            <div class="form-group">
              <label for="prenom">Prénom</label>
              <input type="text" id="prenom" class="form-control" v-model="user.prenom" >
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" id="email" class="form-control" v-model="user.email" >
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Mot de passe</label>
              <input type="password" class="form-control" id="password" v-model="user.password" >
            </div>
            <div class="mb-3">
              <label for="status" class="form-label">status</label>
              <select class="form-select" id="status" v-model="user.status" >
                <option value="Responsable produit">Responsable produit</option>
    <option value="Responsable Commande">Responsable Commande</option>
    <option value="Admin">Admin</option>
    <option value="User">User</option>              </select>
            </div>
            <div class="form-group">
              <label for="photo">Photo de profil</label>
              <input type="file" id="photo" class="form-control-file" @change="handleFileUpload">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
          </form>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        user: {
          id: null,
          nom: '',
          prenom: '',
          email: '',
          photo: null,
          status: '',

        },
        userId: this.$route.params.id

      };
    },
    mounted() {
      this.getUser();
    },
    methods: {
      getUser() {
        axios.get(`http://localhost:8000/api/user/${this.userId}`)
          .then(response => {
            this.user = response.data.user;
          })
          .catch(error => {
            console.error('Error fetching user:', error);
          });
      },
      updateUser() {
    axios.put(`http://localhost:8000/api/user/${this.userId}`, this.user)
      .then(res => {
        console.log('user updated:', res.data);
        alert('user updated');

        // Optionally, redirect to another page or show a success message
      })
      .catch(error => {
        console.error('Error updating question:', error);
        // Handle the error (e.g., show an error message to the user)
      });
  },
      handleFileUpload(event) {
        this.user.photo = event.target.files[0]; // Store selected file in user object
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
  