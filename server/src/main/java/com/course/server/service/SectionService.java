package com.course.server.service;

import com.course.server.domain.Section;
import com.course.server.domain.SectionExample;
import com.course.server.dto.SectionDto;
import com.course.server.dto.PageDto;
import com.course.server.dto.SectionPageDto;
import com.course.server.mapper.SectionMapper;
import com.course.server.util.CopyUtil;
import com.course.server.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

import java.util.Date;

/**
 * @author liuchang
 * @Description 大章服务层
 * @date 2022/8/8
 */
@Service
public class SectionService {
    @Resource
    SectionMapper sectionMapper;

    /**
     * 列表查询
     */
    public void list(SectionPageDto sectionPageDto) {
        PageHelper.startPage(sectionPageDto.getPage(),sectionPageDto.getSize());
        SectionExample sectionExample = new SectionExample();
        SectionExample.Criteria criteria = sectionExample.createCriteria();
        if (!StringUtils.isEmpty(sectionPageDto.getCourseId())) {
            criteria.andCourseIdEqualTo(sectionPageDto.getCourseId());
        }
        if (!StringUtils.isEmpty(sectionPageDto.getChapterId())) {
            criteria.andChapterIdEqualTo(sectionPageDto.getChapterId());
        }
        sectionExample.setOrderByClause("sort asc");
        List<Section> sectionsList = sectionMapper.selectByExample(sectionExample);
        PageInfo<Section> pageInfo = new PageInfo<>(sectionsList);
        sectionPageDto.setTotal(pageInfo.getTotal());
        List<SectionDto> sectionDtoList = CopyUtil.copyList(sectionsList,SectionDto.class);
        sectionPageDto.setList(sectionDtoList);
    }

    /**
     * 保存，id有值时更新，无值时新增
     */
    public void save(SectionDto sectionDto) {
        Section section = CopyUtil.copy(sectionDto,Section.class);
        if (StringUtils.isEmpty(sectionDto.getId())) {
            this.insert(section);
        }else {
            this.update(section);
        }

    }

    /**
     * 新增
     */
    private void insert(Section section) {
        Date now = new Date();
        section.setId(UuidUtil.getShortUuid());
        sectionMapper.insert(section);
    }

    /**
     * 更新
     */
    private void update(Section section) {
        sectionMapper.updateByPrimaryKey(section);
    }

    /**
     * 删除
     */
    public void delete(String id) {
        sectionMapper.deleteByPrimaryKey(id);
    }

}