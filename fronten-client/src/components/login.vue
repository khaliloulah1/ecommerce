<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h2 class="card-title text-center mb-4">Connexion</h2>
            <form @submit.prevent="login">
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" class="form-control" v-model="form.email" required>
              </div>
              <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" class="form-control" v-model="form.password" required>
              </div>
              <button type="submit" class="btn btn-primary btn-block">Se connecter</button>
            </form>
            <router-link to="/register" class="navbar-brand">S'inscrire </router-link>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from '../axios';

export default {
  data() {
    return {
      form: {
        email: '',
        password: ''
      }
    };
  },
  methods: {
    login() {
      axios.post('http://127.0.0.1:8000/api/login', this.form)
        .then(response => {
          const token = response.data.authorization.token;
          localStorage.setItem('access_token', token);
          
          this.$router.push('/profile'); // Rediriger vers la page de profil après connexion

        })
        .catch(error => {
          console.error('Erreur de connexion:', error);
        });
        
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
