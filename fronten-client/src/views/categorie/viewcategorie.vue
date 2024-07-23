<template>
    <div class="container">
      <h2>List of categories</h2>
      <router-link :to="{ name: 'addcategorie' }" class="btn btn-primary mb-3">Add New category</router-link>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Nom</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(categorie, index) in categories" :key="categorie.id">
            <td>{{ index + 1 }}</td>
            <td>{{ categorie.name }}</td>
            <td>
              <router-link
                :to="{ name: 'supprimecategorie', params: { id: categorie.id } }"
                class="btn btn-danger btn-sm mx-1"
              >
                <i class="bi bi-trash"></i> <!-- Trash icon -->
              </router-link>
              <router-link
                :to="{ name: 'updatecategorie', params: { id: categorie.id } }"
                class="btn btn-primary btn-sm mx-1"
              >
                <i class="bi bi-pencil"></i> <!-- Pencil icon -->
              </router-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'ListCategories',
    data() {
      return {
        categories: []
      };
    },
    mounted() {
      this.getCategories();
    },
    methods: {
      getCategories() {
        axios.get('http://127.0.0.1:8000/api/categorie')
          .then(response => {
            this.categories = response.data.category;
            console.log(this.categories);
          })
          .catch(error => {
            console.error('Error fetching categories:', error);
          });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your component-specific styles here */
  </style>
  