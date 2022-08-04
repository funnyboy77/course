package com.course.system.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liuchang
 * date 2022-08-04
 */
@RestController
public class TestController {

    @RequestMapping("/test")
    public String test() {
        return "success";
    }

}
