package com.fk.shopping.service;

import com.fk.shopping.entity.Kind;

import java.util.List;

/**
 * @ClassName KindService
 * @Description TODO
 * @Date 2020/4/19 16:49
 * @Created by FangKun
 */
public interface KindService {
    //查询所有种类
    public List<Kind> getAllKind();
    //根据id查询种类
    Kind getKindById(Integer cate_id);
}
