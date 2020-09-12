package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @ClassName Address
 * @Description TODO
 * @Date 2020/5/5 9:32
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Address implements Serializable {
    private static final long serialVersionUID = -8659454807138770300L;
    private Integer id;
    private Integer uid;
    private String name;
    private String phone;
    private String province;
    private String city;
    private String detail;
    private Integer state;

    public Address(Integer uid, String name, String phone, String province, String city, String detail) {
        this.uid = uid;
        this.name = name;
        this.phone = phone;
        this.province = province;
        this.city = city;
        this.detail = detail;

    }
}
