<template>
    <div class="container">
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Liste des commandes</h6>
        </div>
        <div class="card-body">
            <router-link :to="{ name: 'addcommande' }" class="btn btn-primary mb-3">Ajouter Commande</router-link>
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Client</th>
                  <th>Numéro de Commande</th>
                  <th>Date de Commande</th>
                  <th>etat</th>
                  <th>Paiement</th>

                  <th>validation</th>
                  <th>detail</th>

                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(commande, index) in commandes" :key="commande.id">
                  <td>{{ index + 1 }}</td>
                  <td>{{ commande.client.prenom }} {{ commande.client.nom }}</td>
                  <td>{{ commande.numero }}</td>
                  <td>{{ commande.date_commande }}</td>
                  <td>{{ commande.etat }}</td>
                  <td>{{ commande.paiement }}</td>

                  <td> <button @click="etatcommande(commande.id)" class="btn btn-danger">valider</button>
                  </td>
                  <router-link
                  :to="{ name: 'showcommande', params: { id: commande.id } }"
                  class="btn btn-primary btn-sm mx-1"
                >
                  <i class="bi bi-pencil"></i> <!-- Icône de crayon -->
                </router-link>
                  <td>
                    <router-link
                  :to="{ name: 'deletecommande', params: { id: commande.id } }"
                  class="btn btn-danger btn-sm mx-1"
                >
                </router-link>        
                        </td>
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
        commandes: [],
      };
    },
    mounted() {
      this.fetchCommandes();
    },
    methods: {
      fetchCommandes() {
        axios.get('http://localhost:8000/api/commandes')
          .then(response => {
            this.commandes = response.data.commandes;
          })
          .catch(error => {
            console.error('Erreur lors de la récupération des commandes: ', error);
          });
      },
      deleteCommande(id) {
        if (confirm('Êtes-vous sûr de vouloir supprimer cette commande ?')) {
          axios.delete(`http://localhost:8000/api/commandes/${id}`)
            .then(response => {
              console.log('Commande supprimée avec succès: ', response.data);
              alert('Commande supprimée avec succès !');
              this.fetchCommandes(); // Rafraîchit la liste des commandes après la suppression
            })
            .catch(error => {
              console.error('Erreur lors de la suppression de la commande: ', error);
              alert('Erreur lors de la suppression de la commande.');
            });
        }
      }, etatcommande(id) {
        if (confirm('Êtes-vous sûr de vouloir valider la commande ?')) {
          axios.put(`http://localhost:8000/api/etat/${id}`)
            .then(response => {
              console.log('validation avec succès: ', response.data);
              alert('Produit mise à jour avec succès !');
              this.fetchCommandes(); // Rafraîchit la liste des commandes après la suppression
            })
            .catch(error => {
              console.error('Erreur lors de la validation: ', error);
              alert('Erreur lors de la validation');
            });
        }
      }
    }
  };
  </script>
  
  <style scoped>
  /* Styles CSS personnalisés ici si nécessaire */
  </style>
  