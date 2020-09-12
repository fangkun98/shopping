package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName Kind
 * @Description TODO
 * @Date 2020/4/19 16:45
 * @Created by FangKun
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Kind implements Serializable {

    private static final long serialVersionUID = 9014504606480635698L;
    private int id;
    private String kind;
    private Date create_time;
}
