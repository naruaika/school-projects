<template>
  <div id="app">
    <Chat />
  </div>
</template>

<script>
import Chat from './components/Chat.vue'

export default {
  name: 'App',
  components: {
    Chat
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

h4, h3 {
  margin-top: 2em;
  font-size: inherit;
}

a {
  color: inherit;
  text-decoration: underline;
}
a:hover {
  color: #7fffd4;
}

ul {
  padding-left: 15px !important;
}

img {
  object-fit: cover;
  width: 100%;
}
</style>
