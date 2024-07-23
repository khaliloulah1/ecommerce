<template>
  <div class="container">
    <div class="card mt-4">
      <div class="card-header bg-dark text-white">
        <h4>Modifier la réponse</h4>
                            <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button> 
      </div>
      <div class="card-body">
        <form @submit.prevent="updateReponse">
          <div class="mb-3">
            <label for="contenu" class="form-label">Contenu</label>
            <textarea class="form-control" id="contenu" rows="5" v-model="reponse.contenu" required></textarea>
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
  name: 'ReponseUpdate',
  data() {
    return {
      test: '',
      reponse: {}
    };
  },
  mounted() {
    this.test = this.$route.params.id;
    this.getReponse();
  },
  methods: {
    getReponse() {
      axios.get(`http://localhost:8000/api/Valide_reponses/${this.test}`)
        .then(res => {
          this.reponse = res.data.reponses;
        })
        .catch(error => {
          console.error('Error fetching reponse:', error);
        });
    },
    updateReponse() {
      axios.put(`http://localhost:8000/api/reponses/${this.test}`, this.reponse)
        .then(res => {
          console.log('Reponse updated:', res.data);
          // Optionally, redirect to another page or show a success message
        })
        .catch(error => {
          console.error('Error updating reponse:', error);
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
