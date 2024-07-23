<template>
    <div class="container mt-5">
      <div class="card">
        <div class="card-body">
          <h2 class="card-title text-center mb-4">Add New User</h2>
          <form @submit.prevent="addUser">
            <div class="mb-3">
              <label for="nom" class="form-label">Nom</label>
              <input type="text" class="form-control" id="nom" v-model="form.nom" required>
            </div>
            <div class="mb-3">
              <label for="prenom" class="form-label">Prénom</label>
              <input type="text" class="form-control" id="prenom" v-model="form.prenom" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" v-model="form.email" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Mot de passe</label>
              <input type="password" class="form-control" id="password" v-model="form.password" required>
            </div>
            <div class="mb-3">
  <label for="status" class="form-label">Statut</label>
  <select class="form-select" id="status" v-model="form.status" required>
    <option value="Responsable produit">Responsable produit</option>
    <option value="Responsable Commande">Responsable Commande</option>
    <option value="Admin">Admin</option>
    <option value="User">User</option>
  </select>
</div>

            <div class="mb-3">
              <label for="photo" class="form-label">Photo</label>
              <input type="file" class="form-control-file" id="photo" @change="handleFileUpload">
            </div>
            <button type="submit" class="btn btn-primary">Ajouter Utilisateur</button>
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
        form: {
          nom: '',
          prenom: '',
          email: '',
          password: '',
          photo: null,
          status: '',

        }
      };
    },
    methods: {
      addUser() {
        let formData = new FormData();
        formData.append('nom', this.form.nom);
        formData.append('prenom', this.form.prenom);
        formData.append('email', this.form.email);
        formData.append('password', this.form.password);
        formData.append('photo', this.form.photo);
        formData.append('status', this.form.status);  // Ajout du champ status

        axios.post('http://localhost:8000/api/user', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })
        .then(response => {
          console.log('User added:', response.data);
          alert('User added successfully');
          this.resetForm();
          // Optionally, redirect to user list page or perform other actions
        })
        .catch(error => {
          console.error('Error adding user:', error);
        });
      },
      handleFileUpload(event) {
        this.form.photo = event.target.files[0];
      },
      resetForm() {
        this.form.nom = '';
        this.form.prenom = '';
        this.form.email = '';
        this.form.password = '';
        this.form.photo = null;
        this.form.status = '';

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
  