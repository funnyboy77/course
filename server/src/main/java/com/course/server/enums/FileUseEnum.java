package com.course.server.enums;

/**
 * @author liuchang
 * date 2022-08-12
 */
public enum FileUseEnum {

    /**
     * C 课程 T 讲师
     */
    COURSE("C", "课程"),
    TEACHER("T", "讲师");

    private String code;

    private String desc;

    FileUseEnum(String code, String desc) {
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
