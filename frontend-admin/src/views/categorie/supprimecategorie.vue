<template>
    <div class="container">
      <div class="card mt-4">
        <div class="card-header bg-dark text-white">
          <h4>Confirmation de suppression</h4>
          <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button>
        </div>
        <div class="card-body">
          <p>Êtes-vous sûr de vouloir supprimer  ?</p>
          <p><strong>Nom:</strong> {{ category.name }}</p>
       
          <button @click="deletecategory" class="btn btn-danger">Supprimer </button>
        </div>
      </div>
    </div>
  </template>
  <script>
  import axios from 'axios';
  
  export default {
    name: 'deletecategory',
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
      this.getcategory();
    },
    methods: {
        getcategory() {
        axios.get(`http://localhost:8000/api/categorie/${this.categoryId}`)
          .then(res => {
            this.category = res.data.category;
          })
          .catch(error => {
            console.error('Error fetching categorie:', error);
          });
      },
      deletecategory() {
        axios.delete(`http://localhost:8000/api/categorie/${this.categoryId}`)
          .then(res => {
            console.log('categorie deleted:', res.data);
            // Optionally, redirect to another page or show a success message
            this.$router.push({ name: 'viewcategorie' }); // Example: Redirect to client list page
          })
          .catch(error => {
            console.error('Error deleting categorie:', error);
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
  