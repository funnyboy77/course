package com.course.server.enums;

/**
 * @author liuchang
 * @Description 枚举类
 * @date 2022/8/12
 */
public enum SectionChargeEnum {

    /**
     * C 收费 F 免费
     */
    CHARGE("C","收费"),
    FREE("F","免费");

    private String code;
    private String desc;

    SectionChargeEnum(String code,String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
