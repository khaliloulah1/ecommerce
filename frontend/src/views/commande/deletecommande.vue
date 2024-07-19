<template>
    <div class="container">
      <h2>Supprimer Commande</h2>
  
      <div v-if="commande">
        <p><strong>ID:</strong> {{ commande.id }}</p>
        <p><strong>Client:</strong> {{ commande.client_id }}</p>
        <p><strong>Date de commande:</strong> {{ commande.date_commande }}</p>
        <p><strong>Mode de paiement:</strong> {{ commande.paiement }}</p>
  
        <button @click="deleteCommande" class="btn btn-danger">Confirmer la suppression</button>
      </div>
      
      <div v-else>
        <p>Commande introuvable.</p>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        commande: null,
      };
    },
    mounted() {
      this.fetchCommande(); // Charge les détails de la commande à supprimer
    },
    methods: {
      fetchCommande() {
        const commandeId = this.$route.params.id; // Supposons que tu récupères l'ID de la commande depuis les paramètres d'URL
        axios.get(`http://localhost:8000/api/commandes/${commandeId}`)
          .then(response => {
            this.commande = response.data.commande;
          })
          .catch(error => {
            console.error('Error fetching commande details: ', error);
          });
      },
      deleteCommande() {
        const commandeId = this.commande.id;
        axios.delete(`http://localhost:8000/api/commandes/${commandeId}`)
          .then(response => {
            console.log('Commande supprimée avec succès: ', response.data);
            alert('Commande supprimée avec succès !');
            this.$router.push('/commandes'); // Redirige vers la liste des commandes après suppression
          })
          .catch(error => {
            console.error('Erreur lors de la suppression de la commande: ', error.response.data);
            alert('Erreur lors de la suppression de la commande.');
          });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Styles spécifiques au composant */
  </style>
  