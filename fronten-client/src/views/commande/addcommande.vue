<template>
    <div class="container">
      <h2>Ajouter une commande</h2>
  
      <!-- Sélection du client -->
      <div class="form-group">
        <label for="client">Client</label>
        <select v-model="selectedClient" class="form-control" id="client">
          <option v-for="client in clients" :key="client.id" :value="client.id">{{ client.nom }}</option>
        </select>
      </div>
  
      <!-- Liste des produits avec quantité -->
      <div class="form-group">
        <label>Produits</label>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Produit</th>
              <th>Quantité disponible</th>
              <th>Quantité à commander</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(produit, index) in produits" :key="produit.id">
              <td>{{ produit.nom }}</td>
              <td>{{ produit.qte }}</td>
              <td>
                <input type="number" v-model="quantites[index]" class="form-control" min="1" :max="produit.qte">
                <span v-if="quantites[index] < 1" class="text-danger">La quantité doit être au moins 1</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
  
      <!-- Montant total de la commande -->
      <div class="form-group">
        <label for="montantTotal">Montant total de la commande</label>
        <input type="text" class="form-control" id="montantTotal" :value="montantTotal" disabled>
      </div>
  
      <!-- Bouton d'ajout de la commande -->
      <button @click="ajouterCommande" class="btn btn-primary">Ajouter Commande</button>
  
      <!-- Affichage des erreurs -->
      <div v-if="erreurCommande" class="alert alert-danger mt-3">
        {{ erreurCommande }}
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        clients: [],
        produits: [],
        selectedClient: null,
        quantites: [], // Array to store quantities for each product
        erreurCommande: '', // Error message for command submission
      };
    },
    mounted() {
      // Fetch clients and products data on component mount
      this.fetchClients();
      this.fetchProduits();
    },
    methods: {
      fetchClients() {
        axios.get('http://localhost:8000/api/client')
          .then(response => {
            this.clients = response.data.clients;
            if (this.clients.length > 0) {
              this.selectedClient = this.clients[0].id; // Select the first client by default
            }
          })
          .catch(error => {
            console.error('Error fetching clients: ', error);
          });
      },
      fetchProduits() {
        axios.get('http://localhost:8000/api/produit')
          .then(response => {
            this.produits = response.data.produits;
            this.quantites = new Array(this.produits.length).fill(0); // Initialize quantities array
          })
          .catch(error => {
            console.error('Error fetching produits: ', error);
          });
      },
      ajouterCommande() {
        // Check if any quantity is less than 1
        const isQuantiteValide = this.quantites.every(qte => qte >= 1);
        if (!isQuantiteValide) {
          this.erreurCommande = 'La quantité de chaque produit doit être au moins 1.';
          return;
        }
  
        // Prepare data to send to backend
        const commandeData = {
          client_id: this.selectedClient,
          produits: this.produits.map((produit, index) => ({
            produit_id: produit.id,
            quantite: parseInt(this.quantites[index]) // Convert string to integer
          }))
        };
  
        // Send data to backend to add the commande
        axios.post('http://localhost:8000/api/commandes', commandeData)
          .then(response => {
            console.log('Commande ajoutée avec succès: ', response.data);
            // Optionally, you can redirect or show a success message
            alert('Commande ajoutée avec succès !');
          })
          .catch(error => {
            console.error('Erreur lors de l\'ajout de la commande: ', error.response.data);
            // Handle error, show error message to user
            this.erreurCommande = 'Erreur lors de l\'ajout de la commande.';
          });
      }
    },
    computed: {
      // Calculating total amount based on selected quantities and product prices
      montantTotal() {
        let total = 0;
        this.produits.forEach((produit, index) => {
          total += produit.prix * this.quantites[index];
        });
        return total.toFixed(2); // Format total to two decimal places
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add custom styles here if needed */
  </style>
  