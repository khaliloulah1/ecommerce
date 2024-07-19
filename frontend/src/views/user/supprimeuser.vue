<template>
    <div class="container mt-5">
      <div class="card">
        <div class="card-body">
          <h2 class="card-title text-center mb-4">Delete User</h2>
          <div v-if="user">
            <p>Are you sure you want to delete user "{{ user.nom }} {{ user.prenom }}"?</p>
            <button @click="deleteUser" class="btn btn-danger">Delete</button>
          </div>
          <div v-else class="alert alert-warning">
            User not found.
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
        user: null
      };
    },
    mounted() {
      this.getUser();
    },
    methods: {
      getUser() {
        const userId = this.$route.params.id;
        axios.get(`http://localhost:8000/api/user/${userId}`)
          .then(response => {
            this.user = response.data.user;
          })
          .catch(error => {
            console.error('Error fetching user:', error);
          });
      },
      deleteUser() {
        const userId = this.$route.params.id;
        if (confirm('Are you sure you want to delete this user?')) {
          axios.delete(`http://localhost:8000/api/user/${userId}`)
            .then(response => {
              console.log('User deleted:', response.data);
              alert('User deleted successfully');
              this.$router.push('/users'); // Redirect to user list after deletion
            })
            .catch(error => {
              console.error('Error deleting user:', error);
              alert('Error deleting user. Please try again.');
            });
        }
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
  