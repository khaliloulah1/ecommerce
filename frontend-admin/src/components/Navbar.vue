<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <div class="container">
      <router-link class="navbar-brand" to="/">My adminPanel</router-link>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item" v-if="isLoggedIn">
            <router-link class="nav-link" to="/profile">Profil</router-link>
          </li>
          <li class="nav-item" v-if="isLoggedIn">
            <a class="nav-link" href="#" @click="logout">Déconnexion</a>
          </li>
          <li class="nav-item" v-if="!isLoggedIn">
            <router-link class="nav-link" to="/login">Connexion</router-link>
          </li>
          <li class="nav-item" v-if="!isLoggedIn">
            <router-link class="nav-link" to="/register">Inscription</router-link>
          </li>
         
          <li class="nav-item" v-if="isLoggedIn &&( userStatus === 'Responsable Commande' || userStatus === 'Admin')">
            <RouterLink class="nav-link "  to="/client/viewclient"> client</RouterLink>
          </li>
      
          <li class="nav-item" v-if="isLoggedIn">
          <RouterLink class="nav-link "  to="/categorie/viewcategorie"> categorie</RouterLink>
          </li>
        
          <li class="nav-item" v-if="isLoggedIn">
          <RouterLink class="nav-link "  to="/produit/viewproduit"> produit</RouterLink>
          </li>
         
          <li class="nav-item" v-if="isLoggedIn &&( userStatus === 'Admin' )">
            <RouterLink class="nav-link "  to="/user/viewuser"> User</RouterLink>
          </li>
          <li class="nav-item" v-if="isLoggedIn &&( userStatus === 'Responsable Commande' || userStatus === 'Admin')">
          <RouterLink class="nav-link "  to="/commande/viewcommande"> Panier</RouterLink>
          </li>
          <li class="nav-item" v-if="isLoggedIn &&( userStatus === 'Responsable Commande' || userStatus === 'Admin')">
            <RouterLink class="nav-link "  to="/commande/viewcommandeproduit"> Commande</RouterLink>
          </li>
        
      
        <li class="nav-item" v-if="isLoggedIn">
          <RouterLink class="nav-link "  to="/Dashboard">Dashboard</RouterLink>
        </li>
        
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import axios from '../axios';

export default {
  data() {
    return {
      isLoggedIn: false,
      user: {},
      userStatus: '',

    };
  },
  created() {
    this.isLoggedIn = localStorage.getItem('access_token') !== null;
    console.log(localStorage.getItem('access_token'));
    this.fetchUserData();

  },
  methods: {
    logout() {
      axios.post('http://127.0.0.1:8000/api/logout')
        .then(response => {
          localStorage.removeItem('access_token');
          this.isLoggedIn = false;
          this.$router.push('/login');
        })
        .catch(error => {
          console.error('Erreur lors de la déconnexion:', error);
        });
    },    fetchUserData() {
      axios.get('http://127.0.0.1:8000/api/userl') // Assurez-vous que 'user' est votre endpoint pour récupérer les infos de l'utilisateur connecté
        .then(response => {
          this.user = response.data.user; 
          this.userStatus = response.data.user.status; // Supposons que le statut est retourné dans res.data.status
            console.log(this.userStatus);
          // Assurez-vous que response.data contient les informations de l'utilisateur correctement
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des informations utilisateur:', error);
        });
    },
  },
};
</script>

<style scoped>
/* Styles spécifiques à la barre de navigation */
.navbar {
  border-radius: 5px;
}

.nav-link {
  color: white !important;
}

.navbar-brand {
  font-size: 1.5rem;
}

.navbar-toggler {
  border-color: white;
}

.navbar-toggler-icon {
  background-color: white;
}

.navbar-dark .navbar-nav .nav-link {
  transition: all 0.3s ease;
}

.navbar-dark .navbar-nav .nav-link:hover {
  color: rgba(255, 255, 255, 0.8) !important;
}

@media (max-width: 768px) {
  .navbar {
    border-radius: 0;
  }
}
</style>
