<script setup>
import {
  indexQueryTypes,
  indexQueryHotBlogsScroll,
  indexAddLike,
  indexQueryBlogById
} from '@/api/user'
import { ref } from 'vue'
import router from '@/router'
import { StarFilled } from '@element-plus/icons-vue'
import { resolveBlogImageUrl } from '@/utils/blogImage'

const typeImages = import.meta.glob('/src/assets/imgs/types/*.png', {
  eager: true,
  query: '?url',
  import: 'default'
})
const iconImages = import.meta.glob('/src/assets/imgs/icons/*', {
  eager: true,
  query: '?url',
  import: 'default'
})
const defaultIcon = iconImages['/src/assets/imgs/icons/default-icon.png']
const types = ref([])
const blogs = ref([])
const current = ref(1)
const isLoading = ref(false)
const hasMore = ref(true)

/** 获取首页的商户分类。 */
const queryTypes = async () => {
  try {
    const response = await indexQueryTypes()
    types.value = response.data
  } catch (error) {
    console.error('获取商户分类失败:', error)
  }
}
queryTypes()

/** 按页加载热门笔记。 */
const queryHotBlogsScroll = async () => {
  if (isLoading.value || !hasMore.value) return
  isLoading.value = true
  try {
    const { data } = await indexQueryHotBlogsScroll(current.value)
    data.forEach((blog) => {
      blog.img = blog.images?.split(',')[0] || ''
    })
    blogs.value = blogs.value.concat(data)
    hasMore.value = data.length === 10
  } catch (error) {
    console.error('获取热门笔记失败:', error)
  } finally {
    isLoading.value = false
  }
}
queryHotBlogsScroll()

/** 更新笔记的点赞状态。 */
const addLike = async (blog) => {
  try {
    await indexAddLike(blog.id)
    const { data } = await indexQueryBlogById(blog.id)
    blog.liked = data.liked
    blog.isLike = data.isLike
  } catch (error) {
    console.error('更新点赞状态失败:', error)
  }
}

/** 滚动至笔记列表底部时加载下一页。 */
const onScroll = (event) => {
  const { scrollTop, offsetHeight, scrollHeight } = event.target
  if (
    scrollTop + offsetHeight >= scrollHeight - 12 &&
    !isLoading.value &&
    hasMore.value
  ) {
    current.value++
    queryHotBlogsScroll()
  }
}

/** 打开指定商户分类。 */
const toShopList = (id, name) => {
  router.push({ path: '/shopList', query: { type: id, name } })
}

/** 打开笔记详情。 */
const toBlogDetail = (blog) => {
  router.push(`/blogDetail/${blog.id}`)
}
</script>

<template>
  <div class="home-page">
    <div class="home-hero">
      <div class="home-hero-copy">
        <div class="home-eyebrow">杭州 · 城市生活指南</div>
        <h1>发现身边好去处</h1>
        <p>找美食、逛好店，看看大家分享的真实体验。</p>
      </div>
      <div class="home-hero-actions">
        <a class="home-hero-primary" href="#categories">浏览分类</a>
        <router-link class="home-hero-secondary" to="/blogEdit"
          >分享体验</router-link
        >
      </div>
    </div>

    <section id="categories" class="home-section">
      <div class="home-section-head">
        <div>
          <span>EXPLORE</span>
          <h2>探索分类</h2>
        </div>
        <p>从今天想做的事开始</p>
      </div>
      <div class="type-list">
        <div
          v-for="type in types"
          :key="type.id"
          class="type-box"
          @click="toShopList(type.id, type.name)"
        >
          <div class="type-view">
            <img
              :src="typeImages['/src/assets/imgs' + type.icon]"
              :alt="type.name"
            />
          </div>
          <div class="type-text">{{ type.name }}</div>
        </div>
      </div>
    </section>

    <section class="home-section home-notes">
      <div class="home-section-head">
        <div>
          <span>STORIES</span>
          <h2>热门探店笔记</h2>
        </div>
        <p>看看大家最近去了哪里</p>
      </div>
      <div class="blog-list" @scroll="onScroll">
        <div v-for="blog in blogs" :key="blog.id" class="blog-box">
          <div class="blog-img" @click="toBlogDetail(blog)">
            <img
              :src="resolveBlogImageUrl(blog.img)"
              :alt="blog.title"
            />
          </div>
          <div class="blog-title">{{ blog.title }}</div>
          <div class="blog-foot">
            <div class="blog-user-icon">
              <img
                :src="
                  iconImages['/src/assets' + blog.icon] ||
                  blog.icon ||
                  defaultIcon
                "
                :alt="blog.name"
              />
            </div>
            <div class="blog-user-name">{{ blog.name }}</div>
            <div class="blog-liked" @click="addLike(blog)">
              <el-icon :color="blog.isLike ? '#ff6633' : '#82848a'"
                ><StarFilled
              /></el-icon>
              {{ blog.liked }}
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<style>
@import '@/assets/css/index.css';
</style>
