<template>
  <div class="container">
    <div class="card mt-4">
      <div class="card-header bg-dark text-white">
        <h4>Etes-vous sûr de vouloir valider cette réponse ?</h4>
                            <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button> 

      </div>
      <div class="card-body">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Contenu</th>
              <th>Auteur</th>
              <th>Validé</th>
              <th>Date de création</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{{ reponses.contenu }}</td>
              <td>{{ reponses.auteur }}</td>
              <td>{{ reponses.valide ? 'Oui' : 'Non' }}</td>
              <td>{{ reponses.date_creation }}</td>
              <td>
                <div class="mb-3">
                  <button type="button" @click="save" class="btn btn-success">
                    Supprimer
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
  name: 'supprimereponse',
  data() {
    return {
      test: '',
      reponses: {}
    };
  },
  mounted() {
    this.test = this.$route.params.id;
    this.getReponses();
  },
  methods: {
    getReponses() {
      axios.get(`http://localhost:8000/api/Valide_reponses/${this.test}`)
        .then(res => {
          this.reponses = res.data.reponses;
        })
        .catch(error => {
          console.error('Error fetching data:', error);
        });
    },
    save() {
      axios.delete(`http://localhost:8000/api/reponses/${this.test}`)
        .then(res => {
          // Handle response if needed
          console.log('Response:', res);
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
