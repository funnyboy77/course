package com.course.system.service.impl;

import com.course.system.domain.Test;
import com.course.system.mapper.TestMapper;
import com.course.system.service.TestService;
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
