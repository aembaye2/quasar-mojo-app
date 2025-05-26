<template>
  <q-page class="flex flex-center">
    <div class="text-h5">{{ message }}</div>
  </q-page>
</template>

<script setup>
import { ref, onMounted } from 'vue'
const message = ref('Loading...')

onMounted(async () => {
  const res = await fetch('http://localhost:3000/api/hello')
  const data = await res.json()
  message.value = data.message
})
</script>

