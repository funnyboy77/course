package com.course.system.service;

import com.course.system.domain.Test;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liuchang
 * @Description 测试接口
 * @date 2022/8/4
 */
@Service
public interface TestService {

     List<Test> list();

}
