<template>
    <div class="container">
      <div class="card mt-4">
        <div class="card-header bg-dark text-white">
          <h4>Modifier categorie</h4>
          <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button>
        </div>
        <div class="card-body">
          <form @submit.prevent="updateCategory">
            <div class="mb-3">
              <label for="name" class="form-label">Nom</label>
              <input type="text" class="form-control" id="name" v-model="category.name" required>
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
    name: 'UpdateCategory',
    data() {
      return {
        categoryId: '',
        category: {
          name: '', // Ensure 'name' property exists in category
        }
      };
    },
    mounted() {
      this.categoryId = this.$route.params.id;
      this.getCategory();
    },
    methods: {
      getCategory() {
        axios.get(`http://localhost:8000/api/categorie/${this.categoryId}`)
          .then(res => {
            this.category = res.data.category;
          })
          .catch(error => {
            console.error('Error fetching categorie:', error);
          });
      },
      updateCategory() {
        axios.put(`http://localhost:8000/api/categorie/${this.categoryId}`, this.category)
          .then(res => {
            console.log('Categorie updated:', res.data);
            // Optionally, redirect to another page or show a success message
          })
          .catch(error => {
            console.error('Error updating categorie:', error);
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
  