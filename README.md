# images — 博客图床

博客用的图片仓库，通过 **jsDelivr CDN** 引用。不经过博客构建，也不依赖 GitHub raw。

## 结构

```
wallpapers/           壁纸，按配色分类
  blue/landscape/01.webp
  red/portrait/03.webp
map.json              相对路径 -> jsDelivr 直链的映射表
gen_map.sh            重新生成 map.json
```

配色目录：`blue` / `cyan` / `gray` / `green` / `orange` / `pink` / `purple` / `red`

## 怎么取图

博客侧读 `map.json`，键是相对路径，值是 CDN 直链：

```
blue/landscape/01.webp
  -> https://cdn.jsdelivr.net/gh/kssku/images@main/wallpapers/blue/landscape/01.webp
```

## 加图流程

1. 图片放进 `wallpapers/<配色>/<方向>/`
2. 在 NAS 上执行 `./gen_map.sh`（输出路径写死为 `/vol1/1000/github/images/map.json`）
3. 提交推送，jsDelivr 几分钟内生效

## 为什么走 jsDelivr

GitHub raw 在国内时通时不通，博客加载会卡；jsDelivr 是 CDN，加载快，也不消耗仓库的 API 配额。
