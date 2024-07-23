<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <router-link to="/" class="navbar-brand">Mon Site E-commerce</router-link>
      <router-link to="/login" class="navbar-brand">Espace client</router-link>

      <button @click="togglePanier" class="btn btn-link nav-link ml-auto" style="position: relative;">
        <i class="bi bi-cart4"></i> Panier <span class="badge badge-primary">{{ nombreProduitsDansPanier }}</span>
      </button>

      <div v-if="panierOuvert" class="dropdown-menu">
        <!-- Contenu du panier -->
        <div class="dropdown-menu-content">
          <h2 class="text-lg font-medium text-gray-900 mb-4">Shopping cart</h2>
          
          <ul class="list-unstyled">
            <li v-for="(produit, index) in panier" :key="index" class="media mb-3">
              <img :src="getPhotoUrl(produit.photo)" class="mr-3" alt="Photo produit">
              <div class="media-body">
                <h5 class="mt-0 mb-1"><a href="#">{{ produit.nom }}</a></h5>
                <p>{{ produit.description }}</p>
                <div class="d-flex justify-content-between align-items-center">
                  <span>Qty {{ produit.qte }}</span>
                  <span>{{ produit.prix }} fcfa</span>
                  <button @click="retirerDuPanier(produit.id)" class="btn btn-sm btn-outline-danger">Remove</button>
                </div>
              </div>
            </li>
          </ul>

          <div class="border-top pt-3 mt-3">
            <div class="d-flex justify-content-between">
              <strong>Subtotal</strong>
              <span>{{ totalPanier }} fcfa</span>
            </div>
            <p class="text-muted small">Shipping and taxes calculated at checkout.</p>
            <router-link
          :to="{
            path: '/Commander',
          }"
       class="btn btn-primary btn-block"
        >
          Commander     </router-link>

            <button @click="fermerPanier" class="btn btn-link btn-block text-center mt-2">Continue Shopping &rarr;</button>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  computed: {
    ...mapGetters(['nombreProduitsDansPanier', 'panier', 'panierOuvert']),
    totalPanier() {
      return this.panier.reduce((total, produit) => total + produit.prix, 0).toFixed(2);
    }
  },
  methods: {
    ...mapActions(['ouvrirPanier', 'fermerPanier', 'retirerDuPanier']),
    togglePanier() {
      if (this.panierOuvert) {
        this.fermerPanier();
      } else {
        this.ouvrirPanier();
      }
    },
    getPhotoUrl(filename) {
      return `http://localhost:8000/uploads/produits/${filename}`;
    }
  }
};
</script>

<style scoped>
.dropdown-menu {
  position: absolute;
  right: 0;
  top: 100%;
  z-index: 1000;
  display: block;
  background-color: #fff;
  box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
  border: 1px solid rgba(0,0,0,.15);
  border-radius: .25rem;
  min-width: 20rem;
}

.dropdown-menu-content {
  padding: 1rem;
}

.dropdown-menu ul {
  margin-bottom: 1rem;
}

.dropdown-menu .media {
  border-bottom: 1px solid rgba(0,0,0,.125);
  padding-bottom: 1rem;
}

.dropdown-menu .media:last-child {
  border-bottom: none;
}

.dropdown-menu .media img {
  max-width: 5rem;
  height: auto;
  border-radius: .25rem;
}

.dropdown-menu .media-body {
  flex: 1;
}

.dropdown-menu .btn-outline-danger {
  color: #dc3545;
  border-color: #dc3545;
}

.dropdown-menu .btn-outline-danger:hover {
  color: #fff;
  background-color: #dc3545;
  border-color: #dc3545;
}

.dropdown-menu .btn-block {
  display: block;
  width: 100%;
}

.dropdown-menu .btn-link {
  color: #007bff;
  text-decoration: none;
}

.dropdown-menu .btn-link:hover {
  text-decoration: underline;
}
</style>
