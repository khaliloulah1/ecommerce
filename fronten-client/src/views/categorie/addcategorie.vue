<template>
    <div class="container">
      <h2>Add New categorie</h2>
      <form @submit.prevent="savecategory">
        <div class="form-group">
          <label for="nom">Nom</label>
          <input type="text" id="name" v-model="category.name" class="form-control" required>
        </div>

   
        <button type="submit" class="btn btn-primary">Enregistrer</button>
      </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        category: {
          name: '',
 
        }
      };
    },
    methods: {
        savecategory() {
        axios.post('http://127.0.0.1:8000/api/categorie', this.category)
          .then(response => {
            console.log('Client added successfully:', response.data);
            alert('Client added successfully.');
            // Redirect to client list or another page
            this.$router.push('/clients'); // Assuming you have a route for client list
          })
          .catch(error => {
            console.error('Error adding client:', error);
            alert('Error adding client. Please check your input.');
          });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your component-specific styles here */
  </style>
  