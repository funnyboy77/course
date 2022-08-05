package com.course.server.mapper;

import com.course.server.domain.Test;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author liuchang
 * @Description 测试mapper
 * @date 2022/8/4
 */
@Mapper
public interface TestMapper {

     List<Test> list();

}
