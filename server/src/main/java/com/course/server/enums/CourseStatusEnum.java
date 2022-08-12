package com.course.server.enums;

/**
 * @author liuchang
 * date 2022-08-12
 */
public enum CourseStatusEnum {

    /**
     * P 发布 D 草稿
     */
    PUBLISH("P", "发布"),
    DRAFT("D", "草稿");

    private String code;

    private String desc;

    CourseStatusEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
