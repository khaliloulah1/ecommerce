<template>
  <div class="container">
    <!-- Formulaire d'informations client et produits dans le panier -->
    <div>
      <h2>Informations du Client</h2>
      <form @submit.prevent="saveClientAndCommande">
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="nom">Nom</label>
            <input type="text" id="nom" v-model="client.nom" class="form-control" required>
          </div>
          <div class="form-group col-md-6">
            <label for="prenom">Prénom</label>
            <input type="text" id="prenom" v-model="client.prenom" class="form-control" required>
          </div>
        </div>
        <div class="form-group">
          <label for="adresse">Adresse</label>
          <input type="text" id="adresse" v-model="client.adresse" class="form-control">
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="telephone">Téléphone</label>
            <input type="text" id="telephone" v-model="client.telephone" class="form-control">
          </div>
          <div class="form-group col-md-6">
            <label for="sexe">Sexe</label>
            <select id="sexe" v-model="client.sexe" class="form-control">
              <option value="Masculin">Masculin</option>
              <option value="Féminin">Féminin</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="paiement">Mode de Paiement</label>
          <select id="paiement" v-model="client.paiement" class="form-control">
            <option value="wave">Wave</option>
            <option value="orange_money">Orange Money</option>
            <option value="cash">Cash</option>
          </select>
        </div>

        <!-- Affichage des produits dans le panier -->
        <h2>Produits dans le Panier</h2>
        <div v-if="panier.length > 0">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Nom du Produit</th>
                <th>Quantité</th>
                <th>Prix Unitaire</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(produit, index) in panier" :key="index">
                <td>{{ produit.nom }}</td>
                <td>{{ produit.qte }}</td>
                <td>{{ produit.prix }}</td>
                <td>{{ produit.qte * produit.prix }}</td>
              </tr>
            </tbody>
          </table>
          <h4>Total du Panier : {{ calculateTotal() }} fcfa</h4>
          <button type="submit" class="btn btn-primary">Enregistrer Client et Valider la Commande</button>
        </div>
        <div v-else>
          <p>Aucun produit dans le panier.</p>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex';
import axios from 'axios';

export default {
  computed: {
    ...mapGetters(['panier']),
  },
  data() {
    return {
      client: {
        nom: '',
        prenom: '',
        adresse: '',
        telephone: '',
        sexe: 'Masculin',
        paiement: 'wave' // Valeur par défaut pour le mode de paiement

      }
    };
  },
  methods: {
    ...mapActions(['validerCommande']),
    saveClientAndCommande() {
      // Enregistrer le client dans la base de données via API Laravel
      axios.post('http://127.0.0.1:8000/api/clientc', this.client)
        .then(response => {
          console.log('Client ajouté avec succès:', response.data);
          alert('Client ajouté avec succès.');

          // Récupérer l'ID du client créé
          const clientId = response.data.data.id; // Assurez-vous que votre API Laravel renvoie l'ID du client créé
console.log(clientId);
          // Créer la commande associée à ce client
          const dateCommande = new Date().toISOString().slice(0, 19).replace('T', ' '); // Formater la date correctement
      const commandeData = {
        client_id: clientId,
        date_commande: dateCommande,
        paiement: this.client.paiement // Ajout du mode de paiement

      };

          axios.post('http://127.0.0.1:8000/api/commandec', commandeData)
            .then(response => {
              console.log('Commande créée avec succès:', response.data.commande);
              alert('Commande créée avec succès.');
              console.log(response.data.commande);

              // Récupérer l'ID de la commande créée
              const commandeId = response.data.commande.id; // Assurez-vous que votre API Laravel renvoie l'ID de la commande créée
              console.log(commandeId);

              // Enregistrer chaque produit dans la commande produit
              this.panier.forEach(produit => {
                const commandeProduitData = {
                  quantite: produit.qte,
                  prix: produit.prix,
                  commande_id: commandeId,
                  produit_id: produit.id
                };

                axios.post('http://127.0.0.1:8000/api/commandeproduitc', commandeProduitData)
                  .then(response => {
                    console.log('Produit ajouté à la commande avec succès:', response.data);
                    alert('Produit ajouté à la commande avec succès.');
                  })
                  .catch(error => {
                    console.error('Erreur lors de l\'ajout du produit à la commande:', error);
                    alert('Erreur lors de l\'ajout du produit à la commande.');
                  });
              });

              // Redirection ou autre action après l'ajout des produits à la commande
              this.$router.push('/'); // Adapté à votre structure de routes
            })
            .catch(error => {
              console.error('Erreur lors de la création de la commande:', error);
              alert('Erreur lors de la création de la commande. Veuillez réessayer.');
            });

        })
        .catch(error => {
          console.error('Erreur lors de l\'ajout du client:', error);
          alert('Erreur lors de l\'ajout du client. Veuillez vérifier vos données.');
        });
    },
    calculateTotal() {
      // Calculer le montant total du panier
      return this.panier.reduce((total, produit) => total + (produit.qte * produit.prix), 0).toFixed(2);
    }
  }
};
</script>
