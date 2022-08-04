package com.course.system.controller;

import com.course.system.domain.Test;
import com.course.system.service.TestService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author liuchang
 * date 2022-08-04
 */
@RestController
public class TestController {

    @Resource
    TestService testService;

    @RequestMapping("/test")
    public List<Test> test() {
        return testService.list();
    }

}
