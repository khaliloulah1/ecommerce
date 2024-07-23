<template>
    <div class="container mt-5">
      <div class="card">
        <div class="card-body">
          <h2 class="card-title text-center mb-4">Delete Product</h2>
          <div v-if="produit">
            <p><strong>Product Name:</strong> {{ produit.nom }}</p>
            <p><strong>Description:</strong> {{ produit.description }}</p>
            <p><strong>Category:</strong> {{ produit.category }}</p>
            <p><strong>Price:</strong> {{ produit.prix }}</p>
            <p><strong>Quantity:</strong> {{ produit.qte }}</p>
            <p><strong>Photo:</strong></p>
            <img :src="getPhotoUrl(produit.photo)" alt="Product Photo" style="max-width: 200px; max-height: 200px; margin-bottom: 10px;">
            <p>Are you sure you want to delete this product?</p>
            <button @click="deleteProduit" class="btn btn-danger">Delete</button>
            <router-link :to="{ name: 'viewproduit' }" class="btn btn-secondary">Cancel</router-link>
          </div>
          <div v-else>
            <p>Loading...</p>
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
        produit: null,
        produitId: this.$route.params.id
      };
    },
    mounted() {
      this.getProduit();
    },
    methods: {
      getProduit() {
        axios.get(`http://localhost:8000/api/produit/${this.produitId}`)
          .then(response => {
            this.produit = response.data.produits;
          })
          .catch(error => {
            console.error('Error fetching product:', error);
          });
      },
      deleteProduit() {
        if (confirm('Are you sure you want to delete this product?')) {
          axios.delete(`http://localhost:8000/api/produit/${this.produitId}`)
            .then(response => {
              alert('Product deleted successfully');
              this.$router.push({ name: 'viewProduits' }); // Redirect to product list page after deletion
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
  .card {
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .card-title {
    font-size: 1.5rem;
  }
  </style>
  