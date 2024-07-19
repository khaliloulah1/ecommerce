<template>
  <div class="container">
    <h2>Liste des Produits dans les Commandes</h2>

    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Produits dans les Commandes</h6>
      </div>
      <div class="card-body">
        <router-link :to="{ name: 'addcommandeproduit' }" class="btn btn-primary mb-3">Ajouter Produit dans la Commande</router-link>


        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th>No</th>
                <th>Produit</th>
                <th>Commande</th>
                <th>Quantité</th>
                <th>Prix</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(commandeproduit, index) in commandeproduits" :key="commandeproduit.id">
                <td>{{ index + 1 }}</td>
                <td>{{ commandeproduit.produit.nom }}</td>
                <td>{{ commandeproduit.commande.numero }}</td>
                <td>{{ commandeproduit.quantite }}</td>
                <td>{{ commandeproduit.prix }}</td>
               
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      commandeproduits: [],
    };
  },
  mounted() {
    this.fetchCommandeProduits();
  },
  methods: {
    fetchCommandeProduits() {
      axios.get('http://localhost:8000/api/commandeproduit')
        .then(response => {
          this.commandeproduits = response.data.commandeproduits;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des produits dans les commandes: ', error);
        });
    },

    editCommandeProduit(id) {
      // Redirection vers la page d'édition du produit dans la commande avec l'id spécifié
      console.log('Editer le produit dans la commande avec ID:', id);
    },

    deleteCommandeProduit(id) {
      if (confirm('Êtes-vous sûr de vouloir supprimer ce produit dans la commande ?')) {
        axios.delete(`http://localhost:8000/api/commandeproduit/${id}`)
          .then(response => {
            console.log('Produit dans la commande supprimé avec succès:', response.data.message);
            // Recharger la liste après suppression
            this.fetchCommandeProduits();
          })
          .catch(error => {
            console.error('Erreur lors de la suppression du produit dans la commande: ', error.response.data);
            alert('Erreur lors de la suppression du produit dans la commande.');
          });
      }
    }
  }
};
</script>

<style scoped>
/* Ajoutez des styles personnalisés ici si nécessaire */
</style>
