<template>
  <div class="container">
    <div class="section">
      <div class="section-header">
        <h2>Liste de tous les produits</h2>
        <button @click="exportExcel" class="btn btn-outline-primary">Exporter en Excel</button>
      </div>
      <!-- Contenu de la section -->
    </div>

    <div class="section">
      <div class="section-header">
        <h2>Liste de tous les clients</h2>
        <button @click="generateAllClientsPdf" class="btn btn-outline-primary">Télécharger en PDF</button>
      </div>
      <!-- Contenu de la section -->
    </div>

    <div class="section">
      <div class="section-header">
        <h2 class="dashboard-title">Tableau de Bord Administratif</h2>
      </div>

      <div class="dashboard-stat">
        <div class="stat">
          <h3 class="stat-title">Nombre total de clients</h3>
          <div class="stat-value">{{ nombreTotalClients }}</div>
        </div>

        <div class="stat">
          <h3 class="stat-title">Nombre de clients par sexe</h3>
          <div class="stat-detail">
            <div class="stat-item">
              <span class="item-label">Hommes</span>
              <span class="item-value">{{ nombreClientsHommes }}</span>
            </div>
            <div class="stat-item">
              <span class="item-label">Femmes</span>
              <span class="item-value">{{ nombreClientsFemmes }}</span>
            </div>
          </div>
        </div>

        <div class="stat">
          <h3 class="stat-title">Nombre total de produits</h3>
          <div class="stat-value">{{ nombreTotalProduits }}</div>
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
      nombreTotalClients: 0,
      nombreClientsHommes: 0,
      nombreClientsFemmes: 0,
      nombreTotalProduits: 0
    };
  },
  mounted() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      axios.get('http://127.0.0.1:8000/api/dashboard/count')
        .then(response => {
          this.nombreTotalClients = response.data.reponses;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération du nombre total de clients : ', error);
        });

      axios.get('http://127.0.0.1:8000/api/dashboard/clientm')
        .then(response => {
          this.nombreClientsHommes = response.data.reponses;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération du nombre de clients masculins : ', error);
        });

      axios.get('http://127.0.0.1:8000/api/dashboard/clientf')
        .then(response => {
          this.nombreClientsFemmes = response.data.reponses;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération du nombre de clients féminins : ', error);
        });

      axios.get('http://127.0.0.1:8000/api/dashboard/produit')
        .then(response => {
          this.nombreTotalProduits = response.data.reponses;
        })
        .catch(error => {
          console.error('Erreur lors de la récupération du nombre total de produits : ', error);
        });
    },
    exportExcel() {
      axios.get('http://localhost:8000/api/export', { responseType: 'blob' })
        .then(response => {
          const url = window.URL.createObjectURL(new Blob([response.data]));
          const link = document.createElement('a');
          link.href = url;
          link.setAttribute('download', 'produits.xlsx');
          document.body.appendChild(link);
          link.click();
        })
        .catch(error => {
          console.error('Erreur lors de l\'exportation en Excel : ', error);
        });
    },
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

<style scoped>
.container {
  max-width: 900px;
  margin: 20px auto;
  padding: 0 20px;
}

.section {
  margin-bottom: 30px;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.btn {
  padding: 8px 16px;
  font-size: 14px;
  cursor: pointer;
}

.btn-outline-primary {
  color: #007bff;
  border-color: #007bff;
}

.btn-outline-primary:hover {
  background-color: #007bff;
  color: #fff;
}

.dashboard-stat {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  grid-gap: 20px;
}

.stat {
  background-color: #f9f9f9;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.stat-title {
  font-size: 18px;
  margin-bottom: 10px;
}

.stat-value {
  font-size: 28px;
  font-weight: bold;
  color: #4CAF50; /* Vert */
}

.stat-detail {
  display: flex;
  justify-content: space-between;
}

.stat-item {
  flex: 1;
  text-align: center;
  padding: 10px;
  background-color: #f2f2f2;
  border-radius: 4px;
  margin: 0 5px;
}

.item-label {
  font-size: 14px;
  color: #555;
}

.item-value {
  font-size: 18px;
  font-weight: bold;
}
</style>
