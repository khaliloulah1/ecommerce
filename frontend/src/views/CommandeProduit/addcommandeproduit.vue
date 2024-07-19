<template>
  <div class="container">
    <h2 class="mb-4">{{ commandeproduit ? 'Modifier Commande Produit' : 'Ajouter Commande Produit' }}</h2>

    <form @submit.prevent="submitForm" class="card shadow mb-4">
      <div class="card-body">
        <div class="form-group">
          <label for="commande_id">Commande</label>
          <select v-model="formData.commande_id" class="custom-select" required>
            <option value="" disabled>-- Sélectionner une commande --</option>
            <option v-for="commande in commandesEnCours" :key="commande.id" :value="commande.id">{{ commande.numero }}</option>
          </select>
        </div>

        <div class="form-group">
          <label for="produit_id">Produit</label>
          <select v-model="formData.produit_id" class="custom-select" required>
            <option value="" disabled>-- Sélectionner un produit --</option>
            <option v-for="produit in produits" :key="produit.id" :value="produit.id">{{ produit.nom }}</option>
          </select>
        </div>

        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="prix">Prix</label>
            <input type="number" v-model="formData.prix" class="form-control" id="prix" name="prix" required>
          </div>

          <div class="form-group col-md-6">
            <label for="quantite">Quantité</label>
            <input type="number" v-model="formData.quantite" class="form-control" id="quantite" name="quantite" required>
          </div>
        </div>
      </div>

      <div class="card-footer">
        <button type="submit" class="btn btn-primary">Enregistrer</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      formData: {
        commande_id: null,
        produit_id: null,
        prix: null,
        quantite: null
      },
      commandes: [],
      produits: [],
      commandeproduit: null // Si tu modifies un commandeproduit existant, assigne les données ici
    };
  },
  mounted() {
    this.fetchCommandes();
    this.fetchProduits();
    // Si tu modifies un commandeproduit, récupère d'abord ses données et assigne-les à this.commandeproduit
  },
  methods: {
    fetchCommandes() {
      axios.get('http://localhost:8000/api/commandes')
        .then(response => {
          // Filtrer les commandes pour ne récupérer que celles avec un état "en cours"
          this.commandes = response.data.commandes.filter(commande => commande.etat === 'en cours');
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des commandes : ', error);
        });
    },

    fetchProduits() {
      axios.get('http://localhost:8000/api/produit')
        .then(response => {
          this.produits = response.data.produits;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des produits : ', error);
        });
    },

    submitForm() {
      axios.post('http://localhost:8000/api/commandeproduit', this.formData)
        .then(response => {
          console.log('Commande produit ajouté avec succès : ', response.data);
          alert('Commande produit ajouté avec succès !');
          // Optionnellement, rediriger ou effectuer d'autres actions après la soumission réussie
        })
        .catch(error => {
          console.error('Erreur lors de l\'ajout du commande produit : ', error.response.data);
          alert('Erreur lors de l\'ajout du commande produit.');
        });
    }
  },
  watch: {
    'formData.produit_id': function(newProduitId) {
      // Trouver le produit sélectionné basé sur produit_id
      let selectedProduit = this.produits.find(produit => produit.id === newProduitId);
      // Mettre à jour formData.prix avec le prix du produit sélectionné
      if (selectedProduit) {
        this.formData.prix = selectedProduit.prix;
      }
    }
  },
  computed: {
    commandesEnCours() {
      return this.commandes.filter(commande => commande.etat === 'en cours');
    }
  }
};
</script>

<style scoped>
/* Styles spécifiques au composant */
.card {
  border: 0;
  border-radius: 0.375rem;
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
}

.card-body {
  padding: 1.5rem;
}

.card-footer {
  background-color: #f8f9fc;
  padding: 1rem 1.5rem;
  text-align: right;
}

.btn-primary {
  background-color: #007bff;
  border-color: #007bff;
}

.btn-primary:hover {
  background-color: #0069d9;
  border-color: #0062cc;
}
</style>
