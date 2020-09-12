package com.fk.shopping.dao;

import com.fk.shopping.entity.Kind;

import java.util.List;

/**
 * @ClassName KindMapper
 * @Description TODO
 * @Date 2020/4/19 16:46
 * @Created by FangKun
 */
public interface KindMapper {
    //查询所有种类
     List<Kind> getAllKind();
    //根据id查询种类
    Kind getKindById(Integer cate_id);
}
