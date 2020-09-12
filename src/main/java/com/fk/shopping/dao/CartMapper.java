package com.fk.shopping.dao;

import com.fk.shopping.entity.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName CartMapper
 * @Description TODO
 * @Date 2020/5/4 14:33
 * @Created by FangKun
 */
public interface CartMapper {
    //添加购物车
    int add(Cart cart);
    //根据用户id查询购物车
    List<Cart> getCart(Integer uid);
    //删除购物车商品
    int del(Integer id);
    //根据pid查询是否已经存在 uid
    Cart getCartByPid(@Param("pid") Integer pid,@Param("uid") Integer uid);
    //当商品重复时  sum+1
    int update(@Param("pid") Integer pid,@Param("uid") Integer uid);
    //动态修改sum
    int updateSum(@Param("id") Integer id,@Param("sum") Integer sum);

    //删除全部
    int delAllCart(Integer uid);
}
