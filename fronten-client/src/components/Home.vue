<template>
  <div class="container">
    <h2 class="mb-4">Liste des Produits</h2>

    <!-- Sélecteur de catégorie -->
    <div class="mb-4">
      <label for="categorieSelect">Sélectionner une catégorie :</label>
      <select v-model="selectedCategorie" @change="filtreProduits" class="form-control" id="categorieSelect">
        <option value="">Toutes les catégories</option>
        <option v-for="categorie in categories" :key="categorie.name" :value="categorie.name">{{ categorie.name }}</option>
      </select>
    </div>

    <div class="row">
      <div class="col-md-4 mb-4" v-for="produit in produitsFiltres" :key="produit.id">
        <div class="card h-100 shadow-sm">
          <img class="card-img-top" :src="getPhotoUrl(produit.photo)" :alt="produit.nom">
          <div class="card-body">
            <h5 class="card-title">{{ produit.nom }}</h5>
            <p class="card-text">Prix: {{ produit.prix }} fcfa</p>
            <p class="card-text">Quantité disponible: {{ produit.qte }}</p>
          </div>
          <div class="card-footer">
            <router-link
              :to="{ name: 'details', params: { id: produit.id } }"
              class="btn btn-primary btn-sm"
            >
              Voir détails
            </router-link>
          </div>
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
      produits: [],
      categories: [],
      selectedCategorie: ''
    };
  },
  mounted() {
    this.getProduits();
    this.getCategories();
  },
  methods: {
    getProduits() {
      axios.get('http://localhost:8000/api/produitf')
        .then(response => {
          this.produits = response.data.produits;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des produits :', error);
        });
    },
    getPhotoUrl(filename) {
      return `http://localhost:8000/uploads/produits/${filename}`;
    },
    getCategories() {
      axios.get('http://localhost:8000/api/categorief')
        .then(response => {
          this.categories = response.data.category;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération des catégories :', error);
        });
    },
    filtreProduits() {
      // Méthode pour filtrer les produits en fonction de la catégorie sélectionnée
      // Si aucune catégorie n'est sélectionnée (valeur vide), afficher tous les produits
      if (this.selectedCategorie === '') {
        this.getProduits(); // Récupère à nouveau tous les produits
      } else {
        axios.get(`http://localhost:8000/api/produitf?categorie_id=${this.selectedCategorie}`)
          .then(response => {
            this.produits = response.data.produits;
          })
          .catch(error => {
            console.error('Erreur lors de la récupération des produits filtrés :', error);
          });
      }
    }
  },
  computed: {
    produitsFiltres() {
      // Retourne les produits filtrés en fonction de la catégorie sélectionnée
      if (this.selectedCategorie === '') {
        return this.produits; // Retourne tous les produits si aucune catégorie n'est sélectionnée
      } else {
        return this.produits.filter(produit => produit.category == this.selectedCategorie);
      }
    }
  }
};
</script>

<style scoped>
/* Styles spécifiques au composant */
.card {
  transition: transform 0.3s ease;
  border: 1px solid #e0e0e0;
  border-radius: 5px;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-body {
  min-height: 150px; /* Hauteur minimale pour éviter le saut du contenu */
}

.card-img-top {
  height: 200px; /* Hauteur fixe pour les images */
  object-fit: cover; /* S'assure que l'image est entièrement visible */
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}
</style>
