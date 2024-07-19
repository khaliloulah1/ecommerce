<template>
  <div class="container mt-5">
    <div class="card">
      <div class="card-header bg-dark text-white">
        <h4>Formulaire</h4>
        <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button>
      </div>
      <div class="card-body">
        <div class="mb-3">
          <label for="titreInput">Titre</label>
          <input id="titreInput" type="text" v-model="model.questions.titre" class="form-control"/>
        </div>
        <div class="mb-3">
          <label for="contenuInput">Contenu</label>
          <input id="contenuInput" type="text" v-model="model.questions.contenu" class="form-control"/>
        </div>
        <div class="mb-3">
          <label for="themeSelect">Choisir un thème :</label>
          <select id="themeSelect" v-model="selectedTheme" class="form-control">
            <option v-for="theme in model.availableThemes" :value="theme">{{ theme }}</option>
          </select>
          <button type="button" @click="addTheme" class="btn btn-primary btn-sm mt-2">Ajouter thème</button>
        </div>
        <div class="mb-3">
          <label for="selectedThemesDisplay">Thèmes sélectionnés :</label>
          <ul>
            <li v-for="(theme, index) in model.questions.selectedThemes" :key="index">{{ theme }}</li>
          </ul>
        </div>
        <div class="mb-3">
          <button type="button" @click="save" class="btn btn-info">Enregistrer</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'addquestionsPage',
  data() {
    return {
      model: {
        questions: {
          titre: '',
          contenu: '',
          selectedThemes: []  // Utilisation d'un tableau pour stocker les thèmes sélectionnés
        },
        availableThemes: ['laravel', 'java', 'culture generale']
      },
      selectedTheme: ''
    };
  },
  methods: {
    addTheme() {
      if (this.selectedTheme && !this.model.questions.selectedThemes.includes(this.selectedTheme)) {
        this.model.questions.selectedThemes.push(this.selectedTheme);
      }
      this.selectedTheme = '';  // Réinitialiser la sélection après l'ajout
    },
    save() {
      axios.post('http://127.0.0.1:8000/api/questions', {
        titre: this.model.questions.titre,
        contenu: this.model.questions.contenu,
        theme: this.model.questions.selectedThemes.join(', ')  // Concaténation des thèmes sélectionnés en une chaîne
      })
      .then(res => {
        console.log(res);
        alert(res.data.message);
        this.model.questions = {
          titre: '',
          contenu: '',
          selectedThemes: []
        };
      })
      .catch(err => {
        console.error(err);
        alert('Erreur lors de l\'enregistrement de la question.');
      });
    },
    goBack() {
      this.$router.go(-1);
    }
  }
};
</script>

<style scoped>
/* Styles spécifiques au composant peuvent être ajoutés ici */
</style>
