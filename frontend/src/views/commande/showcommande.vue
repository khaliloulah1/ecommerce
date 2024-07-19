<template>
  <div class="container">
    <div class="card shadow mb-4" v-if="commande">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Détails de la commande</h6>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-md-6">
            <h5>Informations de la commande</h5>
            <p><strong>Numéro de commande:</strong> {{ commande.numero }}</p>
            <p><strong>Date de commande:</strong> {{ commande.date_commande }}</p>
            <p><strong>Paiement:</strong> {{ commande.paiement }}</p>

            <p v-if="commande.client"><strong>Client:</strong> {{ commande.client.nom }} {{ commande.client.prenom }}</p>
          </div>
          <div class="col-md-6">
            <h5>Produits commandés</h5>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Produit</th>
                  <th>Quantité</th>
                  <th>Prix unitaire</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(commandeproduit, index) in commandeproduits" :key="index">
                  <td>{{ commandeproduit.produit.nom }}</td>
                  <td>{{ commandeproduit.quantite }}</td>
                  <td>{{ commandeproduit.prix }}</td>
                  <td>{{ commandeproduit.quantite * commandeproduit.prix }}</td>
                </tr>
              </tbody>
            </table>
            <h5>Total de la commande: {{ total }}</h5>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <p>Loading...</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      commande: null,
      commandeproduits: [],
      total: 0,
      loading: true,
      error: null,
    };
  },
  mounted() {
    this.fetchCommande();
  },
  methods: {
    fetchCommande() {
      const commandeId = this.$route.params.id;
      axios.get(`http://localhost:8000/api/commandes/${commandeId}`)
        .then(response => {
          this.commande = response.data.commande;
          this.commandeproduits = response.data.commandeproduits;
          this.calculateTotal();
        })
        .catch(error => {
          console.error('Error fetching commande:', error);
          this.error = 'Error fetching data.';
        });
    },
    calculateTotal() {
      this.total = this.commandeproduits.reduce((accumulator, commandeproduit) => {
        return accumulator + (commandeproduit.quantite * commandeproduit.prix);
      }, 0);
    }
  }
};
</script>

<style scoped>
/* Ajoutez des styles CSS spécifiques si nécessaire */
</style>
