<template>

    <div class="container mt-5">
        <div class="card">
    
        <div class="card-header bg-dark text-white">
            <h4> Ajouter une reponse</h4>
                    <button @click="goBack" class="btn btn-secondary btn-sm float-start">Retour</button> 

        </div>
    
        <div class="card-body ">
         
         
            <div class="mb-3">
                <label for="">contenu</label>
                <input type="text" v-model="model.reponses.contenu" class="form-control"/>
    
                </div>
             

           
            <div class="mb-3">
        <button type="button"  @click="saveaddreponses" class="btn btn-info">Enregistrer</button>
                
            </div>
        </div>
    
        </div>
    </div>
    
    
    </template>
     <script>
    import axios from 'axios'
    export default{
    name : 'reponsesADD',
    data(){
    return{
    model: {
        reponses: {
                contenu: '',
                               question_id: this.$route.params.id,

            }
    
    }
    } 
    
    },
    methods: {
        saveaddreponses(){
    axios.post('http://127.0.0.1:8000/api/reponses', this.model.reponses).then(res =>{
    console.log(res);
    alert(res.data.message);
    this.model.reponses= {
                contenu: '',
                                             question_id: this.$route.params.id,

            }
    
    })
    
    
    },
     goBack() {
      this.$router.go(-1); // Méthode pour revenir à la page précédente
    }
    },
    
    }
     </script>
    