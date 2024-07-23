<template>
    <div class="container">
      <h2>List of Products</h2>
      <router-link :to="{ name: 'addproduit' }" class="btn btn-primary mb-3">Add New Product</router-link>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Photo</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(produit, index) in produits" :key="produit.id">
            <td>{{ index + 1 }}</td>
            <td>{{ produit.nom }}</td>
            <td>{{ produit.description }}</td>
            <td>{{ produit.category }}</td>
            <td>{{ produit.prix }}</td>
            <td>{{ produit.qte }}</td>
            <td>
              <img :src="getPhotoUrl(produit.photo)" alt="Product Photo" style="max-width: 100px; max-height: 100px;">
            </td>
            <td>
                <router-link
                  :to="{ name: 'supprimeproduit', params: { id: produit.id } }"
                  class="btn btn-danger btn-sm mx-1"
                >
                  <i class="bi bi-trash"></i> <!-- Icône de corbeille -->
                </router-link>
                
                <!-- Bouton pour modifier -->
                <router-link
                  :to="{ name: 'updateproduit', params: { id: produit.id } }"
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
  import axios from 'axios';
  
  export default {
    data() {
      return {
        produits: []
      };
    },
    mounted() {
      this.getProduits();
    },
    methods: {
      getProduits() {
        axios.get('http://localhost:8000/api/produit') // Adjust endpoint as per your Laravel setup
          .then(response => {
            this.produits = response.data.produits;

          })
          .catch(error => {
            console.error('Error fetching products:', error);
          });
      },
      deleteProduit(id) {
        if (confirm('Are you sure you want to delete this product?')) {
          axios.delete(`http://localhost:8000/api/produit/${id}`)
            .then(response => {
              alert('Product deleted successfully');
              this.getProduits(); // Refresh products list after deletion
            })
            .catch(error => {
              console.error('Error deleting product:', error);
            });
        }
      },
      getPhotoUrl(filename) {
        return `http://localhost:8000/uploads/produits/${filename}`;
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your component-specific styles here */
  </style>
  