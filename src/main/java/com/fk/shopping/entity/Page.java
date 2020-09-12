package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Page
 * @Description TODO
 * @Date 2020/4/19 21:31
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Page {
    private Integer pageNum;
    private Integer pageSize=4;

    public Page(int pageNum) {
        this.pageNum=pageNum;
    }
}
