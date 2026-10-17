const bundledBlogImages = import.meta.glob('/src/assets/imgs/blogs/**/*', {
  eager: true,
  query: '?url',
  import: 'default'
})

/** 根据博客图片路径返回前端内置图片或后端上传图片的访问地址。 */
export function resolveBlogImageUrl(imagePath) {
  if (!imagePath) return ''
  return bundledBlogImages[`/src/assets${imagePath}`] || imagePath
}
