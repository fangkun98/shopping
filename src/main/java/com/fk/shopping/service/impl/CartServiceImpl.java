package com.fk.shopping.service.impl;

import com.fk.shopping.dao.CartMapper;
import com.fk.shopping.entity.Cart;
import com.fk.shopping.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName CartServiceImpl
 * @Description TODO
 * @Date 2020/5/4 14:56
 * @Created by FangKun
 */
@Service
public class CartServiceImpl implements CartService {

    @Resource
    CartMapper cartMapper;

    @Override
    public int add(Cart cart) {
        return cartMapper.add(cart);
    }

    @Override
    public List<Cart> getCart(Integer uid) {
        return cartMapper.getCart(uid);
    }

    @Override
    public int del(Integer id) {
        return cartMapper.del(id);
    }

    @Override
    public Cart getCartByPid(Integer pid, Integer uid) {
        return cartMapper.getCartByPid(pid,uid);
    }

    @Override
    public int update(Integer pid, Integer uid) {
        return cartMapper.update(pid,uid);
    }

    @Override
    public int updateSum(Integer id, Integer sum) {
        return cartMapper.updateSum(id,sum);
    }

    @Override
    public int delAllCart(Integer uid) {
        return cartMapper.delAllCart(uid);
    }
}
