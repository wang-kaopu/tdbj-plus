# tdbj-vue3

探店笔记电脑端页面，使用 Vue 3、Vite 和 Element Plus。首页提供商户分类与探店笔记，顶部导航可进入笔记发布和个人主页；商户详情、笔记详情、资料页面和登录页面共用居中的电脑端内容区域。窄屏页面会调整为单列或双列布局。

个人主页的“关注”页面通过 `/blog/of/follow` 按发布时间加载已关注用户发布的笔记。继续滚动时使用接口返回的 `minTime` 和 `offset` 查询下一批笔记。

商户附近查询使用 `/shop/of/nearby`，请求参数为 `typeId`、`x`、`y` 和可选的 `current`。关注相关接口提供 `GET /follow/{id}`、`GET /follow/fans/{id}` 与 `DELETE /follow/{id}`。博客图片删除使用 `DELETE /upload/blog/delete?name=/blogs/...`。

上传图片保存在后端配置的 `tdbj.image-upload-dir` 目录，并通过 `/imgs/**` 访问。Vite 开发代理和部署 Nginx 均将此路径转发到后端。

博客图片路径由 `resolveBlogImageUrl` 解析：前端内置图片使用构建后的资源地址，上传图片使用 `/imgs/**` 后端地址。

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Customize configuration

See [Vite Configuration Reference](https://vite.dev/config/).

## Project Setup

```sh
pnpm install
```

### Compile and Hot-Reload for Development

```sh
pnpm dev
```

### Compile and Minify for Production

```sh
pnpm build
```

### 构建检查

```sh
pnpm check
```

### Lint with [ESLint](https://eslint.org/)

```sh
pnpm lint
```
```bash
json-server  --watch  index.json
```
