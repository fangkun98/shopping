package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @ClassName Product
 * @Description TODO
 * @Date 2020/4/19 17:24
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable {

    private static final long serialVersionUID = 7210875447193949657L;
    private int id;
    private String trade;
    private BigDecimal price;
    private Date create_time;
    private int stars;
    private String detail;
    private int cate_id;
    private String path;
}
