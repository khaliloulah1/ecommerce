<template>
  <div class="container">
    <div class="card">
      <div class="card-header bg-dark text-white">
        <h4>Titre : {{ testitre }}</h4>
        <p>Contenu : {{ testcontenu }}</p>
        <router-link
          :to="{
            path: '/reponses/reponsesadd/:id',
            name: 'reponsesadd',
            params: { id: this.$route.params.id },
          }"
          class="btn btn-info float-end"
        >
          Répondre
        </router-link>
      </div>
      <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button>
      <div class="card-body">
        <div v-if="reponses.length === 0" class="no-responses">
          <p>Aucune réponse trouvée pour cette question.</p>
        </div>
        <div v-else>
          <div v-for="(reponse, index) in reponses" :key="index" class="response">
            <div class="response-header bg-light p-2 mb-3">
              <p class="m-0">Auteur : {{ reponse.auteur }}</p>
              <p class="m-0">Réponse : {{ reponse.valide ? 'Validé' : 'En attente de validation' }}</p>
              <div class="float-end">
                <!-- Bouton pour supprimer -->
                <router-link
                  v-if="userStat === reponse.auteur"
                  :to="{ name: 'supprimereponse', params: { id: reponse.id } }"
                  class="btn btn-danger btn-sm mx-1"
                >
                  <i class="bi bi-trash"></i> <!-- Icône de corbeille -->
                </router-link>
                <!-- Bouton pour modifier -->
                <router-link
                  v-if="userStat === reponse.auteur"
                  :to="{ name: 'updatereponse', params: { id: reponse.id } }"
                  class="btn btn-primary btn-sm mx-1"
                >
                  <i class="bi bi-pencil"></i> <!-- Icône de crayon -->
                </router-link>
              </div>
              <p class="m-0">Date de création : {{ reponse.date_creation }}</p>
            </div>
            <div class="response-content bg-dark text-white p-3 border">
              <p>{{ reponse.contenu }}</p>
              <!-- Lien pour la validation de la réponse (si superviseur) -->
              <router-link
                v-if="reponse.valide === 0 && userStatus === 'superviseur' && userStat != reponse.auteur"
                :to="{ name: 'reponse_valides', params: { id: reponse.id } }"
                class="btn btn-info float-end"
              >
                {{ reponse.valide ? 'Validé' : 'En attente de validation' }}
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'reponsesPage',
  data() {
    return {
      testitre: '',
      testcontenu: '',
      userStatus: '',
      userStat: '',
      reponses: []
    };
  },
  mounted() {
    this.testitre = this.$route.params.titre;
    this.testcontenu = this.$route.params.contenu;
    this.getReponses();
    this.getUserStatus(); // Appeler la méthode pour obtenir le statut de l'utilisateur
  },
  methods: {
    getReponses() {
      axios.get(`http://localhost:8000/api/reponses/${this.$route.params.id}`)
        .then(res => {
          this.reponses = res.data.reponses;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des réponses :', error);
        });
    },
    getUserStatus() {
      axios.get(`http://localhost:8000/api/user`)
        .then(res => {
          this.userStatus = res.data.status; // Supposons que le statut est retourné dans res.data.status
          this.userStat = res.data.name; // Supposons que le nom de l'utilisateur est retourné dans res.data.name
        })
        .catch(error => {
          console.error('Erreur lors de la récupération du statut de l\'utilisateur :', error);
        });
    },
    goBack() {
      this.$router.go(-1); // Méthode pour revenir à la page précédente
    }
  }
};
</script>

<style scoped>
.card {
  margin-top: 20px;
  border: 1px solid #ccc;
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

.response {
  margin-bottom: 20px;
}

.response-header {
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.response-content {
  border: 1px solid #ccc;
  border-radius: 5px;
}

.no-responses {
  margin-top: 10px;
  padding: 10px;
  background-color: #f7f7f7;
  border-radius: 5px;
}
</style>
