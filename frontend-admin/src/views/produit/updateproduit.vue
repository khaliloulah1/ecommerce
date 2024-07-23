<template>
    <div class="container mt-5">
      <div class="card">
        <div class="card-body">
          <h2 class="card-title text-center mb-4">Update Product</h2>
          <form @submit.prevent="updateProduit">
            <div class="mb-3">
              <label for="nom" class="form-label">Product Name</label>
              <input type="text" class="form-control" id="nom" v-model="produit.nom" >
            </div>
            <div class="mb-3">
              <label for="description" class="form-label">Description</label>
              <textarea class="form-control" id="description" v-model="produit.description" ></textarea>
            </div>
            <div class="mb-3">
              <label for="category" class="form-label">Category</label>
              <select class="form-select" id="category" v-model="produit.category" >
                <option v-for="category in categories" :key="category.name" :value="category.name">{{ category.name }}</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="prix" class="form-label">Price</label>
              <input type="number" class="form-control" id="prix" v-model="produit.prix" >
            </div>
            <div class="mb-3">
              <label for="qte" class="form-label">Quantity</label>
              <input type="number" class="form-control" id="qte" v-model="produit.qte" >
            </div>
            <div class="mb-3">
              <label for="photo" class="form-label">Product Photo</label>
              <input type="file" class="form-control-file" id="photo" @change="handleFileUpload">
            </div>
            <button type="submit" class="btn btn-primary">Update Product</button>
            <router-link :to="{ name: 'viewproduit' }" class="btn btn-secondary">Cancel</router-link>
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
        produit : [],
        categories: [],
        produitId: this.$route.params.id
      };
    },
    mounted() {
      this.getProduit();
      this.getCategories();
    },
    methods: {
      getProduit() {
        axios.get(`http://localhost:8000/api/produit/${this.produitId}`)
          .then(response => {
            this.produit = response.data.produits;
            console.log( this.produit);

          })
          .catch(error => {
            console.error('Error fetching product:', error);
          });
      },
      getCategories() {
        axios.get('http://localhost:8000/api/categorie')
          .then(response => {
            this.categories = response.data.category;
            console.log( this.categories);
          })
          .catch(error => {
            console.error('Error fetching categories:', error);
          });
      },
      updateProduit() {
      axios.put(`http://localhost:8000/api/produit/${this.produitId}`, this.produit)
        .then(res => {
          
          console.log('produit updated:', res.data);
          alert('produit updated:');
          // Optionally, redirect to another page or show a success message
        })
        .catch(error => {
          console.error('Error updating produit:', error);
          // Handle the error (e.g., show an error message to the user)
        });
    },
    handleFileUpload(event) {
  const formData = new FormData();
  formData.append('photo', event.target.files[0]);
  this.produit.photo = formData;
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
  