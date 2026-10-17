package org.javaup.init;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import org.javaup.entity.Shop;
import org.javaup.service.IShopService;
import org.springframework.data.geo.Point;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

import static org.javaup.utils.RedisConstants.SHOP_GEO_KEY;

@Component
public class ShopGeoDataInit {

    @Resource
    private IShopService shopService;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 应用启动时为商铺分类写入 Redis 地理索引，供附近商铺查询使用。
     */
    @PostConstruct
    public void init() {
        List<Shop> shops = shopService.list();
        for (Shop shop : shops) {
            stringRedisTemplate.opsForGeo().add(
                    SHOP_GEO_KEY + shop.getTypeId(),
                    new Point(shop.getX(), shop.getY()),
                    String.valueOf(shop.getId())
            );
        }
    }
}
