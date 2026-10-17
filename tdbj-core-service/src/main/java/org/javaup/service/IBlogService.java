package org.javaup.service;

import org.javaup.dto.Result;
import org.javaup.entity.Blog;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @program: 探店笔记-plus升级版实战项目。添加 阿星不是程序员 微信，添加时备注 点评 来获取项目的完整资料
 * @description: 博客接口
 * @author: 阿星不是程序员
 **/
public interface IBlogService extends IService<Blog> {

    Result queryHotBlog(Integer current);

    Result queryBlogById(Long id);

    Result likeBlog(Long id);

    Result queryBlogLikes(Long id);

    Result saveBlog(Blog blog);

    /**
     * 删除当前登录用户发布的笔记及其关联数据。
     *
     * @param id 笔记 ID
     * @return 删除结果
     */
    Result deleteBlog(Long id);

    Result queryBlogOfFollow(Long max, Integer offset);

}
