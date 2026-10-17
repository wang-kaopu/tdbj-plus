package org.javaup.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import org.javaup.dto.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

/**
 * @program: 探店笔记-plus升级版实战项目。添加 阿星不是程序员 微信，添加时备注 点评 来获取项目的完整资料
 * @description: 上传api
 * @author: 阿星不是程序员
 **/
@Slf4j
@RestController
@RequestMapping("upload")
public class UploadController {
    @Value("${tdbj.image-upload-dir}")
    private String imageUploadDir;

    /** 保存笔记图片，并返回前端使用的图片路径。 */
    @PostMapping("blog")
    public Result uploadImage(@RequestParam("file") MultipartFile image) {
        try {
            // 获取原始文件名称
            String originalFilename = image.getOriginalFilename();
            // 生成新文件名
            String fileName = createNewFileName(originalFilename);
            // 保存文件
            image.transferTo(new File(imageUploadDir, fileName.substring(1)));
            // 返回结果
            log.debug("文件上传成功，{}", fileName);
            return Result.ok(fileName);
        } catch (IOException e) {
            throw new RuntimeException("文件上传失败", e);
        }
    }

    /** 删除上传目录中的笔记图片。 */
    @GetMapping("/blog/delete")
    public Result deleteBlogImg(@RequestParam("name") String filename) {
        Path uploadRoot = Path.of(imageUploadDir).toAbsolutePath().normalize();
        Path file = uploadRoot.resolve(filename.startsWith("/") ? filename.substring(1) : filename).normalize();
        if (!file.startsWith(uploadRoot.resolve("blogs")) || Files.isDirectory(file)) {
            return Result.fail("错误的文件名称");
        }
        FileUtil.del(file.toFile());
        return Result.ok();
    }

    /** 按 UUID 散列目录生成笔记图片的相对路径。 */
    private String createNewFileName(String originalFilename) {
        // 获取后缀
        String suffix = StrUtil.subAfter(originalFilename, ".", true);
        // 生成目录
        String name = UUID.randomUUID().toString();
        int hash = name.hashCode();
        int d1 = hash & 0xF;
        int d2 = (hash >> 4) & 0xF;
        // 判断目录是否存在
        File dir = new File(imageUploadDir, StrUtil.format("blogs/{}/{}", d1, d2));
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 生成文件名
        return StrUtil.format("/blogs/{}/{}/{}.{}", d1, d2, name, suffix);
    }
}
