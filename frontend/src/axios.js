// src/axios.js

import axios from 'axios';
axios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.getItem('access_token')}`;

const axiosInstance = axios.create({
    baseURL: 'http://localhost:8000/api/', // Remplacez par l'URL de votre backend Laravel
    headers: {
        Authorization: `Bearer ${localStorage.getItem('access_token')}`

    }
});

// Intercepteur pour ajouter le token JWT à chaque requête si disponible
axiosInstance.interceptors.request.use(
    config => {
        const token = localStorage.getItem('access_token');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    error => {
        return Promise.reject(error);
    }
);

/*
function refreshAccessToken() {
    // Appel à votre endpoint pour rafraîchir le token
    axios.post('http://127.0.0.1:8000/api/refresh')
        .then(response => {
            const newToken = response.data.authorisation.token;
            localStorage.setItem('access_token', newToken);

            // Mettre à jour l'en-tête d'autorisation pour les futures requêtes
            axiosInstance.defaults.headers.common['Authorization'] = `Bearer ${newToken}`;

            // Programmer le prochain rafraîchissement juste avant l'expiration
            setTimeout(refreshAccessToken, 14 * 60 * 1000); // Rafraîchir après 14 minutes (pour être sûr)
        })
        .catch(error => {
            console.error('Erreur lors du rafraîchissement du token:', error);
        });
}*/

export default axiosInstance;
