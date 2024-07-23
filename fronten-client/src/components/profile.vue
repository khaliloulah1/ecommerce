<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h2 class="card-title text-center mb-4">Profil Utilisateur</h2>
            <div class="form-group">
              <label for="name">Nom</label>
              <input type="text" id="name" class="form-control" v-model="user.name" disabled>
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" id="email" class="form-control" v-model="user.email" disabled>
            </div>
              <div class="form-group">
              <label for="email">Status</label>
              <input type="email" id="status" class="form-control" v-model="user.status" disabled>
            </div>
                 <div class="form-group">
              <label for="rpvalide">Réponse validée</label>
              <input type="email" id="rpvalide" class="form-control" v-model="user.rpvalide" disabled>
            </div>
            <div class="form-group">
              <label for="created_at">Date d'inscription</label>
              <input type="text" id="created_at" class="form-control" v-model="formattedDate" disabled>
            </div>

                      <button type="button" @click="reloadPage" class="btn btn-info">Commencer</button>

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
      user: {}
    };
  },
  created() {
    
    this.fetchUserData();
  },
  methods: {
    fetchUserData() {
      axios.get('user') // Endpoint pour récupérer les informations de l'utilisateur connecté
        .then(response => {
          this.user = response.data; // Supposons que le serveur renvoie directement les infos de l'utilisateur
                    console.log(this.user);

          this.formatDate(this.user.created_at); // Formatage de la date d'inscription (si nécessaire)

        })
        .catch(error => {
          console.error('Erreur lors de la récupération des informations utilisateur:', error);
        });
    },
    formatDate(dateString) {
      // Fonction de formatage de la date, si nécessaire
      // Exemple: this.formattedDate = new Date(dateString).toLocaleDateString();
    }, reloadPage() {

    window.location.reload();

  }
  },
  computed: {
    formattedDate() {
      // Exemple de computed property pour formater la date d'inscription
      return new Date(this.user.created_at).toLocaleDateString();
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
