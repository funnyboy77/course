package com.course.server.service.impl;

import com.course.server.domain.Test;
import com.course.server.mapper.TestMapper;
import com.course.server.service.TestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author liuchang
 * @Description 测试实现类
 * @date 2022/8/4
 */
@Service
public class TestServiceImpl implements TestService {

    @Resource
    TestMapper testMapper;

    @Override
    public List<Test> list() {
        return testMapper.list();
    }
}
