package com.fk.shopping.service.impl;

import com.fk.shopping.dao.OrdersMapper;
import com.fk.shopping.entity.Orders;
import com.fk.shopping.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName OrdersServiceImpl
 * @Description TODO
 * @Date 2020/5/5 19:54
 * @Created by FangKun
 */
@Service
public class OrdersServiceImpl implements OrdersService {

    @Resource
    OrdersMapper ordersMapper;

    @Override
    public List<Orders> getAllOrders(Integer uid) {
        return ordersMapper.getAllOrders(uid);
    }

    @Override
    public int updateOrders(Integer order_state, Integer id) {
        return ordersMapper.updateOrders(order_state,id);
    }

    @Override
    public int addOrders(Orders orders) {
        return ordersMapper.addOrders(orders);
    }

    @Override
    public int delOrder(Integer id) {
        return ordersMapper.delOrder(id);
    }
}
