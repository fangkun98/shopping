package com.fk.shopping.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName MessageResults
 * @Description TODO
 * @Date 2020/4/12 15:22
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageResults {
    private Integer code;
    private String message;
}
