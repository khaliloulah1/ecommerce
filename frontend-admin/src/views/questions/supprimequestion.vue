<template>
  <div class="container">
    <div class="card mt-4">
      <div class="card-header bg-dark text-white">
        <h4>Etes-vous sûr de vouloir valider cette quesion ?</h4>
                            <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button> 

      </div>
      <div class="card-body">
        <table class="table table-bordered">
          <thead>
            <tr>
                            <th>titre</th>
              <th>theme</th>

              <th>Contenu</th>
              <th>Auteur</th>
              <th>Date de création</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr>
                            <td>{{ questions.titre }}</td>
              <td>{{ questions.theme }}</td>

              <td>{{ questions.contenu }}</td>
              <td>{{ questions.auteur }}</td>
              <td>{{ questions.date_creation }}</td>
              <td>
                <div class="mb-3">
                  <button type="button" @click="save" class="btn btn-success">
                    Suppression
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'reponse_valides',
  data() {
    return {
      test: '',
      questions: {}
    };
  },
  mounted() {
    this.test = this.$route.params.id;
    this.getquestions();
  },
  methods: {
    getquestions() {
      axios.get(`http://localhost:8000/api/questions/${this.test}`)
        .then(res => {
          this.questions = res.data.questions;
        })
        .catch(error => {
          console.error('Error fetching data:', error);
        });
    },
    save() {
      axios.delete(`http://localhost:8000/api/questions/${this.test}`)
        .then(res => {
          // Handle response if needed
          console.log('quesions:', res);
        })
        .catch(error => {
          console.error('Error saving data:', error);
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
