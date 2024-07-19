<template>
  <div class="container">
    <div class="card mt-4">
      <div class="card-header bg-dark text-white">
        <h4>Modifier la question</h4>
                            <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button> 
      </div>
      <div class="card-body">
        <form @submit.prevent="updateQuestion">
          <div class="mb-3">
            <label for="titre" class="form-label">Titre</label>
            <input type="text" class="form-control" id="titre" v-model="questions.titre" required>
          </div>
          <div class="mb-3">
            <label for="theme" class="form-label">Thème</label>
            <input type="text" class="form-control" id="theme" v-model="questions.theme" required>
          </div>
          <div class="mb-3">
            <label for="contenu" class="form-label">Contenu</label>
            <textarea class="form-control" id="contenu" rows="5" v-model="questions.contenu" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'QuestionUpdate',
  data() {
    return {
      test: '',
      questions: {}
    };
  },
  mounted() {
    this.test = this.$route.params.id;
    this.getQuestion();
  },
  methods: {
    getQuestion() {
      axios.get(`http://localhost:8000/api/questions/${this.test}`)
        .then(res => {
          this.questions = res.data.questions;
        })
        .catch(error => {
          console.error('Error fetching question:', error);
        });
    },
    updateQuestion() {
      axios.put(`http://localhost:8000/api/questions/${this.test}`, this.questions)
        .then(res => {
          console.log('Question updated:', res.data);
          // Optionally, redirect to another page or show a success message
        })
        .catch(error => {
          console.error('Error updating question:', error);
          // Handle the error (e.g., show an error message to the user)
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
