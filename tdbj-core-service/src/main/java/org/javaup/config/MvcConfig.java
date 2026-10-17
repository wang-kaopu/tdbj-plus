package org.javaup.config;

import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.javaup.utils.LoginInterceptor;
import org.javaup.utils.RefreshTokenInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;

/**
 * @program: 探店笔记-plus升级版实战项目。添加 阿星不是程序员 微信，添加时备注 点评 来获取项目的完整资料
 * @description: 跨域配置
 * @author: 阿星不是程序员
 **/
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Value("${tdbj.image-upload-dir}")
    private String imageUploadDir;

    /** 将上传目录中的文件公开为图片资源。 */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String uploadLocation = Path.of(imageUploadDir).toAbsolutePath().normalize().toUri().toString();
        if (!uploadLocation.endsWith("/")) {
            uploadLocation += "/";
        }
        registry.addResourceHandler("/imgs/**")
                .addResourceLocations(uploadLocation);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 登录拦截器
        registry.addInterceptor(new LoginInterceptor())
                .excludePathPatterns(
                        "/shop/**",
                        "/voucher/**",
                        "/shop-type/**",
                        "/upload/**",
                        "/imgs/**",
                        "/blog/hot",
                        "/user/code",
                        "/user/login"
                ).order(1);
        // token刷新的拦截器
        registry.addInterceptor(new RefreshTokenInterceptor(stringRedisTemplate)).addPathPatterns("/**").order(0);
    }
}
