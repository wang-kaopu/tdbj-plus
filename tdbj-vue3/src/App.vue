<script setup>
import { useUserStore } from '@/stores/modules/user'

const userStore = useUserStore()
</script>

<template>
  <div class="site-shell">
    <header class="site-header">
      <div class="site-header-inner">
        <router-link class="site-brand" to="/index"
          >探店<span>笔记</span></router-link
        >
        <nav class="site-nav" aria-label="主导航">
          <router-link to="/index">发现</router-link>
          <router-link to="/blogEdit">发布笔记</router-link>
          <router-link to="/InfoHtml">我的主页</router-link>
        </nav>
        <router-link v-if="!userStore.token" class="site-login" to="/login"
          >登录 / 注册</router-link
        >
      </div>
    </header>
    <main class="site-main">
      <router-view />
    </main>
  </div>
</template>
