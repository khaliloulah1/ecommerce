<template>
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-body">
              <h2 class="card-title text-center mb-4">Add New Product</h2>
              <form @submit.prevent="addProduit">
                <div class="mb-3">
                  <label for="nom" class="form-label">Product Name</label>
                  <input type="text" class="form-control" id="nom" v-model="form.nom" required>
                </div>
                <div class="mb-3">
                  <label for="description" class="form-label">Description</label>
                  <textarea class="form-control" id="description" v-model="form.description" required></textarea>
                </div>
                <div class="mb-3">
                  <label for="id_category" class="form-label">Category</label>
                  <select class="form-select" id="id_category" v-model="form.id_category" required>
                    <option v-for="category in categories" :key="category.name" :value="category.name">{{ category.name }}</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="prix" class="form-label">Price</label>
                  <input type="number" class="form-control" id="prix" v-model="form.prix" required>
                </div>
                <div class="mb-3">
                  <label for="qte" class="form-label">Quantity</label>
                  <input type="number" class="form-control" id="qte" v-model="form.qte" required>
                </div>
                <div class="mb-3">
                  <label for="photo" class="form-label">Product Photo</label>
                  <input type="file" class="form-control-file" id="photo" @change="handleFileUpload">
                </div>
                <button type="submit" class="btn btn-primary">Add Product</button>
              </form>
            </div>
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
        form: {
          nom: '',
          description: '',
          id_category: '',
          prix: '',
          qte: '',
          photo: null
        },
        categories: [] // To store categories fetched from backend
      };
    },
    mounted() {
      this.getCategories();
    },
    methods: {
      getCategories() {
        axios.get('http://localhost:8000/api/categorie') // Adjust endpoint as per your Laravel setup
          .then(response => {
            this.categories = response.data.category;
            console.log(this.categories);
          })
          .catch(error => {
            console.error('Error fetching categories:', error);
          });
      },
      addProduit() {
        let formData = new FormData();
        formData.append('nom', this.form.nom);
        formData.append('description', this.form.description);
        formData.append('id_category', this.form.id_category);
        formData.append('prix', this.form.prix);
        formData.append('qte', this.form.qte);
        formData.append('photo', this.form.photo);
  
        axios.post('http://localhost:8000/api/produit', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })
        .then(response => {
          console.log('Product added:', response.data);
          alert('Product added successfully');
          this.resetForm();
          // Optionally, redirect to product list page or perform other actions
        })
        .catch(error => {
          console.error('Error adding product:', error);
        });
      },
      handleFileUpload(event) {
        this.form.photo = event.target.files[0];
      },
      resetForm() {
        this.form.nom = '';
        this.form.description = '';
        this.form.id_category = '';
        this.form.prix = '';
        this.form.qte = '';
        this.form.photo = null;
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
  
  .form-group {
    margin-bottom: 1rem;
  }
  
  .btn-primary {
    background-color: #0077cc;
    border-color: #0077cc;
  }
  
  .btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
  }
  
  .btn-block {
    display: block;
    width: 100%;
  }
  </style>
  