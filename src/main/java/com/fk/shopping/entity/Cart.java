package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @ClassName Cart
 * @Description TODO
 * @Date 2020/5/4 14:32
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart implements Serializable {
    private static final long serialVersionUID = 3289888479998039025L;

    private  Integer id;
    private String pname;
    private BigDecimal price;
    private Integer sum;
    private Integer uid;
    private Integer pid;

}
