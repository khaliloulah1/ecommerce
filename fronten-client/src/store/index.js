import { createStore } from 'vuex';
import axios from 'axios';

export default createStore({
  state: {
    user: null,
    accessToken: localStorage.getItem('accessToken') || null,
    panier: [], // Tableau des produits dans le panier
    panierOuvert: false // État pour indiquer si le panier est ouvert ou fermé
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    setAccessToken(state, accessToken) {
      state.accessToken = accessToken;
      axios.defaults.headers.common['Authorization'] = `Bearer ${accessToken}`;
      localStorage.setItem('accessToken', accessToken);
    },
    logout(state) {
      state.user = null;
      state.accessToken = null;
      delete axios.defaults.headers.common['Authorization'];
      localStorage.removeItem('accessToken');
      state.panier = []; // Vider le panier lors de la déconnexion
    },
    ajouterAuPanier(state, produit) {
      state.panier.push(produit);
    },
    retirerDuPanier(state, produitId) {
      const index = state.panier.findIndex(p => p.id === produitId);
      if (index !== -1) {
        state.panier.splice(index, 1);
      }
    },
    
    // Mutation pour ouvrir ou fermer le panier
    setPanierOuvert(state, isOpen) {
      state.panierOuvert = isOpen;
    }
  },
  actions: {
    retirerDuPanier({ commit }, produitId) {
      commit('retirerDuPanier', produitId);
    },
    async login({ commit }, credentials) {
      try {
        const response = await axios.post('http://127.0.0.1:8000/api/login', credentials);
        commit('setUser', response.data.user);
        commit('setAccessToken', response.data.access_token);
      } catch (error) {
        throw new Error('Login failed. Please check your credentials.');
      }
    },
    async register({ commit }, userData) {
      try {
        const response = await axios.post('http://127.0.0.1:8000/api/register', userData);
        commit('setUser', response.data.user);
        commit('setAccessToken', response.data.access_token);
      } catch (error) {
        throw new Error('Registration failed. Please try again later.');
      }
    },
    async logout({ commit }) {
      try {
        await axios.post('http://127.0.0.1:8000/api/logout');
        commit('logout');
      } catch (error) {
        console.error('Logout failed:', error);
      }
    },
    // Action pour ouvrir le panier
    ouvrirPanier({ commit }) {
      commit('setPanierOuvert', true);
    },
    // Action pour fermer le panier
    fermerPanier({ commit }) {
      commit('setPanierOuvert', false);
    }
  }, 
  getters: {
    isAuthenticated: state => !!state.accessToken,
    currentUser: state => state.user,
    panier: state => state.panier,
    nombreProduitsDansPanier: state => state.panier.length,
    panierOuvert: state => state.panierOuvert
  }
});
