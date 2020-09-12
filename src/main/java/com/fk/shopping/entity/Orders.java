package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName Orders
 * @Description TODO
 * @Date 2020/5/5 18:31
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders implements Serializable {
    private static final long serialVersionUID = -2205803780517924693L;

    private Integer id;
    private Integer uid;
    private Integer pid;
    private String pname;
    private Integer num;
    private String price;
    private String money;
    private Date create_time;
    private Integer order_state;
    private Integer address_id;

    public Orders(Integer uid, Integer pid, String pname, Integer num, String price, String money, Integer address_id) {
        this.uid = uid;
        this.pid = pid;
        this.pname = pname;
        this.num = num;
        this.price = price;
        this.money = money;
        this.address_id = address_id;
    }
}
