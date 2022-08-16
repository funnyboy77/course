package com.course.server.mapper.my;

import org.apache.ibatis.annotations.Param;

/**
 * @author liuchang
 * @Description 课程自定义mapper
 * @date 2022/8/15
 */
public interface MyCourseMapper {

    int updateTime(@Param("courseId") String courseId);

}
