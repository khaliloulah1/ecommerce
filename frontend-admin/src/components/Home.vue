<template>
  <div class="client-list">
    <h2>Liste de tous les clients</h2>

    <button @click="generateAllClientsPdf">Télécharger en PDF</button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  methods: {
    generateAllClientsPdf() {
      axios.get('http://localhost:8000/api/clients/pdf/all', { responseType: 'blob' })
        .then(response => {
          const url = window.URL.createObjectURL(new Blob([response.data]));
          const link = document.createElement('a');
          link.href = url;
          link.setAttribute('download', 'clients_all.pdf');
          document.body.appendChild(link);
          link.click();
        })
        .catch(error => {
          console.error('Erreur lors de la génération du PDF : ', error);
        });
    }
  }
};
</script>

<style>
/* Styles spécifiques au composant client-list */
</style>
