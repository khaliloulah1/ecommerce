<template>
  <div class="container">
    <h2>Ajouter Commande</h2>

    <form @submit.prevent="submitForm">
      <div class="form-group">
        <label for="client">Client</label>
        <select v-model="formData.client_id" class="custom-select" required>
          <option value="" disabled>-- Sélectionner un client --</option>
          <option v-for="client in clients" :key="client.id" :value="client.id">{{ client.prenom }} {{ client.nom }}</option>
        </select>
      </div>

      <div class="form-group">
        <label>Date de commande</label>
        <input type="date" v-model="formData.date_commande" class="form-control" required>
      </div>

      <div class="form-group">
        <label>Mode de paiement</label>
        <select v-model="formData.paiement" class="custom-select" required>
          <option value="" disabled>-- Sélectionner un mode de paiement --</option>
          <option value="wave">Wave</option>
          <option value="orange_money">Orange Money</option>
          <option value="cash">Cash</option>
        </select>
      </div>

      <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      formData: {
        client_id: null,
        date_commande: new Date().toISOString().substr(0, 10), // Initialise avec la date du jour
        paiement: '', // Nouvelle propriété pour le mode de paiement
      },
      clients: [],
    };
  },
  mounted() {
    this.fetchClients();
  },
  methods: {
    fetchClients() {
      axios.get('http://localhost:8000/api/client')
        .then(response => {
          this.clients = response.data.clients;
        })
        .catch(error => {
          console.error('Error fetching clients: ', error);
        });
    },
    submitForm() {
      axios.post('http://localhost:8000/api/commandes', this.formData)
        .then(response => {
          console.log('Commande ajoutée avec succès: ', response.data);
          alert('Commande ajoutée avec succès !');
          // Redirection ou autres actions après succès
          // Exemple : this.$router.push('/commandes');
        })
        .catch(error => {
          console.error('Erreur lors de l\'ajout de la commande: ', error.response.data);
          alert('Erreur lors de l\'ajout de la commande.');
        });
    }
  }
};
</script>

<style scoped>
/* Styles spécifiques au composant */
</style>
