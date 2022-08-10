package com.course.generator.server;

import com.course.generator.util.FreemarkerUtil;
import freemarker.template.TemplateException;

import java.io.IOException;

/**
 * @author liuchang
 * @Description 服务
 * @date 2022/8/10
 */
public class ServerGenerator {

    static String toPath = "generator\\src\\main\\java\\com\\course\\generator\\test\\";

    public static void main(String[] args) throws IOException, TemplateException {
        FreemarkerUtil.initConfig("test.ftl");
        FreemarkerUtil.generator(toPath+"Test.java");
    }

}
