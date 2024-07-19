<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h2 class="card-title text-center mb-4">Inscription</h2>
            <form @submit.prevent="register">
              <div class="form-group">
                <label for="nom">Nom</label>
                <input type="text" id="nom" class="form-control" v-model="form.nom" required>
              </div>
              <div class="form-group">
                <label for="prenom">Prénom</label>
                <input type="text" id="prenom" class="form-control" v-model="form.prenom" required>
              </div>
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" class="form-control" v-model="form.email" required>
              </div>
              <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" class="form-control" v-model="form.password" required>
              </div>
              <div class="form-group">
                <label for="photo">Photo de profil</label>
                <input type="file" id="photo" class="form-control-file" @change="handleFileUpload">
              </div>
              <button type="submit" class="btn btn-primary btn-block">S'inscrire</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from '../axios'; // Assurez-vous que votre configuration d'axios est correcte

export default {
  data() {
    return {
      form: {
        nom: '',
        prenom: '',
        email: '',
        password: '',
        photo: null, // Utilisez null pour stocker l'objet de fichier
      }
    };
  },
  methods: {
  register() {
    let formData = new FormData();
    formData.append('nom', this.form.nom);
    formData.append('prenom', this.form.prenom);
    formData.append('email', this.form.email);
    formData.append('password', this.form.password);
    formData.append('photo', this.form.photo);

    axios.post('register', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
    .then(response => {
      console.log(response); // Vérifier la structure de la réponse
      const token = response.data.authorization.token;
      
      localStorage.setItem('access_token', token);
      this.$router.push('/profile');
    })
    .catch(error => {
      console.error('Erreur d\'inscription:', error);
    });
  },
  handleFileUpload(event) {
    this.form.photo = event.target.files[0]; // Stocke le fichier sélectionné dans form.photo
  }
}

};
</script>
<style scoped>
.card {
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-title {
  font-size: 1.5rem;
}

.form-group {
  margin-bottom: 1rem;
}

.btn-primary {
  background-color: #0077cc;
  border-color: #0077cc;
}

.btn-primary:hover {
  background-color: #0056b3;
  border-color: #0056b3;
}

.btn-block {
  display: block;
  width: 100%;
}
</style>
