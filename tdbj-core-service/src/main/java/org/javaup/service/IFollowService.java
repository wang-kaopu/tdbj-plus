package org.javaup.service;

import org.javaup.dto.Result;
import org.javaup.entity.Follow;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @program: 探店笔记-plus升级版实战项目。添加 阿星不是程序员 微信，添加时备注 点评 来获取项目的完整资料
 * @description: 关注接口
 * @author: 阿星不是程序员
 **/
public interface IFollowService extends IService<Follow> {

    Result follow(Long followUserId, Boolean isFollow);

    Result isFollow(Long followUserId);

    Result followCommons(Long id);

    /**
     * 查询指定用户关注的用户。
     *
     * @param userId 用户 ID
     * @return 关注用户列表
     */
    Result follows(Long userId);

    /**
     * 查询关注指定用户的用户。
     *
     * @param userId 用户 ID
     * @return 粉丝列表
     */
    Result fans(Long userId);
}
