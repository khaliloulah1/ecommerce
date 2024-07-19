<template>
  <div class="container mt-4">
    <div class="card">
      <div class="card-header">
        <h4>Tu as une question, clique ici
          <router-link to="/questions/addquestions" class="btn btn-info float-end">Poser une question</router-link>
        </h4>
      </div>
      <div class="card-body">
        <div v-if="questions.length === 0" class="text-center">
          <p>Loading questions...</p>
        </div>
        <div v-else>
          <div class="list-group">
            <router-link
              v-for="question in questions"
              :key="question.id"
              :to="{ name: 'questionsPage', params: { id: question.id ,contenu: question.contenu ,titre: question.titre } }"
              class="list-group-item list-group-item-action"
            >
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">{{ question.titre }}</h5>
                <small>{{ formatDate(question.date_creation) }}</small>
              </div>
              <p class="mb-1">{{ question.contenu }}</p>
              <small>{{ question.theme }} - {{ question.auteur }}</small>
              
              <!-- Boutons d'action -->
              <div class="float-end">
                <!-- Bouton pour supprimer -->
                <router-link
                  v-if="userStatus === question.auteur"
                  :to="{ name: 'supprimequestion', params: { id: question.id } }"
                  class="btn btn-danger btn-sm mx-1"
                >
                  <i class="bi bi-trash"></i> <!-- Icône de corbeille -->
                </router-link>
                
                <!-- Bouton pour modifier -->
                <router-link
                  v-if="userStatus === question.auteur"
                  :to="{ name: 'updatequestion', params: { id: question.id } }"
                  class="btn btn-primary btn-sm mx-1"
                >
                  <i class="bi bi-pencil"></i> <!-- Icône de crayon -->
                </router-link>
              </div>
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'questionsADD',
  data() {
    return {
      userStatus: '',
      questions: []
    };
  },
  mounted() {
    this.getQuestions();
    this.getUserStatus(); // Appeler la méthode pour obtenir le statut de l'utilisateur
  },
  methods: {
    getQuestions() {
      axios.get('http://localhost:8000/api/questions')
        .then(response => {
          this.questions = response.data.questions;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des questions :', error);
        });
    },
    getUserStatus() {
      axios.get(`http://localhost:8000/api/user`)
        .then(res => {
          this.userStatus = res.data.name; // Supposons que le statut est retourné dans res.data.name
        })
        .catch(error => {
          console.error('Erreur lors de la récupération du statut de l\'utilisateur :', error);
        });
    },
    formatDate(dateStr) {
      const options = { year: 'numeric', month: 'short', day: 'numeric' };
      return new Date(dateStr).toLocaleDateString('fr-FR', options);
    }
  }
};
</script>

<style>
/* Vous pouvez ajouter du CSS personnalisé pour styliser les boutons ou les icônes */
</style>
