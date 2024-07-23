import axios from 'axios';

export default createStore({
  state: {
    user: null,
    accessToken: localStorage.getItem('accessToken') || null,
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
    },
  },
  actions: {
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
  },
  getters: {
    isAuthenticated: state => !!state.accessToken,
    currentUser: state => state.user,
  },
});
