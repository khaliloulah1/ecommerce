<template>
  <div class="container mt-4">
    <div class="row">
      <div class="col-md-6">
        <img class="card-img-top" :src="getPhotoUrl(produit.photo)" :alt="produit.nom">
      </div>
      <div class="col-md-6">
        <h2>{{ produit.nom }}</h2>
        <p class="text-muted">{{ produit.description }}</p>
        <p>Prix: {{ produit.prix }} €</p>
        <p>Quantité disponible: {{ produit.qte }}</p>
        
        <!-- Sélecteur de quantité amélioré -->
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <button @click="decrementQuantity" class="btn btn-outline-secondary" :disabled="selectedQuantity <= 1">-</button>
          </div>
          <input type="text" v-model.number="selectedQuantity" class="form-control text-center" :max="produit.qte" :min="1">
          <div class="input-group-append">
            <button @click="incrementQuantity" class="btn btn-outline-secondary" :disabled="selectedQuantity >= produit.qte">+</button>
          </div>
        </div>
        
        <div class="mt-4">
          <button @click="ajouterAuPanier(produit, selectedQuantity)" class="btn btn-primary btn-block">
            Ajouter au panier
          </button>
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
      produit: {},         // Détails du produit actuel
      selectedQuantity: 1  // Quantité sélectionnée par défaut
    };
  },
  mounted() {
    this.getProduitDetails();
  },
  methods: {
    getProduitDetails() {
      const produitId = this.$route.params.id;
      axios.get(`http://localhost:8000/api/produitf/${produitId}`)
        .then(response => {
          this.produit = response.data.produits;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération du produit :', error);
        });
    },
    getPhotoUrl(filename) {
      return `http://localhost:8000/uploads/produits/${filename}`;
    },
    ajouterAuPanier(produit, quantity) {
      if (quantity > produit.qte) {
        alert(`La quantité sélectionnée dépasse la quantité disponible (${produit.qte})`);
        return;
      }
      
      // Créer une copie du produit avec la quantité sélectionnée
      const produitToAdd = {
        ...produit,
        qte: quantity
      };
      
      // Appel de la mutation Vuex pour ajouter au panier
      this.$store.commit('ajouterAuPanier', produitToAdd);
      
      alert('Produit ajouté au panier !');
    },
    incrementQuantity() {
      if (this.selectedQuantity < this.produit.qte) {
        this.selectedQuantity++;
      } else {
        alert(`Vous avez atteint la quantité maximale disponible (${this.produit.qte})`);
      }
    },
    decrementQuantity() {
      if (this.selectedQuantity > 1) {
        this.selectedQuantity--;
      }
    }
  }
};
</script>

<style scoped>
/* Styles spécifiques au composant */
.img-fluid {
  max-width: 100%;
  height: auto;
}
</style>
